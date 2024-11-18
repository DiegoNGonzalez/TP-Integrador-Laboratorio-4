package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.print(request.getParameter("cbuOrigen").toString());
		long cbuDestino;
		long cbuOrigen = Long.parseLong(request.getParameter("cbuOrigen").toString());
		String concepto = request.getParameter("concepto");		
		float monto = Float.parseFloat(request.getParameter("monto").toString());				
		if(request.getParameter("realizarTransferencia")!=null) {
			String destino = request.getParameter("tipoCuentaDestino");
			if(destino.equals("propia")) {
				cbuDestino = Long.parseLong(request.getParameter("cbuDestinoPropio"));
			}else {
				cbuDestino = Long.parseLong(request.getParameter("cbuTercero"));
			}					
			//validar antes de continuar
			request.setAttribute("cbuOrigen", cbuOrigen);	
			request.setAttribute("cbuDestino", cbuDestino);
			request.setAttribute("concepto", concepto);	
			request.setAttribute("monto", monto);	
			RequestDispatcher rd = request.getRequestDispatcher("/ConfirmarTransferencia.jsp");
			rd.forward(request, response);
		}
		
		if(request.getParameter("confirmarTransferencia")!=null) {
			cbuDestino = Long.parseLong(request.getParameter("cbuDestino"));
			CuentaNegocioImpl cuentaNegocio = new CuentaNegocioImpl();

	        try {
	        	cuentaNegocio.ejecutarSPTransferencia(cbuOrigen, cbuDestino, monto, concepto);
	        	System.out.print("ACAAAAAAA");
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
