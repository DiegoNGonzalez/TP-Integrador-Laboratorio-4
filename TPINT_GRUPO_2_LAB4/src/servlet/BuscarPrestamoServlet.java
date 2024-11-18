package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Prestamo;
import negocio.PrestamoNegocio;
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
		try {
			Prestamo prestamo = prestamoNegocio.prestamoXId(prestamoId);
			request.setAttribute("prestamo", prestamo);
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
