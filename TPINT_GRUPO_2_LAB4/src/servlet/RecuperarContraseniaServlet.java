package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.ClienteNegocio;
import negocioImpl.ClienteNegocioImpl;

/**
 * Servlet implementation class RecuperarContraseniaServlet
 */
@WebServlet("/RecuperarContraseniaServlet")
public class RecuperarContraseniaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClienteNegocio clienteNegocio;

    public RecuperarContraseniaServlet() {
        super();
        this.clienteNegocio = new ClienteNegocioImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String dni = request.getParameter("dni");
        String email = request.getParameter("email");
        String pregunta = request.getParameter("pregunta");
        long respuesta = Long.parseLong(request.getParameter("respuesta"));

       
        ArrayList<String> datos = clienteNegocio.recuperarContrasenia(dni, email, pregunta, respuesta);

        
        if (datos.isEmpty()) {
           
            request.setAttribute("msjError", "No se pudieron corroborar los datos.");
            request.getRequestDispatcher("/Error.jsp").forward(request, response);
        } else {
            
            request.setAttribute("nombreUsuario", datos.get(0));
            request.setAttribute("contrasenia", datos.get(1));
            request.getRequestDispatcher("/RecuperarContraseniaExitosa.jsp").forward(request, response);
        }
    }
}
