<%@ page import="entidades.Cuenta" %>
<%@ page import="entidades.Cliente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nueva transferencia</title>
<!-- Bootstrap  -->
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body>
<% Cuenta cuentaOrigen = (Cuenta) request.getAttribute("cuentaOrigen");
Float monto = Float.parseFloat(request.getAttribute("monto").toString());
Cuenta cuentaDestino = (Cuenta) request.getAttribute("cuentaDestino");
String concepto = request.getAttribute("concepto").toString();
Cliente clienteDestino = (Cliente) request.getAttribute("clienteDestino");
%>

	<%-- Incluir el menú de navegación desde nav.jsp --%>
	<jsp:include page="nav.jsp" />
<div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow-lg p-4">
		<h2 class="card-title text-center mb-4">Confirmar transferencia</h2>
		<form action="confirmarTransferenciaServlet" method="post">
		<!-- cuenta origen -->
			<div class="form-group">
				<label class="form-label text-secondary fw-bold" for="cuenta">Cuenta a debitar: <%= cuentaOrigen.getNumeroCuenta() %> </label>
				<input type="hidden" name="cuenta" value="<%= cuentaOrigen.getIdCuenta() %>">
			</div>
			<!-- cuenta destino -->
			<div class="form-group">
				<label class="form-label text-secondary fw-bold" for="cuentaDestino">Cuenta destino: <%= cuentaDestino.getNumeroCuenta() %></label>
				<input type="hidden" name="cuentaDestino" value="<%= cuentaDestino.getIdCuenta() %>">
			</div>
						<!-- cuenta destino -->
			<div class="form-group">
				<label class="form-label text-secondary fw-bold" for="titularCuentaDestino">Titular cuenta destino: <%= clienteDestino.getNombre() %> <%= clienteDestino.getApellido() %></label>
			</div>
			<!-- concepto -->
			<div class="form-group">
				<label class="form-label text-secondary fw-bold" for="concepto">Concepto: <%= concepto%></label>
				<input type="hidden" name="concepto" value="<%= concepto%>">
			</div>
			<!-- monto -->
			<div class="form-group">
				<label class="form-label fw-bold" for="monto">Monto ($): <%= monto%>.-</label>
				<input type="hidden" name="monto" value="<%= monto%>">
			</div>

			<!-- Botones de acción -->
			<input type="submit" class="btn btn-success w-100 d-block m-2" value="Confirmar" name="confirmarTransferencia">
			</form>
			<form action="DashboardCliente.jsp" method="get">
				<input type="submit" class="btn btn-danger w-100 d-block m-2" value="Cancelar">
		</form>

	</div>
	</div>
	</div>
	</div>
</body>
</html>