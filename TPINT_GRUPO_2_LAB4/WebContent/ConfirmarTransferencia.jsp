<%@ page import="entidades.Cuenta" %>
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
<% Cuenta cuentaOrigen = (Cuenta) request.getAttribute("cuentaOrigen");
Float monto = Float.parseFloat(request.getAttribute("monto").toString());
Cuenta cuentaDestino = (Cuenta) request.getAttribute("cuentaDestino");
String concepto = request.getAttribute("concepto").toString();
%>

	<%-- Incluir el menú de navegación desde nav.jsp --%>
	<jsp:include page="nav.jsp" />
	<div class="account-container">
		<h2 class="edit-title">Confirmar transferencia</h2>
		<form action="confirmarTransferenciaServlet" method="post">
		<!-- cuenta origen -->
			<div class="form-group">
				<label class="form-label" for="cuenta">Cuenta a debitar: <%= cuentaOrigen.getNumeroCuenta() %> </label>
				<input type="hidden" name="cuenta" value="<%= cuentaOrigen.getIdCuenta() %>">
			</div>
			<!-- cuenta destino -->
			<div class="form-group">
				<label class="form-label" for="cuentaDestino">Cuenta destino: <%= cuentaDestino.getNumeroCuenta() %></label>
				<input type="hidden" name="cuentaDestino" value="<%= cuentaDestino.getIdCuenta() %>">
			</div>
			<!-- concepto -->
			<div class="form-group">
				<label class="form-label" for="concepto">Concepto: <%= concepto%></label>
				<input type="hidden" name="concepto" value="<%= concepto%>">
			</div>
			<!-- monto -->
			<div class="form-group">
				<label class="form-label" for="monto">Monto ($): <%= monto%>.-</label>
				<input type="hidden" name="monto" value="<%= monto%>">
			</div>

			<!-- Botones de acción -->
			<input type="submit" class="btn-save" value="Confirmar" name="confirmarTransferencia">
			</form>
			<form action="DashboardCliente.jsp" method="get">
				<input type="submit" class="btn-cancel" value="Cancelar">
		</form>
	</div>
</body>
</html>