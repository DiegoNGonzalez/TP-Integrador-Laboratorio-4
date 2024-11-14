package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocioImpl.CuentaNegocioImpl;

@WebServlet("/EliminarCuentaServlet")
public class EliminarCuentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EliminarCuentaServlet() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cuentaId = request.getParameter("cuentaId");
        boolean eliminada = false;
        if (cuentaId != null) {
            eliminada = eliminarCuentaEnBD(cuentaId);  
        }

        // Configuración de la respuesta
        response.setContentType("text/plain");
        response.getWriter().write(eliminada ? "success" : "error");
	}
	
    private boolean eliminarCuentaEnBD(String cuentaId) {
    	boolean valida = false;
    	CuentaNegocioImpl aux = new CuentaNegocioImpl();
    	valida = aux.bajaCuenta(Integer.parseInt(cuentaId));
    	return valida;        
    }
}
