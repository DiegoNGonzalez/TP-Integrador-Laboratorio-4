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
import negocio.CuentaNegocio;
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

    	String action = request.getParameter("action");
    	
        	if("dashboardCliente".equals(action)) {
            request.getRequestDispatcher("Transferencia.jsp").forward(request, response);
        }
        else if("detalleCuenta".equals(action)) {
        	int idCuenta = Integer.parseInt(request.getParameter("idCuenta"));
        	CuentaNegocio cuentaNegocio = new CuentaNegocioImpl();
        	Cuenta cuenta = cuentaNegocio.obtenerCuentaPorId(idCuenta);
            request.setAttribute("cuentaSeleccionada", cuenta);
            request.getRequestDispatcher("Transferencia.jsp").forward(request, response);
        }
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
