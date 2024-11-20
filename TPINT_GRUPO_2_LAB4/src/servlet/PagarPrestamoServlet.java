package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CuotaNegocio;
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

		
		int idCuota = Integer.parseInt(idCuotaStr);
		int idCuenta = Integer.parseInt(idCuentaStr);
		System.err.println("idcuota");
		System.out.println(idCuota);
		System.err.println("idcuenta");
		System.out.println(idCuenta);

		CuotaNegocio cuotaNegocio= new CuotaNegocioImpl();
		String mensaje=cuotaNegocio.pagarCuotaSP(idCuota, idCuenta);
		if(mensaje=="La cuota se pagó exitosamente.") {
			response.sendRedirect("BuscarCuentaServlet?cuentaId="+idCuenta+"&action=detalleCuenta");
		}else {
			request.setAttribute("errorMsj", mensaje);
            request.getRequestDispatcher("Error.jsp").forward(request, response);
		}

	}

}
