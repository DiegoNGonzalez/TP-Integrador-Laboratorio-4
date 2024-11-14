package servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.DynamicAny.DynAnyOperations;

import dao.UsuarioDao;
import entidades.Cliente;
import entidades.Localidad;
import entidades.Nacionalidad;
import entidades.Provincia;
import entidades.TipoUsuario;
import entidades.Usuario;
import exceptions.ClienteNegocioException;
import exceptions.ClienteSPException;
import negocio.ClienteNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.LocalidadNegocioImpl;
import negocioImpl.NacionalidadNegocioImpl;
import negocioImpl.ProvinciaNegocioImpl;
import negocioImpl.UsuarioNegocioImpl;

@WebServlet("/AgregarClienteServlet")
public class AgregarClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AgregarClienteServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    // Obtener los datos del formulario
	    String nombre = request.getParameter("nombre");
	    String apellido = request.getParameter("apellido");
	    String dni = request.getParameter("dni");
	    String cuil = request.getParameter("cuil");
	    String sex = request.getParameter("sexo");
	    String nacionalidadId = request.getParameter("nacionalidad");
	    String fechaNacimiento = request.getParameter("fechaNacimiento");
	    String direccion = request.getParameter("direccion");
	    String localidadId = request.getParameter("localidad");
	    String provinciaId = request.getParameter("provincia");
	    String email = request.getParameter("email");
	    String telefono = request.getParameter("telefono");
	    String usuario = request.getParameter("usuario");
	    String contrasena = request.getParameter("contrasena");
	    String contrasenaRepetida = request.getParameter("contrasenaRepetida");


	        // Crear el objeto Usuario
	        Usuario nuevoUsuario = new Usuario();
	        TipoUsuario tipoUsuario = new TipoUsuario(2, "Cliente");
	        nuevoUsuario.setNombreUsuario(usuario);
	        nuevoUsuario.setPassword(contrasena);
	        nuevoUsuario.setTipoUsuario(tipoUsuario);
	        nuevoUsuario.setActivo(true);

	        // Obtener las entidades asociadas
	        NacionalidadNegocioImpl nacionalidadNegocio = new NacionalidadNegocioImpl();
	        LocalidadNegocioImpl localidadNegocio = new LocalidadNegocioImpl();
	        ProvinciaNegocioImpl provinciaNegocio = new ProvinciaNegocioImpl();

	        Nacionalidad nacionalidad = nacionalidadNegocio.obtenerNacionalidadPorId(Integer.parseInt(nacionalidadId));
	        Localidad localidad = localidadNegocio.obtenerLocalidadPorId(Integer.parseInt(localidadId));
	        Provincia provincia = provinciaNegocio.obtenerProvinciaPorId(Integer.parseInt(provinciaId));

	        // Crear el objeto Cliente
	        Cliente nuevoCliente = new Cliente();
	        nuevoCliente.setNombre(nombre);
	        nuevoCliente.setApellido(apellido);
	        nuevoCliente.setDni(dni);
	        nuevoCliente.setCuil(cuil);
	        nuevoCliente.setSexo(sex.charAt(0));
	        nuevoCliente.setFechaNacimiento(Date.valueOf(fechaNacimiento));
	        nuevoCliente.setDireccion(direccion);
	        nuevoCliente.setEmail(email);
	        nuevoCliente.setTelefono(telefono);
	        nuevoCliente.setNacionalidad(nacionalidad);
	        nuevoCliente.setLocalidad(localidad);
	        nuevoCliente.setProvincia(provincia);
	        nuevoCliente.setEstado(true);

	        ClienteNegocioImpl clienteNegocio = new ClienteNegocioImpl();

	        try {
	            clienteNegocio.ejecutarSPCrearUsuario(nuevoUsuario, nuevoCliente);
	            response.sendRedirect("ListarClientesServlet");
	        } catch (ClienteNegocioException e) {
	            // Si ocurre un ClienteNegocioException, capturamos el mensaje y lo pasamos al JSP
	        	request.getSession().setAttribute("errorMsj", e.getMessage());
	            response.sendRedirect("Error.jsp");  // Redirigir a Error.jsp
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // En caso de una excepción de SQL, redirigimos a Error.jsp con un mensaje general
	            request.getSession().setAttribute("errorMsj", "Ocurrió un error en la base de datos.");
	            response.sendRedirect("Error.jsp");
	        }
	    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
