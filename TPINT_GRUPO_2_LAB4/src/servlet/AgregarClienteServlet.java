package servlet;

import java.io.IOException;
import java.sql.Date;
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
		/**String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String dni = request.getParameter("dni");
		String cuil = request.getParameter("cuil");
		String sex = request.getParameter("sexo");
		char sexo = sex.charAt(0);
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

		if (!(contrasena.equals(contrasenaRepetida))) {
			// error contrasenas no coinciden
			System.out.println("contrasenas no coinciden");
		} else {**/
		String fechaNacimiento = request.getParameter("fechaNacimiento");
		String nombre = "Lucas";
		String apellido = "Apellido";
		String dni = "20146234";
		String cuil = "20101462396";
		String sex = "A";
		char sexo = sex.charAt(0);
		String nacionalidadId = "1";
		//String fechaNacimiento = null;
		String direccion = "dsdsdsd";
		String localidadId = "2";
		String provinciaId = "2";
		String email = "ewewew@dsds.com";
		String telefono = "234234234";
		String usuario = "asdasdasd";
		String contrasena = "asdasdas";
		//String contrasenaRepetida = request.getParameter("contrasenaRepetida");
			// Crear el objeto Usuario
			Usuario nuevoUsuario = new Usuario();
			TipoUsuario tipoUsuario = new TipoUsuario(2, "Cliente");
			nuevoUsuario.setNombreUsuario(usuario);
			nuevoUsuario.setPassword(null);
			nuevoUsuario.setTipoUsuario(tipoUsuario);
			nuevoUsuario.setActivo(true);

			// Obtener las entidades asociadas (por ejemplo, Nacionalidad, Localidad,
			// Provincia)
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
			nuevoCliente.setSexo(sexo);
			nuevoCliente.setFechaNacimiento(Date.valueOf(fechaNacimiento));

			//nuevoCliente.setFechaNacimiento(Date.valueOf("11-11-1990"));
			nuevoCliente.setDireccion(direccion);
			nuevoCliente.setEmail(email);
			nuevoCliente.setTelefono(telefono);
			// Asociar las entidades con el cliente
			nuevoCliente.setNacionalidad(nacionalidad);
			nuevoCliente.setLocalidad(localidad);
			nuevoCliente.setProvincia(provincia);
			nuevoCliente.setEstado(true);

			ClienteNegocioImpl clienteNegocio = new ClienteNegocioImpl();

			try {
				clienteNegocio.ejecutarSPCrearUsuario(nuevoUsuario, nuevoCliente);
				System.out.println("a11111aaaaa");
				
				response.sendRedirect("ListarClientesServlet");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("aaaaa222222a");
				//response.sendRedirect("Error.jsp");
			}finally {
				
			}
		//}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
