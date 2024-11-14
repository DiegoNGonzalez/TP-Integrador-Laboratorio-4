package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.ClienteNegocio;
import negocioImpl.ClienteNegocioImpl;

/**
 * Servlet implementation class BajaClienteServlet
 */
@WebServlet("/BajaClienteServlet")
public class BajaClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BajaClienteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clienteIdParam = request.getParameter("clienteId");

        
        if (clienteIdParam != null && !clienteIdParam.isEmpty()) {
            try {
                int idCliente = Integer.parseInt(clienteIdParam);
                ClienteNegocioImpl clienteNegocio = new ClienteNegocioImpl();

                
                boolean resultado = clienteNegocio.bajaCliente(idCliente);

             
                if (resultado) {
                    request.setAttribute("toastMessage", "Cliente eliminado exitosamente.");
                    request.setAttribute("toastType", "success");
                } else {
                    request.setAttribute("toastMessage", "No se pudo eliminar el cliente.");
                    request.setAttribute("toastType", "error");
                }
            } catch (NumberFormatException e) {
                
                request.setAttribute("mensaje", "ID de cliente no válido.");
            }
        } else {
            request.setAttribute("mensaje", "ID de cliente no proporcionado.");
        }

        
        request.getRequestDispatcher("ListarClientesServlet").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
