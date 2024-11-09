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

        // Páginas públicas que no requieren autenticación (Login.jsp)
        if (uri.contains("Login.jsp")) {
            chain.doFilter(request, response);
            return; // Continuar con la solicitud sin filtrar ya que estamos intentando acceder al login
        }

        // Páginas accesibles solo para administradores
        if (uri.contains("DashboardAdmin.jsp") && !"Administrador".equals(userType)) {
            res.sendRedirect("Login.jsp");
            return;
        }
        
        // Páginas accesibles solo para clientes
        if (uri.contains("DashboardCliente.jsp") && !"Cliente".equals(userType)) {
            res.sendRedirect("Login.jsp");
            return;
        }
       
        // Si no es una página restringida o está autenticado correctamente, continuar
        chain.doFilter(request, response);
    }

    public void init(FilterConfig filterConfig) throws ServletException {}
    public void destroy() {}
}

