package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cuenta;
import entidades.TipoCuenta;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.TipoCuentaNegocioImpl;

/**
 * Servlet implementation class EditarCuentaServlet
 */
@WebServlet("/EditarCuentaServlet")
public class EditarCuentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarCuentaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idCuenta = Integer.parseInt(request.getParameter("idCuenta"));
		int idTipoCuenta = Integer.parseInt(request.getParameter("tipoCuenta"));
        float saldo = Float.parseFloat(request.getParameter("saldo"));
        
        CuentaNegocioImpl cuentaNegocioImpl = new CuentaNegocioImpl();
        Cuenta auxCuenta = new Cuenta();
        
        TipoCuentaNegocioImpl tipoCuentaNegocioImpl = new TipoCuentaNegocioImpl();
        TipoCuenta tipoCuenta = tipoCuentaNegocioImpl.obtenerTipoCuentaPorId(idTipoCuenta);
        
        auxCuenta.setIdCuenta(idCuenta);
        auxCuenta.setTipoCuenta(tipoCuenta);
        auxCuenta.setSaldo(saldo);
        
        try {
        	if(cuentaNegocioImpl.modificarCuenta(auxCuenta)) {
        		response.sendRedirect("ClienteCuentaServlet");         		
        	}
        	else {
            	response.sendRedirect("Error.jsp");          		
        	}
        } catch(Exception e) {
        		e.printStackTrace();
        		response.sendRedirect("Error.jsp");
        		
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
