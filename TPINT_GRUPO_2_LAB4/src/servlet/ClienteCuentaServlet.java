package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cliente;
import negocio.ClienteNegocio;
import negocioImpl.ClienteNegocioImpl;

/**
 * Servlet implementation class ClienteCuentaServlet
 */
@WebServlet("/ClienteCuentaServlet")
public class ClienteCuentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private ClienteNegocio clienteService = new ClienteNegocioImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClienteCuentaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtiene la lista de clientes (con sus cuentas)
        ArrayList<Cliente> clientes = clienteService.obtenerTodosLosClientesConCuentas();

        // Envia la lista de clientes como atributo al js
        request.setAttribute("clientes", clientes);

        request.getRequestDispatcher("GestionCuentas.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
