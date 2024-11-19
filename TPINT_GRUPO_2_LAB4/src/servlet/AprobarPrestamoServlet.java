package servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entidades.Prestamo;
import exceptions.PrestamoNegocioException;
import negocio.PrestamoNegocio;
import negocioImpl.PrestamoNegocioImpl;


@WebServlet("/AprobarPrestamoServlet")
public class AprobarPrestamoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AprobarPrestamoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int prestamoId = Integer.parseInt(request.getParameter("prestamoId"));
        PrestamoNegocio prestamoNegocio = new PrestamoNegocioImpl();
        Prestamo prestamo = prestamoNegocio.prestamoXId(prestamoId);

        if (prestamo != null) {      	
	        try {
	        	prestamoNegocio.SP_AprobarPrestamo(prestamo);
	            response.sendRedirect("GestionPrestamosServlet");
	        } catch (PrestamoNegocioException e) {
	            // Si ocurre un PrestamoNegocioException, capturamos el mensaje y lo pasamos al JSP
	        	request.getSession().setAttribute("errorMsj", e.getMessage());
	            response.sendRedirect("Error.jsp");  // Redirigir a Error.jsp
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // En caso de una excepción de SQL, redirigimos a Error.jsp con un mensaje general
	            request.getSession().setAttribute("errorMsj", "Ocurrió un error en la base de datos.");
	            response.sendRedirect("Error.jsp");
	        }  	
	     }
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
