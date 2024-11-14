package servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoImpl.CuentaDaoImpl;
import entidades.Cliente;
import entidades.Cuenta;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.CuentaNegocioImpl;

/**
 * Servlet implementation class BuscarCuentaServlet
 */
@WebServlet("/BuscarCuentaServlet")
public class BuscarCuentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuscarCuentaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cuentaId = Integer.parseInt(request.getParameter("cuentaId"));
		
    	String action = request.getParameter("action");
        CuentaNegocioImpl auxCuentaNegocio = new CuentaNegocioImpl();
        Cuenta cuenta = auxCuentaNegocio.obtenerCuentaPorId(cuentaId);
        
        if (cuenta == null) {
            // Si la cuenta no existe redirecciono.
			System.out.println("La cuenta no existe.");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        } else {
            request.setAttribute("cuenta", cuenta);
            if ("editarCuenta".equals(action)) {
                request.getRequestDispatcher("/BuscarClienteServlet").forward(request, response);     
            }else {
                // Si `action` no coincide con ninguna acción esperada, redirige a una página por defecto.
                request.getRequestDispatcher("Error.jsp").forward(request, response);
            }
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
