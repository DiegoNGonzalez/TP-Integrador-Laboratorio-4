package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Cliente;
import entidades.Usuario;
import exceptions.UsuarioNegocioException;
import negocio.ClienteNegocio;
import negocio.UsuarioNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.UsuarioNegocioImpl;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	String username = request.getParameter("username");
	    	String password = request.getParameter("password");
	
	    	UsuarioNegocio usuarioNegocio = new UsuarioNegocioImpl();
	    	ClienteNegocio clienteNegocio = new ClienteNegocioImpl();
	    
	        try {
	            // Verificamos las credenciales a través de la capa de negocio
	            Usuario usuario = usuarioNegocio.verificarCredenciales(username, password);	                       
	            
	            if (usuario != null && usuario.isActivo()) {
	            	//busca dos veces al usuario, modificar dsp. dejar solo cliente en session que contiene a usuario? tb se podria poner en el if de abajo.
	            	//Cliente cliente = clienteNegocio.obtenerClientePorIdUsuario(usuario.getId());
	                HttpSession session = request.getSession();
	                session.setAttribute("userType", usuario.getTipoUsuario().getTipoUsuario());
	                session.setAttribute("usuario", usuario.getNombreUsuario());
	                //session.setAttribute("cliente", cliente);
	                System.out.println("Sesión configurada con userType: " + usuario.getTipoUsuario().getTipoUsuario());
	
	                // Redirigir según el tipo de usuario
	                if ("Administrador".equals(usuario.getTipoUsuario().getTipoUsuario())) {
	                    // sólo redirige ya que no necesitamos más datos del admin
	                	response.sendRedirect("DashboardAdmin.jsp");
	                } else if ("Cliente".equals(usuario.getTipoUsuario().getTipoUsuario())) {
	                	Cliente aux = clienteNegocio.obtenerClientePorIdUsuario(usuario.getId());
	                	session.setAttribute("Cliente", aux);
	                    response.sendRedirect("DashboardCliente.jsp");
	                }
	            } else {
	                // Usuario no activo o no encontrado
	                throw new UsuarioNegocioException("Usuario inactivo o credenciales incorrectas.");
	            }
	        } catch (UsuarioNegocioException e) {
	            // Manejo de la excepción de negocio
	            request.getSession().setAttribute("errorMsj", e.getMessage());
	            response.sendRedirect("Error.jsp");
	        }
		}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String action = request.getParameter("action");
        if ("logout".equals(action)) {
            // Invalidar la sesión si la acción es logout
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
                System.out.println("Sesión invalidada");
            }
            // Redirigir al login después de cerrar sesión
            response.sendRedirect("Login.jsp");
        } else {
            // Redirigir al login si no se especifica la acción
            response.sendRedirect("Login.jsp");
        }
    }
}


