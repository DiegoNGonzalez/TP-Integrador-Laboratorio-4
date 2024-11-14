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
 * Servlet implementation class AgregarCuentaServlet
 */
@WebServlet("/AgregarCuentaServlet")
public class AgregarCuentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarCuentaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idCliente = Integer.parseInt(request.getParameter("idCliente"));
		int idTipoCuenta = Integer.parseInt(request.getParameter("tipoCuenta"));
        String fechaCreacion = request.getParameter("fechaCreacion");
        long numeroCuenta = Long.parseLong(request.getParameter("numeroCuenta"));
        long cbu = Long.parseLong(request.getParameter("cbu"));
        float saldo = Float.parseFloat(request.getParameter("saldo"));
        
        TipoCuentaNegocioImpl tipoCuentaNegocioImpl = new TipoCuentaNegocioImpl();
        TipoCuenta tipoCuenta = tipoCuentaNegocioImpl.obtenerTipoCuentaPorId(idTipoCuenta);
        
        CuentaNegocioImpl cuentaNegocioImpl = new CuentaNegocioImpl();
        Cuenta cuenta = new Cuenta();
        
        cuenta.setTipoCuenta(tipoCuenta);
        cuenta.setFechaCreacion(Date.valueOf(fechaCreacion));
        cuenta.setNumeroCuenta(numeroCuenta);      
        cuenta.setCbu(cbu);
        cuenta.setSaldo(saldo);
        cuenta.setEstadoCuenta(true);

        try {
        	cuentaNegocioImpl.agregarCuenta(cuenta,idCliente);
    		response.sendRedirect("ListarClientesServlet");
        } catch(Exception e) {
        		e.printStackTrace();
        		response.sendRedirect("Error.jsp");
        		
        	}
        }

}
