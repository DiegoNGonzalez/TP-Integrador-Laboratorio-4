package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cliente;
import entidades.Localidad;
import entidades.Nacionalidad;
import entidades.Provincia;
import entidades.TipoUsuario;
import entidades.Usuario;
import exceptions.ClienteNegocioException;
import negocio.UsuarioNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.LocalidadNegocioImpl;
import negocioImpl.NacionalidadNegocioImpl;
import negocioImpl.ProvinciaNegocioImpl;
import negocioImpl.UsuarioNegocioImpl;

/**
 * Servlet implementation class EditarClienteServlet
 */
@WebServlet("/EditarClienteServlet")
public class EditarClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarClienteServlet() {
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
		int idCliente = Integer.parseInt(request.getParameter("idCliente"));
		int idUsuario= Integer.parseInt(request.getParameter("idCliente"));
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
        UsuarioNegocio usuarioNegocio= new UsuarioNegocioImpl();
        Usuario usuario=usuarioNegocio.obtenerUnUsuario(idUsuario);
        Cliente cliente = new Cliente();
        cliente.setIdCliente(idCliente);
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setDni(dni);
        cliente.setCuil(cuil);
        cliente.setSexo(sexo);
        cliente.setFechaNacimiento(Date.valueOf(fechaNacimiento));
        cliente.setDireccion(direccion);
        cliente.setEmail(email);
        cliente.setTelefono(telefono);
        cliente.setUsuario(usuario);
        

        ClienteNegocioImpl clienteNegocio = new ClienteNegocioImpl();

        NacionalidadNegocioImpl nacionalidadNegocio = new NacionalidadNegocioImpl();
        LocalidadNegocioImpl localidadNegocio = new LocalidadNegocioImpl();
        ProvinciaNegocioImpl provinciaNegocio = new ProvinciaNegocioImpl();

        Nacionalidad nacionalidad = nacionalidadNegocio.obtenerNacionalidadPorId(Integer.parseInt(nacionalidadId));
        Localidad localidad = localidadNegocio.obtenerLocalidadPorId(Integer.parseInt(localidadId));
        Provincia provincia = provinciaNegocio.obtenerProvinciaPorId(Integer.parseInt(provinciaId));

        cliente.setNacionalidad(nacionalidad);
        cliente.setLocalidad(localidad);
        cliente.setProvincia(provincia);
        
        try {
        	clienteNegocio.verificarCliente(cliente, usuario);
        	clienteNegocio.modificarCliente(cliente);
        	request.setAttribute("toastMessage", "Cliente editado correctamente.");
            request.setAttribute("toastType", "success");
            response.sendRedirect("ListarClientesServlet?action=clienteEditado&&mensaje=exitoEdit");
        } catch(ClienteNegocioException e) {
        		e.printStackTrace();
        		String error= e.getMessage();
        		System.out.println(error);
        		
        		response.sendRedirect("BuscarClienteServlet?clienteId="+cliente.getIdCliente()+"&action=editarCliente");
        		
        	}
        }
	}
