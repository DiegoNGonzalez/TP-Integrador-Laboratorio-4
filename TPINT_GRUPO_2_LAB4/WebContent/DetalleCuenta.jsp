<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cuenta</title>
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />

	<div class="account-management-container">
		<h2 class="edit-title">Cuenta corriente 123456789</h2>
		<h3>CBU: 00000000000</h3>
		<h3>Saldo: $5,250.00</h3>

		<div style="margin-bottom: 20px;"></div>

		<h3 class="edit-title">Historial de movimientos</h3>
		<table class="account-table">
			<thead>
				<tr>
					<th>Fecha</th>
					<th>Tipo</th>
					<th>Detalle</th>
					<th>Importe</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>01/09/2024</td>
					<td>Alta de cuenta</td>
					<td>Apertura de cuenta 123456789</td>
					<td>$10,000.00</td>

				</tr>
				<tr>
					<td>15/11/2024</td>
					<td>Transferencia</td>
					<td>Extracción de dinero en cajero</td>
					<td>- $4,750.00</td>
				</tr>

			</tbody>
		</table>
		<div style="margin-bottom: 20px;"></div>
		<div>
			<a href="Transferencia.jsp?cuentaId=11111" class="btn-aprobar">Realizar
				transferencia</a>
		</div>
	</div>

</body>
</html>