<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#reporte').DataTable();
	});
</script>
<title>Reporte Estadístico de Transacciones</title>
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />
    <div class="account-management-container">
        <h2 class="edit-title">Reporte Estadístico de Transacciones</h2>

        <!-- Filtro de fechas -->
        <form action="GenerarReporteServlet" method="get">
            <div class="form-group">
                <label class="form-label" for="fechaInicio">Fecha Inicio:</label>
                <input type="date" class="form-control" id="fechaInicio" name="fechaInicio" required>
            </div>
            <div class="form-group">
                <label class="form-label" for="fechaFin">Fecha Fin:</label>
                <input type="date" class="form-control" id="fechaFin" name="fechaFin" required>
            </div>
            <button type="submit" class="btn-save">Generar Reporte</button>
        </form>
        
          <div class="filter-container">
    <button type="submit" class="btn-save">Filtrar</button>
    <select name="opciones">
        <option value="opcion1">Opción 1</option>
        <option value="opcion2">Opción 2</option>
        <option value="opcion3">Opción 3</option>
    </select>
</div>
        
        <!-- Tabla de resultados -->
        <table id="reporte" class="account-table">
            <thead>
                <tr>
                    <th>Año</th>
                    <th>Mes</th>
                    <th>Cantidad de Movimientos</th>
                    <th>Saldo Positivo</th>
                    <th>Saldo Negativo</th>
                    <th>Saldo del Mes</th>
                    
                </tr>
            </thead>
            <tbody>
    <% 
        ArrayList<String> reporte = (ArrayList<String>) request.getAttribute("reporte");
        if (reporte != null) {
            for (String linea : reporte) {
                String[] datos = linea.split(","); // Asume que los datos vienen en formato CSV
    %>
                <tr>
                    <td><%= datos[0] %></td>
                    <td><%= datos[1] %></td>
                    <td><%= datos[2] %></td>
                    <td><%= datos[3] %></td>
                    <td><%= datos[4] %></td>
                    <td><%= datos[5] %></td>
                    
                </tr>
    <%
            }
        } else {
    %>
                <tr>
                    <td colspan="6">No hay datos para el rango de fechas seleccionado.</td>
                </tr>
    <%
        }
    %>
</tbody>

        </table>
            <div class="back-button-container">
        <a href="DashboardAdmin.jsp" class="btn-volver">Volver</a>
        </div>
    </div>
</body>
</html>
