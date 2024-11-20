package servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

@WebServlet("/ExportarExcelServlet")
public class ExportarExcelServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Simulación de datos obtenidos del atributo "reporte"
    	ArrayList<String> reporte = (ArrayList<String>) request.getSession().getAttribute("reporte");
    	String tipoReporte=(String) request.getSession().getAttribute("tipoReporte");
    	
        // Configurar la respuesta HTTP para descargar el archivo Excel
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=reporte.xls");

        // Crear el archivo Excel en memoria
        WritableWorkbook workbook = Workbook.createWorkbook(response.getOutputStream());
        WritableSheet sheet = workbook.createSheet("Reporte", 0);

        try {
        	if ("contabilidad".equals(tipoReporte)) {
				
        		// Agregar encabezados a la hoja
        		sheet.addCell(new Label(0, 0, "Año"));
        		sheet.addCell(new Label(1, 0, "Mes"));
        		sheet.addCell(new Label(2, 0, "Cantidad de Movimientos"));
        		sheet.addCell(new Label(3, 0, "Saldo Positivo"));
        		sheet.addCell(new Label(4, 0, "Saldo Negativo"));
        		sheet.addCell(new Label(5, 0, "Saldo del Mes"));
			}else if ("prestamos".equals(tipoReporte)) {
				sheet.addCell(new Label(0, 0, "ID Prestamo"));
        		sheet.addCell(new Label(1, 0, "Cliente"));
        		sheet.addCell(new Label(2, 0, "Monto Solicitado"));
        		sheet.addCell(new Label(3, 0, "Monto Pendiente"));
        		sheet.addCell(new Label(4, 0, "Fecha de solicitud"));
			}

            
            if (reporte != null) {
                for (int i = 0; i < reporte.size(); i++) {
                    String[] datos = reporte.get(i).split(",");
                    for (int j = 0; j < datos.length; j++) {
                        sheet.addCell(new Label(j, i + 1, datos[j])); // `i + 1` para dejar espacio al encabezado
                    }
                }
            } else {
                sheet.addCell(new Label(0, 1, "No hay datos para el rango de fechas seleccionado."));
            }

            // Escribir y cerrar el archivo Excel
            workbook.write();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
				workbook.close();
			} catch (WriteException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
    }
}
