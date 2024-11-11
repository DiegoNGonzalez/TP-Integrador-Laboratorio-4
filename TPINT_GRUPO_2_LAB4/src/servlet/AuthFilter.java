package servlet;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*") // Filtra todas las rutas
public class AuthFilter implements Filter {

	public void doFilter(javax.servlet.ServletRequest request, javax.servlet.ServletResponse response, FilterChain chain)
	        throws IOException, ServletException {
	    HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse res = (HttpServletResponse) response;
	    HttpSession session = req.getSession(false);

	    String userType = (session != null) ? (String) session.getAttribute("userType") : null;
	    String uri = req.getRequestURI();

	    // Permitir acceso sin autenticación a Login.jsp, LoginServlet, Error.jsp y recursos estáticos
	    if (uri.contains("Login.jsp") || uri.contains("LoginServlet") || uri.contains("Error.jsp") || uri.contains("/resources/")) {
	        chain.doFilter(request, response);
	        return;
	    }

	    // Redirige a Login.jsp si no hay una sesión autenticada
	    if (session == null || userType == null) {
	        res.sendRedirect("Login.jsp");
	        return;
	    }

	    /*// Verifica el acceso a páginas de administrador
	    if ((uri.contains("Admin")|| uri.contains("Menu")|| uri.contains("Editar")) && !"Administrador".equals(userType)) {
	        res.sendRedirect("Login.jsp");
	        return;
	    }

	    // Verifica el acceso a páginas de cliente
	    if (uri.contains("Cliente") && !"Cliente".equals(userType)) {
	        res.sendRedirect("Login.jsp");
	        return;
	    }*/

	    // Si está autenticado y autorizado, permite el acceso
	    chain.doFilter(request, response);
	}

    public void init(FilterConfig filterConfig) throws ServletException {}
    public void destroy() {}
}

