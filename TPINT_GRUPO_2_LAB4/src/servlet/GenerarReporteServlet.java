package servlet;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CuentaNegocio;
import negocioImpl.CuentaNegocioImpl;

@WebServlet("/GenerarReporteServlet")
public class GenerarReporteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener las fechas desde los parámetros del formulario
        String fechaInicioStr = request.getParameter("fechaInicio");
        String fechaFinStr = request.getParameter("fechaFin");

        // Validar las fechas
        if (fechaInicioStr == null || fechaFinStr == null || fechaInicioStr.isEmpty() || fechaFinStr.isEmpty()) {
            request.setAttribute("error", "Debe seleccionar un rango de fechas válido.");
            request.getRequestDispatcher("reporte.jsp").forward(request, response);
            return;
        }

        try {
            // Parsear las fechas
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaInicio = dateFormat.parse(fechaInicioStr);
            Date fechaFin = dateFormat.parse(fechaFinStr);

            // Llamar al método de negocio para obtener el reporte
            CuentaNegocio cuentaNegocio = new CuentaNegocioImpl();
            ArrayList<String> reporte = cuentaNegocio.reporteMovimientosCuentas(fechaInicio, fechaFin);

            // Pasar el reporte y las fechas a la vista (JSP)
            request.setAttribute("reporte", reporte);
            request.setAttribute("fechaInicio", fechaInicioStr);
            request.setAttribute("fechaFin", fechaFinStr);

        } catch (ParseException e) {
            request.setAttribute("msjError", "Formato de fecha inválido.");
        }

        // Redirigir al JSP
        request.getRequestDispatcher("Reporte.jsp").forward(request, response);
    }
}
