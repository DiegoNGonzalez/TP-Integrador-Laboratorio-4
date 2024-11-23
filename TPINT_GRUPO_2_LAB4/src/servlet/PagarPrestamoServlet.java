package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Cliente;
import entidades.Cuenta;
import negocio.CuotaNegocio;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.CuotaNegocioImpl;

/**
 * Servlet implementation class PagarPrestamoServlet
 */
@WebServlet("/PagarPrestamoServlet")
public class PagarPrestamoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PagarPrestamoServlet() {
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
		String idCuotaStr = request.getParameter("cuota");
		String idCuentaStr = request.getParameter("cuentaDebito");
		int prestamoId = Integer.parseInt(request.getParameter("prestamoId"));		
		
		int idCuota = Integer.parseInt(idCuotaStr);
		int idCuenta = Integer.parseInt(idCuentaStr);
		
		Cliente clienteSesion = new Cliente(); 
		CuentaNegocioImpl cuentaNegocio = new CuentaNegocioImpl();
		
		HttpSession session = request.getSession(false);
		if (session != null) {
			clienteSesion = (Cliente) session.getAttribute("Cliente");
		}

		CuotaNegocio cuotaNegocio= new CuotaNegocioImpl();	
		String mensaje=cuotaNegocio.pagarCuotaSP(idCuota, idCuenta);
		
		if(mensaje=="La cuota se pagó exitosamente.") {
				if (clienteSesion != null) {
					int idCliente = clienteSesion.getIdCliente();
					ArrayList<Cuenta> cuentasCliente = cuentaNegocio.obtenerCuentasPorCliente(idCliente);
					for(Cuenta cuenta : cuentasCliente) {
					}
					clienteSesion.setCuentas(cuentasCliente);
					session.setAttribute("Cliente", clienteSesion);
				}
			//response.sendRedirect("BuscarCuentaServlet?cuentaId="+idCuenta+"&action=detalleCuenta");
			response.sendRedirect("ListarPrestamosServlet?mensaje=cuota_paga");
		}else {
			request.setAttribute("cuotaSeleccionada", idCuotaStr);
			request.setAttribute("cuentaDebitoSeleccionada", idCuentaStr);	
			request.setAttribute("prestamoId", prestamoId);				
			request.setAttribute("toastMessage", mensaje);
			request.setAttribute("toastType", "warning");
            request.getRequestDispatcher("BuscarCuotasServlet").forward(request, response);
		}

	}

}
