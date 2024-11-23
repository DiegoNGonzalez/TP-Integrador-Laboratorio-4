<%@ page import="entidades.Cliente"%>
<%@ page import="entidades.Movimiento"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entidades.Cuenta"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="css/styles.css">  -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cuenta</title>
<!-- Bootstrap  -->
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body class="d-flex flex-column vh-100">
	<!-- Menú de Navegación -->
	<jsp:include page="nav.jsp" />

	<%
    			Cliente cliente = (Cliente) session.getAttribute("Cliente");
				Cuenta cuenta = (Cuenta) request.getAttribute("cuenta");
	
		if (cuenta == null) {
	%>
	<h2>Error: No se encontró la cuenta</h2>
	<%
		} else {
	%>

<div class="container mt-5 mb-5">
	<div class="row justify-content-center">
		<div class="col-md-8 col-lg-6">
			<div class="card shadow-lg p-4">
		<h2 class="mb-3" style="color: #007BFF; font-weight: bold;">
			<%=cuenta.getTipoCuenta().getTipo()%>
			-
			<%=cuenta.getNumeroCuenta()%></h2>
		<h3 class="text-muted mb-3">
			CBU:
			<%=cuenta.getCbu()%></h3>
		<h3 class="mb-3" style="color: #28a745;">
			Saldo: $
			<%=cuenta.getSaldo()%>0
		</h3>

		<div style="margin-bottom: 20px;"></div>

		<h3 class="text-center mb-4" style="color: #6c757d;">Historial de movimientos</h3>
		<table class="table table-striped table-bordered table-hover">
			<thead class="table-dark">
				<tr>
					<th>Fecha</th>
					<th>Tipo</th>
					<th>Concepto</th>
					<th>Importe</th>
				</tr>
			</thead>
			<tbody>
				<% 
			  
			ArrayList<Movimiento> listaMovimientos = cuenta.getMovimientos();
			
			if (listaMovimientos != null && !listaMovimientos.isEmpty()) {
                for (Movimiento movimiento : listaMovimientos) {
        %>
				<tr>
					<td><%= movimiento.getFechaMovimiento() %></td>
					<td><%= movimiento.getTipoMovimiento().getTipoMovimiento() %></td>
					<td><%= movimiento.getConcepto() %></td>
					<td><%= movimiento.getImporteMovimiento() %></td>
				</tr>
				<% 
                }
            } else {
        %>
				<tr>
					<td colspan="4" class="text-center">No hay movimientos para mostrar</td>
				</tr>
				<% 
            }
        %>
			</tbody>
		</table>
		<div style="margin-bottom: 20px;"></div>

<div>
    <a onclick="window.location.href='TransferenciasServlet?idCuenta=<%= cuenta.getIdCuenta() %>&idUsuario=<%= cliente.getUsuario().getId() %>&action=detalleCuenta'" 
       class="btn btn-success m-2">Realizar transferencia</a>
       <a href="DashboardCliente.jsp" class="btn btn-primary">Volver</a>
</div>

	</div>
	</div>
	</div>
	</div>
	<%
		}
	%>
<jsp:include page="Footer.jsp" />
</body>
</html>