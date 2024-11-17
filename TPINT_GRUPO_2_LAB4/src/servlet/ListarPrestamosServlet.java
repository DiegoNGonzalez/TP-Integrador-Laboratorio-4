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
import entidades.Prestamo;
import negocio.PrestamoNegocio;
import negocioImpl.PrestamoNegocioImpl;

/**
 * Servlet implementation class ListarPrestamosServlet
 */
@WebServlet("/ListarPrestamosServlet")
public class ListarPrestamosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListarPrestamosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        Cliente cliente = (Cliente) session.getAttribute("Cliente");
        PrestamoNegocio prestamoNegocio = new PrestamoNegocioImpl();

        if (cliente != null) {
        	try {

            ArrayList<Prestamo> prestamos = prestamoNegocio.listarPrestamosXCliente(cliente.getIdCliente());

            request.setAttribute("prestamos", prestamos);
            
            String mensaje = request.getParameter("mensaje");
            if (mensaje != null && mensaje.equals("prestamo_pendiente")) {
                request.setAttribute("mensaje", "Préstamo solitado correctamente.");
            }

            request.getRequestDispatcher("MisPrestamos.jsp").forward(request, response);
        	}
        	catch (Exception e) {
        		e.printStackTrace();
        	}
        } else {

            response.sendRedirect("Login.jsp");
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
