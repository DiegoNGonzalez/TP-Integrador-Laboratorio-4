package servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoImpl.CuentaDaoImpl;
import daoImpl.CuotaDaoImpl;
import daoImpl.PrestamoDaoImpl;
import entidades.Cliente;
import entidades.Cuota;
import entidades.Prestamo;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.CuotaNegocioImpl;
import negocioImpl.PrestamoNegocioImpl;

/**
 * Servlet implementation class SolicitarPrestamoServlet
 */
@WebServlet("/SolicitarPrestamoServlet")
public class SolicitarPrestamoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SolicitarPrestamoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        float importe = Float.parseFloat(request.getParameter("importe"));
	        int cuotas = Integer.parseInt(request.getParameter("cuotas"));
	        int cuentaDestinoId = Integer.parseInt(request.getParameter("cuentaDestino"));

	        Prestamo nuevoPrestamo = new Prestamo();
	        nuevoPrestamo.setImporteTotal(importe);
	        nuevoPrestamo.setCantCuotas(cuotas);
	        nuevoPrestamo.setPlazo(cuotas);
	        //float importeCuota = Float.valueOf(importe).divide(Float.valueOf(cuotas), 2, RoundingMode.HALF_UP);
	        float importeCuota = Math.round((importe / cuotas) * 100.0) / 100.0f;
	        nuevoPrestamo.setImporteCuota(importeCuota);
	        nuevoPrestamo.setCuenta(new CuentaNegocioImpl().obtenerCuentaPorId(cuentaDestinoId));
	        nuevoPrestamo.setFechaAltaPrestamo(new Date(System.currentTimeMillis()));
	        nuevoPrestamo.setEstado("Pendiente");

	        Cliente cliente = (Cliente) request.getSession().getAttribute("Cliente");
	        nuevoPrestamo.setCliente(cliente);

	        boolean exito = new PrestamoNegocioImpl().agregarPrestamo(nuevoPrestamo);

	        if (exito) {
	            response.sendRedirect("ListarPrestamosServlet?mensaje=prestamo_pendiente");
	        } else {
	            request.setAttribute("errorMsj", "No se pudo procesar la solicitud en la DB.");
	            request.getRequestDispatcher("Error.jsp").forward(request, response);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("errorMsj", "Error al procesar el pr�stamo. Verifique los datos.");
	        request.getRequestDispatcher("Error.jsp").forward(request, response);
	    }
	}

	}

