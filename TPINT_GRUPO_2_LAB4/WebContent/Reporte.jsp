<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--  <link rel="stylesheet" type="text/css" href="css/styles.css"> -->
<!-- Bootstrap  -->
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>


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
	<!-- Men� de Navegaci�n -->
	<jsp:include page="nav.jsp" />
<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-md-8 col-lg-6">
			<div class="card shadow-lg p-4">
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
					<option value="prestamos">Pr�stamos</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary mt-2">Generar Reporte</button>
		</form>

		<!-- Tabla de resultados -->
		<table id="reporte" class="account-table">
			<thead>
				<tr>
					<%
						String tipoReporte = (String) request.getAttribute("tipoReporte");
						if ("contabilidad".equals(tipoReporte)) {
					%>
					<th>A�o</th>
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
			<button type="submit" class="btn btn-success mt-2" <% if (!tieneDatos) { %>disabled<% } %>>Exportar a Excel</button>
		</form>

		<div class="back-button-container">
			<a href="DashboardAdmin.jsp" class="btn btn-secondary mt-2">Volver</a>
		</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>
