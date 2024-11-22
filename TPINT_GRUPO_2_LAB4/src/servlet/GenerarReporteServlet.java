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
import negocio.PrestamoNegocio;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.PrestamoNegocioImpl;

@WebServlet("/GenerarReporteServlet")
public class GenerarReporteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        String fechaInicioStr = request.getParameter("fechaInicio");
        String fechaFinStr = request.getParameter("fechaFin");
        String tipoReporte = request.getParameter("tipoReporte");

        
        if (fechaInicioStr == null || fechaFinStr == null || fechaInicioStr.isEmpty() || fechaFinStr.isEmpty()) {
            request.setAttribute("error", "Debe seleccionar un rango de fechas v�lido.");
            request.getRequestDispatcher("reporte.jsp").forward(request, response);
            return;
        }

        try {
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaInicio = dateFormat.parse(fechaInicioStr);
            Date fechaFin = dateFormat.parse(fechaFinStr);

            ArrayList<String> reporte = null;

            
            if ("contabilidad".equals(tipoReporte)) {
                CuentaNegocio cuentaNegocio = new CuentaNegocioImpl();
                reporte = cuentaNegocio.reporteMovimientosCuentas(fechaInicio, fechaFin);
            } else if ("prestamos".equals(tipoReporte)) {
                PrestamoNegocio prestamoNegocio = new PrestamoNegocioImpl();
                reporte = prestamoNegocio.generarReportePrestamos(fechaInicio, fechaFin);
            }

            
            request.setAttribute("reporte", reporte);
            request.setAttribute("tipoReporte", tipoReporte);
            request.setAttribute("fechaInicio", fechaInicioStr);
            request.setAttribute("fechaFin", fechaFinStr);

            request.getSession().setAttribute("reporte", reporte);
            request.getSession().setAttribute("tipoReporte", tipoReporte);


        } catch (ParseException e) {
            request.setAttribute("msjError", "Formato de fecha inv�lido.");
        }

        // Redirigir al JSP
        request.setAttribute("toastMessage", "Reporte generado con éxito");
        request.setAttribute("toastType", "success");
        request.getRequestDispatcher("Reporte.jsp").forward(request, response);
    }
}
