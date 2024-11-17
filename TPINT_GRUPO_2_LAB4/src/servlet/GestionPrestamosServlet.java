package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Prestamo;
import negocio.PrestamoNegocio;
import negocioImpl.PrestamoNegocioImpl;

/**
 * Servlet implementation class GestionPrestamosServlet
 */
@WebServlet("/GestionPrestamosServlet")
public class GestionPrestamosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestionPrestamosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrestamoNegocio prestamoNegocio = new PrestamoNegocioImpl();
        ArrayList<Prestamo> prestamosPendientes = prestamoNegocio.listarPrestamosPendientes();
        ArrayList<Prestamo> prestamosAprobados = prestamoNegocio.listarPrestamosAprobados();
        ArrayList<Prestamo> prestamosRechazados = prestamoNegocio.listarPrestamosRechazados();

        request.setAttribute("prestamosPendientes", prestamosPendientes);
        request.setAttribute("prestamosAprobados", prestamosAprobados);
        request.setAttribute("prestamosRechazados", prestamosRechazados);


        request.getRequestDispatcher("GestionPrestamos.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
