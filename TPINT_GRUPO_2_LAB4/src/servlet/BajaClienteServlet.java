package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocioImpl.ClienteNegocioImpl;

@WebServlet("/BajaClienteServlet")
public class BajaClienteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BajaClienteServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String clienteIdParam = request.getParameter("clienteId");

        if (clienteIdParam != null && !clienteIdParam.isEmpty()) {
            try {
                int idCliente = Integer.parseInt(clienteIdParam);
                ClienteNegocioImpl clienteNegocio = new ClienteNegocioImpl();

                // Llamada a la baja lógica del cliente
                boolean resultado = clienteNegocio.bajaCliente(idCliente);

                if (resultado) {
                    request.setAttribute("toastMessage", "Cliente eliminado exitosamente.");
                    request.setAttribute("toastType", "success");
                } else {
                    request.setAttribute("toastMessage", "No se pudo eliminar el cliente.");
                    request.setAttribute("toastType", "error");
                }
            } catch (NumberFormatException e) {
                // Error en el formato del ID
                request.setAttribute("toastMessage", "ID de cliente no válido.");
                request.setAttribute("toastType", "error");
            } catch (SQLException e) {
                // Error específico de SQL
                request.setAttribute("toastMessage", "Error en la base de datos al eliminar el cliente.");
                request.setAttribute("toastType", "error");
                e.printStackTrace();
            } catch (Exception e) {
                // Otros errores inesperados
                request.setAttribute("toastMessage", "Error al eliminar el cliente: " + e.getMessage());
                request.setAttribute("toastType", "error");
                e.printStackTrace();
            }
        } else {
            request.setAttribute("toastMessage", "ID de cliente no proporcionado.");
            request.setAttribute("toastType", "error");
        }

        // Redireccionamos nuevamente a la lista de clientes para ver el mensaje
        request.getRequestDispatcher("ListarClientesServlet").forward(request, response);
    }

    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
