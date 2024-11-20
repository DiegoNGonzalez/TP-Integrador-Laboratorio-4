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
        // Obtener parámetros de filtro
        boolean filtrarPorFecha = request.getParameter("filterByDate") != null;
        boolean filtrarPorSaldo = request.getParameter("filterByAmount") != null;

        Date fechaInicio = null;
        Date fechaFin = null;
        Float montoMinimo = null;
        Float montoMaximo = null;

        // Procesar filtro de fecha
        if (filtrarPorFecha) {
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            
            if (startDateStr != null && !startDateStr.isEmpty()) {
            	try {
                    fechaInicio = java.sql.Date.valueOf(startDateStr);
                } catch (IllegalArgumentException e) {
                    // Manejar el error de conversión de fecha
                    System.out.println("Error al convertir fecha de inicio: " + e.getMessage());
                    // Puedes definir un valor por defecto o manejar el error como prefieras
                    // fechaInicio = null; // Ya está establecido como null por defecto
                }
            }
            
            if (endDateStr != null && !endDateStr.isEmpty()) {
            	try {
                    fechaFin = java.sql.Date.valueOf(endDateStr);
                } catch (IllegalArgumentException e) {
                    // Manejar el error de conversión de fecha
                    System.out.println("Error al convertir fecha de inicio: " + e.getMessage());
                    // Puedes definir un valor por defecto o manejar el error como prefieras
                    // fechaInicio = null; // Ya está establecido como null por defecto
                }
            }
        }

        // Procesar filtro de saldo
        if (filtrarPorSaldo) {
            String minAmountStr = request.getParameter("minAmount");
            String maxAmountStr = request.getParameter("maxAmount");
            
            if (minAmountStr != null && !minAmountStr.isEmpty()) {
                montoMinimo = Float.parseFloat(minAmountStr);
            }
            
            if (maxAmountStr != null && !maxAmountStr.isEmpty()) {
                montoMaximo = Float.parseFloat(maxAmountStr);
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

        // Procesar filtro de fecha
        if (filtrarPorFecha) {
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            
            if (startDateStr != null && !startDateStr.isEmpty()) {
            	try {
                    fechaInicio = java.sql.Date.valueOf(startDateStr);
                } catch (IllegalArgumentException e) {
                    // Manejar el error de conversión de fecha
                    System.out.println("Error al convertir fecha de inicio: " + e.getMessage());
                    // Puedes definir un valor por defecto o manejar el error como prefieras
                    // fechaInicio = null; // Ya está establecido como null por defecto
                }
            }
            
            if (endDateStr != null && !endDateStr.isEmpty()) {
            	try {
                    fechaFin = java.sql.Date.valueOf(endDateStr);
                } catch (IllegalArgumentException e) {
                    // Manejar el error de conversión de fecha
                    System.out.println("Error al convertir fecha de inicio: " + e.getMessage());
                    // Puedes definir un valor por defecto o manejar el error como prefieras
                    // fechaInicio = null; // Ya está establecido como null por defecto
                }
            }
        }

        // Procesar filtro de saldo
        if (filtrarPorSaldo) {
            String minAmountStr = request.getParameter("minAmount");
            String maxAmountStr = request.getParameter("maxAmount");
            
            if (minAmountStr != null && !minAmountStr.isEmpty()) {
                montoMinimo = Float.parseFloat(minAmountStr);
            }
            
            if (maxAmountStr != null && !maxAmountStr.isEmpty()) {
                montoMaximo = Float.parseFloat(maxAmountStr);
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
