package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cuenta;
import entidades.Localidad;
import entidades.Nacionalidad;
import entidades.Provincia;
import entidades.TipoCuenta;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.LocalidadNegocioImpl;
import negocioImpl.NacionalidadNegocioImpl;
import negocioImpl.ProvinciaNegocioImpl;
import negocioImpl.TipoCuentaNegocioImpl;

/**
 * Servlet implementation class CargarDesplegablesServlet
 */
@WebServlet("/CargarDesplegablesServlet")
public class CargarDesplegablesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargarDesplegablesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	String action = request.getParameter("action");
    	
		// Crear la instancia de la capa de negocio
        NacionalidadNegocioImpl nacionalidadNegocioImpl= new NacionalidadNegocioImpl();
        ProvinciaNegocioImpl provinciaNegocioImpl=new ProvinciaNegocioImpl();
        LocalidadNegocioImpl localidadNegocioImpl=new LocalidadNegocioImpl();
        TipoCuentaNegocioImpl tipoCuentaNegocioImpl = new TipoCuentaNegocioImpl();
        CuentaNegocioImpl cuentaNegocioImpl = new CuentaNegocioImpl();
        
        // Obtener la lista de nacionalidades usando el método de negocio
        ArrayList<Nacionalidad> listaNacionalidades = nacionalidadNegocioImpl.listarNacionalidades();
        ArrayList<Provincia> listaProvincias = provinciaNegocioImpl.listarProvincias();
        ArrayList<Localidad> listaLocalidades = localidadNegocioImpl.listarLocalidades();
        ArrayList<TipoCuenta> listaTiposCuenta = tipoCuentaNegocioImpl.listarTiposCuenta();  
        
        // Establecer la lista como atributo en la solicitud
        request.setAttribute("listaNacionalidades", listaNacionalidades);
        request.setAttribute("listaProvincias", listaProvincias);
        request.setAttribute("listaLocalidades", listaLocalidades);
        request.setAttribute("listaTiposCuenta", listaTiposCuenta);
        
        // Redirigir al JSP
        if ("cargarCuentasCliente".equals(action)) {
            // Obtén el ID del cliente desde la sesión
            int idCliente = (int) request.getSession().getAttribute("idCliente");

            // Consulta las cuentas del cliente
            ArrayList<Cuenta> listaCuentas = cuentaNegocioImpl.obtenerCuentasPorCliente(idCliente);

            // Establece las cuentas como atributo
            request.setAttribute("listaCuentas", listaCuentas);

            // Redirige al JSP donde mostrarás las cuentas
            request.getRequestDispatcher("altaPrestamo.jsp").forward(request, response);
        }
        else if ("editarCliente".equals(action)) {
        	request.getRequestDispatcher("EditarCliente.jsp").forward(request, response);
        }
        else if ("agregarCliente".equals(action)) {
        	request.getRequestDispatcher("AgregarCliente.jsp").forward(request, response);
        }
        else if ("agregarCuenta".equals(action)) {
        	long cbu = cuentaNegocioImpl.obtenerProximoCBU();
        	long nroCuenta = cuentaNegocioImpl.obtenerProximoNumeroCuenta();
        	request.setAttribute("cbu", cbu);
        	request.setAttribute("nroCuenta", nroCuenta);
        	request.getRequestDispatcher("AgregarCuenta.jsp").forward(request, response);
        }
        else if ("editarCuenta".equals(action)) {
        	request.getRequestDispatcher("EditarCuenta.jsp").forward(request, response);        	
        }
        else {
            request.getRequestDispatcher("Error.jsp").forward(request, response);        	
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
