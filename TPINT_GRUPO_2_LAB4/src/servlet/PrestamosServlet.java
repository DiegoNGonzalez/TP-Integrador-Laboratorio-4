package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cliente;
import negocio.ClienteNegocio;
import negocioImpl.ClienteNegocioImpl;

@WebServlet("/PrestamosServlet")
public class PrestamosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PrestamosServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		System.out.print(idUsuario);
		ClienteNegocio clienteNegocio = new ClienteNegocioImpl();
		Cliente cliente = clienteNegocio.obtenerClientePorIdUsuario(idUsuario);
		        
		if(action.equals("listarMisPrestamos")) {
	        if (cliente == null) {
	            // Si el cliente no existe redirecciono.
				System.out.println("El cliente no existe.");
	            request.getRequestDispatcher("Error.jsp").forward(request, response);
	        } else {
	            request.setAttribute("cliente", cliente);
	            request.getRequestDispatcher("MisPrestamos.jsp").forward(request, response);
	        }
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
