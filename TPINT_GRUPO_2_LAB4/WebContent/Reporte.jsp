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
                    <th>Fecha</th>
                    <th>Concepto</th>
                    <th>Débitos</th>
                    <th>Créditos</th>
                    <th>Saldo</th>
                </tr>
            </thead>
            <tbody>
                
                <tr>
                    <td>2024-10-01</td>
                    <td>Pago de Préstamo</td>
                    <td>$1,000.00</td>
                    <td>$0.00</td>
                    <td>$9,000.00</td>
                </tr>
                <tr>
                    <td>2024-10-15</td>
                    <td>Ingreso de Nómina</td>
                    <td>$0.00</td>
                    <td>$2,500.00</td>
                    <td>$11,500.00</td>
                </tr>
            </tbody>
        </table>
            <div class="back-button-container">
        <a href="DashboardAdmin.jsp" class="btn-volver">Volver</a>
        </div>
    </div>
</body>
</html>
