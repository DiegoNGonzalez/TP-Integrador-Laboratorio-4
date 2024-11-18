<%@ page import="entidades.Cliente"%>
<%@ page import="entidades.Movimiento"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entidades.Cuenta"%>
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

	<%
				Cuenta cuenta = (Cuenta) request.getAttribute("cuenta");
	
		if (cuenta == null) {
	%>
	<h2>Error: No se encontró la cuenta</h2>
	<%
		} else {
	%>

	<div class="account-management-container">
		<h2 class="edit-title">
			<%=cuenta.getTipoCuenta().getTipo()%>
			-
			<%=cuenta.getNumeroCuenta()%></h2>
		<h3>
			CBU:
			<%=cuenta.getCbu()%></h3>
		<h3>
			Saldo:
			<%=cuenta.getSaldo()%>0
		</h3>

		<div style="margin-bottom: 20px;"></div>

		<h3 class="edit-title">Historial de movimientos</h3>
		<table class="account-table">
			<thead>
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
					<td colspan="4">No hay movimientos para mostrar</td>
				</tr>
				<% 
            }
        %>
			</tbody>
		</table>
		<div style="margin-bottom: 20px;"></div>

		<!-- Modificar cuando esté la lógica de transferencias -->
		<div>
			<a href="Transferencia.jsp?cuentaId=11111" class="btn-aprobar">Realizar
				transferencia</a>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>