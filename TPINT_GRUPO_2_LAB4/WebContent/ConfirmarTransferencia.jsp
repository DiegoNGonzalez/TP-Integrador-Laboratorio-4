<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nueva transferencia</title>
</head>
<body>
	<%-- Incluir el menú de navegación desde nav.jsp --%>
	<jsp:include page="nav.jsp" />
	<div class="account-container">
		<h2 class="edit-title">Confirmar transferencia</h2>

		<!-- cuenta origen -->
		<div class="form-group">
			<label class="form-label" for="cuentaOrigen">Cuenta de
				origen: Caja ahorro 123456789</label>
		</div>
		<!-- cuenta destino -->
		<div class="form-group">
			<label class="form-label" for="cuentaDestino">Cuenta destino:
				Cuenta corriente 989898989</label>
		</div>
		<!-- titular cuenta destino -->
		<div class="form-group">
			<label class="form-label">Titular cuenta destino: Pablo Lopez</label>
		</div>
		<!-- monto -->
		<div class="form-group">
			<label class="form-label" for="monto">Monto ($): 10.000.-</label>
		</div>

		<!-- Botones de acción -->
		<form action="DashboardCliente.jsp" method="get">
			<input type="submit" class="btn-save" value="Confirmar">
		</form>
		<form action="Transferencia.jsp" method="get">
			<input type="submit" class="btn-cancel" value="Cancelar">
		</form>
	</div>

</body>
</html>