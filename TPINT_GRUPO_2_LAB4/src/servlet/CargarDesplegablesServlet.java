package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Localidad;
import entidades.Nacionalidad;
import entidades.Provincia;
import negocioImpl.LocalidadNegocioImpl;
import negocioImpl.NacionalidadNegocioImpl;
import negocioImpl.ProvinciaNegocioImpl;

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
		// Crear la instancia de la capa de negocio
        NacionalidadNegocioImpl nacionalidadNegocioImpl= new NacionalidadNegocioImpl();
        ProvinciaNegocioImpl provinciaNegocioImpl=new ProvinciaNegocioImpl();
        LocalidadNegocioImpl localidadNegocioImpl=new LocalidadNegocioImpl();
        // Obtener la lista de nacionalidades usando el método de negocio
        ArrayList<Nacionalidad> listaNacionalidades = nacionalidadNegocioImpl.listarNacionalidades();
        ArrayList<Provincia> listaProvincias = provinciaNegocioImpl.listarProvincias();
        ArrayList<Localidad> listaLocalidades = localidadNegocioImpl.listarLocalidades();
        // Establecer la lista como atributo en la solicitud
        request.setAttribute("listaNacionalidades", listaNacionalidades);
        request.setAttribute("listaProvincias", listaProvincias);
        request.setAttribute("listaLocalidades", listaLocalidades);
        // Redirigir al JSP
        request.getRequestDispatcher("AgregarCliente.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
