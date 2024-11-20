<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#reporte').DataTable();
	});
</script>
<title>Generar Reporte</title>
</head>
<body>
	<!-- Menú de Navegación -->
	<jsp:include page="nav.jsp" />
	<div class="account-management-container">
		<h2 class="edit-title">Generar Reporte</h2>

		<!-- Filtro de fechas y tipo de reporte -->
		<form action="GenerarReporteServlet" method="get">
			<div class="form-group">
				<label class="form-label" for="fechaInicio">Fecha Inicio:</label> <input
					type="date" class="form-control" id="fechaInicio"
					name="fechaInicio" required>
			</div>
			<div class="form-group">
				<label class="form-label" for="fechaFin">Fecha Fin:</label> <input
					type="date" class="form-control" id="fechaFin" name="fechaFin"
					required>
			</div>
			<div class="form-group">
				<label class="form-label" for="tipoReporte">Tipo de Reporte:</label>
				<select id="tipoReporte" name="tipoReporte" class="form-control"
					required>
					<option value="contabilidad">Contabilidad</option>
					<option value="prestamos">Préstamos</option>
				</select>
			</div>
			<button type="submit" class="btn-save">Generar Reporte</button>
		</form>

		<!-- Tabla de resultados -->
		<table id="reporte" class="account-table">
			<thead>
				<tr>
					<%
						String tipoReporte = (String) request.getAttribute("tipoReporte");
						if ("contabilidad".equals(tipoReporte)) {
					%>
					<th>Año</th>
					<th>Mes</th>
					<th>Cantidad de Movimientos</th>
					<th>Saldo Positivo</th>
					<th>Saldo Negativo</th>
					<th>Saldo del Mes</th>
					<%
						} else if ("prestamos".equals(tipoReporte)) {
					%>
					<th>ID Prestamo</th>
					<th>Cliente</th>
					<th>Monto Solicitado</th>
					<th>Monto Pendiente</th>
					<th>Fecha de Solicitud</th>
					<%
						}
					%>
				</tr>
			</thead>
			<tbody>

				<%
					ArrayList<String> reporte = (ArrayList<String>) request.getAttribute("reporte");
					boolean tieneDatos = (reporte != null && !reporte.isEmpty());

					if (reporte != null) {
						for (String linea : reporte) {
							String[] datos = linea.split(","); // Asume que los datos vienen en formato CSV
				%>
				<tr>
					<%
						if ("contabilidad".equals(tipoReporte)) {
					%>
					<td><%=datos[0]%></td>
					<td><%=datos[1]%></td>
					<td><%=datos[2]%></td>
					<td><%=datos[3]%></td>
					<td><%=datos[4]%></td>
					<td><%=datos[5]%></td>
					<%
						} else if ("prestamos".equals(tipoReporte)) {
					%>
					<td><%=datos[0]%></td>
					<td><%=datos[1]%></td>
					<td><%=datos[2]%></td>
					<td><%=datos[3]%></td>
					<td><%=datos[4]%></td>
					<%
						}
					%>
				</tr>
				<%
					}
					} else {
				%>
				<tr>
					<td colspan="6">No hay datos para el rango de fechas
						seleccionado.</td>
				</tr>
				<%
					}
				%>

			</tbody>
		</table>

		<form action="ExportarExcelServlet" method="get">
			<button type="submit" class="btn-save" <% if (!tieneDatos) { %>disabled<% } %>>Exportar a Excel</button>
		</form>

		<div class="back-button-container">
			<a href="DashboardAdmin.jsp" class="btn-volver">Volver</a>
		</div>
	</div>
</body>
</html>
