package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Cliente;
import entidades.Prestamo;
import negocio.ClienteNegocio;
import negocio.CuentaNegocio;
import negocio.PrestamoNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.PrestamoNegocioImpl;

/**
 * Servlet implementation class FiltrosServlet
 */
@WebServlet("/FiltrosServlet")
public class FiltrosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private ClienteNegocio clienteService = new ClienteNegocioImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FiltrosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

        if (action != null && action.equals("filtrarCuentas")) {
            filtrarCuentas(request, response);
        }else if(action != null && action.equals("filtrarMisPrestamos")){
        	filtrarMisPrestamos(request, response);
        }
        else {
            listarCuentas(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void listarCuentas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Cliente> clientes = clienteService.obtenerTodosLosClientesConCuentas();
        request.setAttribute("clientes", clientes);
        request.getRequestDispatcher("GestionCuentas.jsp").forward(request, response);
    }

    private void filtrarCuentas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // obtiene los parámetros del filtro
        boolean filtrarPorFecha = request.getParameter("filterByDate") != null;
        boolean filtrarPorSaldo = request.getParameter("filterByAmount") != null;

        Date fechaInicio = null;
        Date fechaFin = null;
        Float montoMinimo = null;
        Float montoMaximo = null;

     // Verificar y establecer fecha de inicio
        if(filtrarPorFecha) {
        	String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            
        	if (startDateStr != null && !startDateStr.isEmpty()) {
        		try {
        			fechaInicio = java.sql.Date.valueOf(startDateStr);
        		} catch (IllegalArgumentException e) {
        			request.getSession().setAttribute("errorMsj", e.getMessage());
        			response.sendRedirect("Error.jsp");
        			return;
        		}
        	} else {
        		// Si no se especifica, establece la fecha de inicio predeterminada (1 de enero de 2000)
        		fechaInicio = java.sql.Date.valueOf("2000-01-01");
        	}
        	
        	// Verificar y establecer fecha de fin
        	if (endDateStr != null && !endDateStr.isEmpty()) {
        		try {
        			fechaFin = java.sql.Date.valueOf(endDateStr);
        		} catch (IllegalArgumentException e) {
        			request.getSession().setAttribute("errorMsj", e.getMessage());
        			response.sendRedirect("Error.jsp");
        			return;
        		}
        	} else {
        		// Si no se especifica, establece como fecha de fin el último día del año actual
        		fechaFin = java.sql.Date.valueOf(java.time.LocalDate.now().with(java.time.temporal.TemporalAdjusters.lastDayOfYear()));
        	}
        	
        }

        // Procesar filtro de saldo
        if (filtrarPorSaldo) {
            String minAmountStr = request.getParameter("minAmount");
            String maxAmountStr = request.getParameter("maxAmount");
            
            if (minAmountStr != null && !minAmountStr.isEmpty()) {
                montoMinimo = Float.parseFloat(minAmountStr);
            } else {
                montoMinimo = 0f; // Si está vacío o es null, establece montoMinimo en 0
            }
            
            if (maxAmountStr != null && !maxAmountStr.isEmpty()) {
                montoMaximo = Float.parseFloat(maxAmountStr);
            }else {
            	montoMaximo = 10000000f;
            }
        }

        // Llamar al método de negocio para filtrar cuentas
        CuentaNegocio cuentaNegocio = new CuentaNegocioImpl();
        ArrayList<Cliente> clientesFiltrados = cuentaNegocio.filtrarCuentas(
            fechaInicio, fechaFin, montoMinimo, montoMaximo
        );
        
        request.setAttribute("clientes", clientesFiltrados);
        request.getRequestDispatcher("GestionCuentas.jsp").forward(request, response);
    }
    
    private void filtrarMisPrestamos(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    	HttpSession session = request.getSession();
        Cliente cliente = (Cliente) session.getAttribute("Cliente");
        boolean filtrarPorFecha = request.getParameter("filterByDate") != null;
        boolean filtrarPorSaldo = request.getParameter("filterByAmount") != null;
        
        Date fechaInicio = null;
        Date fechaFin = null;
        Float montoMinimo = null;
        Float montoMaximo = null;

     // Verificar y establecer fecha de inicio
        if(filtrarPorFecha) {
        	String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            
        	if (startDateStr != null && !startDateStr.isEmpty()) {
        		try {
        			fechaInicio = java.sql.Date.valueOf(startDateStr);
        		} catch (IllegalArgumentException e) {
        			request.getSession().setAttribute("errorMsj", e.getMessage());
        			response.sendRedirect("Error.jsp");
        			return;
        		}
        	} else {
        		// Si no se especifica, establece la fecha de inicio predeterminada (1 de enero de 2000)
        		fechaInicio = java.sql.Date.valueOf("2000-01-01");
        	}
        	
        	// Verificar y establecer fecha de fin
        	if (endDateStr != null && !endDateStr.isEmpty()) {
        		try {
        			fechaFin = java.sql.Date.valueOf(endDateStr);
        		} catch (IllegalArgumentException e) {
        			request.getSession().setAttribute("errorMsj", e.getMessage());
        			response.sendRedirect("Error.jsp");
        			return;
        		}
        	} else {
        		// Si no se especifica, establece como fecha de fin el último día del año actual
        		fechaFin = java.sql.Date.valueOf(java.time.LocalDate.now().with(java.time.temporal.TemporalAdjusters.lastDayOfYear()));
        	}
        	
        }

     // Procesar filtro de saldo
        if (filtrarPorSaldo) {
            String minAmountStr = request.getParameter("minAmount");
            String maxAmountStr = request.getParameter("maxAmount");
            
            if (minAmountStr != null && !minAmountStr.isEmpty()) {
                montoMinimo = Float.parseFloat(minAmountStr);
            } else {
                montoMinimo = 0f; // Si está vacío o es null, establece montoMinimo en 0
            }
            
            if (maxAmountStr != null && !maxAmountStr.isEmpty()) {
                montoMaximo = Float.parseFloat(maxAmountStr);
            }else {
            	montoMaximo = 10000000f;
            }
        }
        
        PrestamoNegocio prestamoNegocio = new PrestamoNegocioImpl();
        ArrayList<Prestamo> prestamosFiltrados = prestamoNegocio.filtrarPrestamos(
            fechaInicio, fechaFin, montoMinimo, montoMaximo, cliente.getIdCliente()
        );

        request.setAttribute("prestamos", prestamosFiltrados);
        request.getRequestDispatcher("MisPrestamos.jsp").forward(request, response);
		
	}

}
