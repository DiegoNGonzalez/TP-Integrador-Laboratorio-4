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
 * Servlet implementation class ListarClientesServlet
 */
@WebServlet("/ListarClientesServlet")
public class ListarClientesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListarClientesServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private ClienteNegocio clienteNegocio = new ClienteNegocioImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Llamamos al m�todo de negocio para obtener la lista de clientes activos
		ArrayList<Cliente> listaClientes = clienteNegocio.listarClientesActivos();
		String action = request.getParameter("action");
		String mensaje = request.getParameter("mensaje");
		if ("clienteAgregado".equals(action)) {
			request.setAttribute("toastMessage", "Cliente agregado correctamente.");
			request.setAttribute("toastType", "success");
		} else if ("clienteEditado".equals(action) && "exitoEdit".equals(mensaje)) {
			request.setAttribute("toastMessage", "Cliente editado correctamente.");
			request.setAttribute("toastType", "success");

		} else if ("eliminarCliente".equals(action) && "exito".equals(mensaje)) {
			request.setAttribute("toastMessage", "Cliente eliminado correctamente.");
			request.setAttribute("toastType", "success");
		} else if ("eliminarCliente".equals(action) && "error1".equals(mensaje)) {
			request.setAttribute("toastMessage", "No se pudo eliminar el cliente.");
			request.setAttribute("toastType", "error");
		} else if ("eliminarCliente".equals(action) && "error2".equals(mensaje)) {
			request.setAttribute("toastMessage", "ID de cliente no valido.");
			request.setAttribute("toastType", "error");
		} else if ("eliminarCliente".equals(action) && "error3".equals(mensaje)) {
			request.setAttribute("toastMessage", "Error en la base de datos al eliminar el cliente.");
			request.setAttribute("toastType", "error");
		} else if ("cuentaAgregada".equals(action)) {
			request.setAttribute("toastMessage", "Cuenta agregada correctamente.");
			request.setAttribute("toastType", "success");
		} else if ("cuentaAgregada".equals(action)&& "errorCuenta".equals(mensaje)) {
			request.setAttribute("toastMessage", "No se pudo agregar la cuenta.");
			request.setAttribute("toastType", "error");
		}

		// Pasamos la lista de clientes al JSP como atributo
		request.setAttribute("listaClientes", listaClientes);
		// Redirigimos al JSP donde se mostrar� la lista
		request.getRequestDispatcher("MenuCliente.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
