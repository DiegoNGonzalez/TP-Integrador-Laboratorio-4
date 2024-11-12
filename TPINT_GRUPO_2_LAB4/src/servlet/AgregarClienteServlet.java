package servlet;

import java.io.IOException;
import java.sql.Date;
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

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Obtener los datos del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        String cuil = request.getParameter("cuil");
        String sex = request.getParameter("sexo");
        char sexo= sex.charAt(0);
        String nacionalidadId = request.getParameter("nacionalidad");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String direccion = request.getParameter("direccion");
        String localidadId = request.getParameter("localidad");
        String provinciaId = request.getParameter("provincia");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        // Crear el objeto Usuario
        Usuario nuevoUsuario = new Usuario();
        TipoUsuario tipoUsuario=new TipoUsuario(2,"Cliente");
        nuevoUsuario.setNombreUsuario(usuario);
        nuevoUsuario.setPassword(contrasena);
        nuevoUsuario.setTipoUsuario(tipoUsuario);
        nuevoUsuario.setActivo(true);
        
        
        // Crear el objeto Cliente
        Cliente nuevoCliente = new Cliente();
        nuevoCliente.setNombre(nombre);
        nuevoCliente.setApellido(apellido);
        nuevoCliente.setDni(dni);
        nuevoCliente.setCuil(cuil);
        nuevoCliente.setSexo(sexo);
        nuevoCliente.setFechaNacimiento(Date.valueOf(fechaNacimiento));
        nuevoCliente.setDireccion(direccion);
        nuevoCliente.setEmail(email);
        nuevoCliente.setTelefono(telefono);
        nuevoCliente.setEstado(true);
        

        // Crear instancias de las clases de negocio
        UsuarioNegocioImpl usuarioNegocio = new UsuarioNegocioImpl();
        ClienteNegocioImpl clienteNegocio = new ClienteNegocioImpl();

        // Obtener las entidades asociadas (por ejemplo, Nacionalidad, Localidad, Provincia)
        NacionalidadNegocioImpl nacionalidadNegocio = new NacionalidadNegocioImpl();
        LocalidadNegocioImpl localidadNegocio = new LocalidadNegocioImpl();
        ProvinciaNegocioImpl provinciaNegocio = new ProvinciaNegocioImpl();

        Nacionalidad nacionalidad = nacionalidadNegocio.obtenerNacionalidadPorId(Integer.parseInt(nacionalidadId));
        Localidad localidad = localidadNegocio.obtenerLocalidadPorId(Integer.parseInt(localidadId));
        Provincia provincia = provinciaNegocio.obtenerProvinciaPorId(Integer.parseInt(provinciaId));

        // Asociar las entidades con el cliente
        nuevoCliente.setNacionalidad(nacionalidad);
        nuevoCliente.setLocalidad(localidad);
        nuevoCliente.setProvincia(provincia);

        /*// Guardar el Usuario y el Cliente
        try {
            // Agregar el usuario utilizando el negocio
            usuarioNegocio.agregarUsuario(nuevoUsuario);

            

        } catch (Exception e) {
            e.printStackTrace();
            // Manejar el error y redirigir a una página de error si es necesario
            response.sendRedirect("error.jsp");
        }
        try {
        	// Agregar el cliente utilizando el negocio
            clienteNegocio.agregarCliente(nuevoCliente);

            // Redirigir a una página de éxito
            response.sendRedirect("clienteExitoso.jsp");
		} catch (Exception e) {
			e.printStackTrace();
            // Manejar el error y redirigir a una página de error si es necesario
            response.sendRedirect("error.jsp");
		}*/
        
        int usuarioId = usuarioNegocio.agregarUsuario2(nuevoUsuario);
        if (usuarioId != -1) {
            nuevoUsuario.setId(usuarioId); // Asigna el ID al objeto Usuario
            nuevoCliente.setUsuario(nuevoUsuario); // Asigna el usuario al cliente

            // Intentar agregar el cliente solo si el usuario se creó con éxito
            try {
                clienteNegocio.agregarCliente(nuevoCliente);
                response.sendRedirect("clienteExitoso.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("error.jsp");
        }
    }
		 
	}


