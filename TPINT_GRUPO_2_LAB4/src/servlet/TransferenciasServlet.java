package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cliente;
import entidades.Cuenta;
import negocio.ClienteNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.CuentaNegocioImpl;


@WebServlet("/TransferenciasServlet")
public class TransferenciasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TransferenciasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		System.out.print(idUsuario);
		ClienteNegocio clienteNegocio = new ClienteNegocioImpl();
		Cliente cliente = clienteNegocio.obtenerClientePorIdUsuario(idUsuario);
		        
        if (cliente == null) {
            // Si el cliente no existe redirecciono.
			System.out.println("El cliente no existe.");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        } else {
            request.setAttribute("cliente", cliente);
            request.getRequestDispatcher("Transferencia.jsp").forward(request, response);
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
