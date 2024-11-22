package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cuota;
import entidades.Prestamo;
import negocio.CuotaNegocio;
import negocio.PrestamoNegocio;
import negocioImpl.CuotaNegocioImpl;
import negocioImpl.PrestamoNegocioImpl;

/**
 * Servlet implementation class BuscarPrestamoServlet
 */
@WebServlet("/BuscarPrestamoServlet")
public class BuscarPrestamoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuscarPrestamoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int prestamoId = Integer.parseInt(request.getParameter("prestamoId"));
		PrestamoNegocio prestamoNegocio = new PrestamoNegocioImpl();
		CuotaNegocio cuotaNegocio = new CuotaNegocioImpl();
		try {
			Prestamo prestamo = prestamoNegocio.prestamoXId(prestamoId);
			ArrayList<Cuota> cuotas = cuotaNegocio.listarCuotasPorPrestamo(prestamoId);
			
			// Calcula las cuotas pagadas y el monto adeudado
	        int cuotasPagadas = (int) cuotas.stream().filter(Cuota::isEstado).count();//solo cuotas con estado en true
	        int cuotasPendientes = prestamo.getCantCuotas() - cuotasPagadas;
	        float montoAdeudado = (float)cuotas.stream()//convierte la lista en un flujo para poder filtrar
	            .filter(cuota -> !cuota.isEstado()) // filtra solo las pendientes
	            .mapToDouble(Cuota::getMontoAPagar) // muesta el valor de cada cuota
	            .sum(); //suma todos los montos de cuotas pendientes y lo guarda en montoAdeudado
	        
	        float montoSolicitado = prestamo.getImporteSolicitado();
	        float montoFinal = prestamo.getImporteTotal();
	        float montoAbonado = 0;
	        if("Activo".equals(prestamo.getEstado()) || "Finalizado".equals(prestamo.getEstado()) ) {
	        	if(cuotasPagadas == 0) {
	        		montoAbonado = 0;
	        	}else {	
	        		montoAbonado = montoFinal - montoAdeudado;
	        	}
	        }
	        request.setAttribute("montoSolicitado", montoSolicitado);
	        request.setAttribute("montoAbonado", montoAbonado);
	        request.setAttribute("prestamo", prestamo);
	        request.setAttribute("cuotasPagadas", cuotasPagadas);
	        request.setAttribute("cuotasPendientes", cuotasPendientes);
	        request.setAttribute("montoAdeudado", montoAdeudado);
	        request.setAttribute("montoFinal", montoFinal);
			
	        request.getRequestDispatcher("DetallePrestamo.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
