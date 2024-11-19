package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cliente;
import entidades.Prestamo;
import negocio.PrestamoNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.PrestamoNegocioImpl;

@WebServlet("/GestionPrestamosServlet")
public class GestionPrestamosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GestionPrestamosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClienteNegocioImpl negocioCliente = new ClienteNegocioImpl();
		ArrayList<Cliente> listaClientesConPrestamosPendientes = negocioCliente.listarClientesPrestamos("Pendiente");
		ArrayList<Cliente> listaClientesConPrestamosActivos = negocioCliente.listarClientesPrestamos("Activo");
		ArrayList<Cliente> listaClientesConPrestamosRechazados = negocioCliente.listarClientesPrestamos("Rechazado");
		
        request.setAttribute("prestamosPendientes", listaClientesConPrestamosPendientes);
        request.setAttribute("prestamosAprobados", listaClientesConPrestamosActivos);
        request.setAttribute("prestamosRechazados", listaClientesConPrestamosRechazados);

        request.getRequestDispatcher("GestionPrestamos.jsp").forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
