package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cliente;
import entidades.Cuenta;
import entidades.Cuota;
import entidades.Prestamo;
import negocio.PrestamoNegocio;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.CuotaNegocioImpl;
import negocioImpl.PrestamoNegocioImpl;

/**
 * Servlet implementation class BuscarCuotasServlet
 */
@WebServlet("/BuscarCuotasServlet")
public class BuscarCuotasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuscarCuotasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Cliente cliente = (Cliente) request.getSession().getAttribute("Cliente"); // Guarda el cliente de la session
		Integer idCliente = cliente.getIdCliente(); //captura su id
		String action = request.getParameter("action");
		CuotaNegocioImpl auxCuotaNegocio = new CuotaNegocioImpl();
		PrestamoNegocio prestamoNeg = new PrestamoNegocioImpl();
		int prestamoId;

		if ("listarPendientes".equals(action)) {
	        // Obtener las cuotas pendientes de un préstamo específico
			prestamoId = Integer.parseInt(request.getParameter("prestamoId"));
			request.setAttribute("prestamoId", prestamoId);
		}
		else {
			prestamoId = (Integer) request.getAttribute("prestamoId");			
		}
		

	    ArrayList<Cuota> cuotasPendientes = auxCuotaNegocio.listarCuotasPendientesPorPrestamo(prestamoId);
	    if(cuotasPendientes.size() == 0) {
	        	prestamoNeg.finalizarPrestamo(prestamoId);
	        }
	        request.setAttribute("cuotasPendientes", cuotasPendientes);
	
		CuentaNegocioImpl cuentaNegocio = new CuentaNegocioImpl();
        ArrayList<Cuenta> listaCuentas = cuentaNegocio.obtenerCuentasPorCliente(idCliente);
        
        if (listaCuentas == null) {
            listaCuentas = new ArrayList<>(); //lista vacía si no se encontraron cuentas
        }
        request.setAttribute("listaCuentas", listaCuentas);
		
        request.getRequestDispatcher("PagoPrestamo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
