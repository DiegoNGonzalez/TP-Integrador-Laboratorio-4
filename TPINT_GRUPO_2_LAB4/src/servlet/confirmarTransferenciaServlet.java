package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int idCuentaDestino;
		Cuenta cuentaDestino = new Cuenta();
		Cliente clienteSesion = new Cliente(); 
		int idCuentaOrigen = Integer.parseInt(request.getParameter("cuenta"));
		Float monto = Float.parseFloat(request.getParameter("monto").toString());
		String concepto = request.getParameter("concepto");

		CuentaNegocioImpl cuentaNegocio = new CuentaNegocioImpl();
		Cuenta cuentaOrigen = cuentaNegocio.obtenerCuentaPorId(idCuentaOrigen);
		
		HttpSession session = request.getSession(false);
		if (session != null) {
			clienteSesion = (Cliente) session.getAttribute("Cliente");
		}
		
		ArrayList<Cuenta> listaCuentas = clienteSesion.getCuentas();

		if (request.getParameter("confirmarTransferencia") != null) {

			idCuentaDestino = Integer.parseInt(request.getParameter("cuentaDestino"));
			cuentaDestino = cuentaNegocio.obtenerCuentaPorId(idCuentaDestino);

			long cbuOrigen = cuentaOrigen.getCbu();
			long cbuDestino = cuentaDestino.getCbu();
			
			try {
				cuentaNegocio.ejecutarSPTransferencia(cbuDestino, cbuOrigen, monto, concepto);
				if (session != null) {
					if (clienteSesion != null) {
						int idCliente = clienteSesion.getIdCliente();
						ArrayList<Cuenta> cuentasCliente = cuentaNegocio.obtenerCuentasPorCliente(idCliente);
						clienteSesion.setCuentas(cuentasCliente);
						session.setAttribute("Cliente", clienteSesion);
					}
				}
				response.sendRedirect("DashboardCliente.jsp");
			} catch (ClienteNegocioException e) {
				// Si ocurre un CuentaNegocioException, capturamos el mensaje y lo pasamos al
				// JSP
				request.getSession().setAttribute("errorMsj", e.getMessage());
				response.sendRedirect("Error.jsp"); // Redirigir a Error.jsp
			} catch (SQLException e) {
				e.printStackTrace();
				// En caso de una excepci�n de SQL, redirigimos a Error.jsp con un mensaje
				// general
				request.getSession().setAttribute("errorMsj", "Ocurrió un error en la base de datos.");
				response.sendRedirect("Error.jsp");
			}
		}

		long cbuTercero = 0;
		String destino = request.getParameter("tipoCuentaDestino");
		Cuenta cuentaSeleccionada = (Cuenta) request.getAttribute("cuentaSeleccionada");
		request.setAttribute("cuentaOrigen", cuentaOrigen);
		request.setAttribute("concepto", concepto);
		request.setAttribute("monto", monto);
		Cliente clienteDestino = new Cliente();

		if (destino != null) {
			if (destino.equals("propia")) {
				idCuentaDestino = Integer.parseInt(request.getParameter("cbuDestinoPropio"));
				cuentaDestino = cuentaNegocio.obtenerCuentaPorId(idCuentaDestino);
				clienteDestino = clienteSesion;
				request.setAttribute("tipoCuentaDestino", "propia");
				request.setAttribute("cbuDestinoPropio", idCuentaDestino);
			} else {
				cbuTercero = Long.parseLong(request.getParameter("cbuTercero"));
				cuentaDestino = cuentaNegocio.obtenerCuentaPorCbu(cbuTercero);
				request.setAttribute("cbuTercero", cbuTercero);
				request.setAttribute("cuentaSeleccionada", cuentaSeleccionada);
				request.setAttribute("cuenta", idCuentaOrigen);
				request.setAttribute("tipoCuentaDestino", "terceros");
				idCuentaDestino = cuentaDestino.getIdCuenta();

				if (idCuentaDestino == -1) {			
					request.setAttribute("errorCbu",
							"El CBU ingresado no existe o no pertenece al banco. Por favor, ingrese otro CBU.");
					request.getRequestDispatcher("/Transferencia.jsp").forward(request, response);
				}
				else {
					if (!cuentaDestino.getEstadoCuenta()) {
					request.setAttribute("errorCbu",
							"El CBU pertenece a una cuenta inactiva. Por favor, ingrese otro CBU.");
					request.getRequestDispatcher("/Transferencia.jsp").forward(request, response);					
				}
				else {
				    boolean cuentaEsPropia = false;
				    for (Cuenta cuenta : listaCuentas) {
				        if (cuenta.getIdCuenta() == cuentaDestino.getIdCuenta()) {
				            cuentaEsPropia = true;
				            break; // Salimos del bucle al encontrar una coincidencia
				        }
				    }				    
				    if (cuentaEsPropia) {
						request.setAttribute("errorCbu",
								"El CBU ingresado corresponde a una cuenta propia. Por favor, ingrese el CBU de un tercero.");
						request.getRequestDispatcher("/Transferencia.jsp").forward(request, response);				    	
				    }
				}
			}
				ClienteNegocioImpl clienteNegocio = new ClienteNegocioImpl();
				int idClienteDestino = clienteNegocio.obtenerIdClientePorIdCuenta(idCuentaDestino);
				clienteDestino = clienteNegocio.obtenerClientePorId(idClienteDestino);
			}			
			request.setAttribute("cuentaDestino", cuentaDestino);
			request.setAttribute("clienteDestino", clienteDestino);
		}		
		
		if(cuentaOrigen.getSaldo() < monto) {
			request.setAttribute("errorSaldo",
					"No hay saldo suficiente para transferir el monto ingresado");
			request.getRequestDispatcher("/Transferencia.jsp").forward(request, response);			
		}


		if (request.getParameter("realizarTransferencia") != null) {
			request.getRequestDispatcher("/ConfirmarTransferencia.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
