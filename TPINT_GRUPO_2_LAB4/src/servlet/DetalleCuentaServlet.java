package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cuenta;
import entidades.TipoCuenta;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.TipoCuentaNegocioImpl;

@WebServlet("/DetalleCuentaServlet")
public class DetalleCuentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DetalleCuentaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//chequear null
		/*Cuenta cuenta = (Cuenta) request.getParameter("cuenta");
		
		request.setAttribute("cliente", cliente);
        request.getRequestDispatcher("DashboardCliente.jsp").forward(request, response);
		
		
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
        		
        	}*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
