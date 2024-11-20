package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Cliente;
import entidades.Cuenta;
import exceptions.ClienteNegocioException;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.CuentaNegocioImpl;

@WebServlet("/confirmarTransferenciaServlet")
public class confirmarTransferenciaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public confirmarTransferenciaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("1");
		int idCuentaOrigen = Integer.parseInt(request.getParameter("cuenta"));
		System.out.println("idCuentaOrigen: " + idCuentaOrigen);
		int idCuentaDestino;
		String destino = request.getParameter("tipoCuentaDestino");
		System.out.println("destino: " + destino);
		Float monto = Float.parseFloat(request.getParameter("monto").toString());
		System.out.println("monto: " + monto);
		String concepto = request.getParameter("concepto");
		System.out.println("concepto: " + concepto);

		CuentaNegocioImpl cuentaNegocio = new CuentaNegocioImpl();
		Cuenta cuentaOrigen = cuentaNegocio.obtenerCuentaPorId(idCuentaOrigen);
		
		if(destino != null) {
			if(destino.equals("propia")) {
				idCuentaDestino = Integer.parseInt(request.getParameter("cbuDestinoPropio"));
			}else{
				idCuentaDestino = Integer.parseInt(request.getParameter("cbuTercero"));
			}
			Cuenta cuentaDestino = cuentaNegocio.obtenerCuentaPorId(idCuentaDestino);	
			request.setAttribute("cuentaDestino", cuentaDestino);
		}

		request.setAttribute("cuentaOrigen", cuentaOrigen);
		
		if(request.getParameter("realizarTransferencia")!=null) {
			request.setAttribute("concepto", concepto);	
			request.setAttribute("monto", monto);
			request.getRequestDispatcher("/ConfirmarTransferencia.jsp").forward(request, response);
		}
		
		if(request.getParameter("confirmarTransferencia")!=null) {	
			
			idCuentaDestino = Integer.parseInt(request.getParameter("cuentaDestino"));
			Cuenta cuentaDestino = cuentaNegocio.obtenerCuentaPorId(idCuentaDestino);		
			long cbuOrigen = cuentaOrigen.getCbu();
			long cbuDestino = cuentaDestino.getCbu();

			
	        try {
	        	cuentaNegocio.ejecutarSPTransferencia(cbuDestino, cbuOrigen, monto, concepto);
	        	HttpSession session = request.getSession(false);
	        	if (session != null) {
		            Cliente cliente = (Cliente) session.getAttribute("Cliente");
		            if (cliente != null) {
		            	int idCliente = cliente.getIdCliente();
		            	ArrayList<Cuenta> cuentasCliente = cuentaNegocio.obtenerCuentasPorCliente(idCliente);
		            	cliente.setCuentas(cuentasCliente);
		            	session.setAttribute("Cliente", cliente);
		            }	        		
	        	}
	            response.sendRedirect("DashboardCliente.jsp");
	        } catch (ClienteNegocioException e) {
	            // Si ocurre un CuentaNegocioException, capturamos el mensaje y lo pasamos al JSP
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
