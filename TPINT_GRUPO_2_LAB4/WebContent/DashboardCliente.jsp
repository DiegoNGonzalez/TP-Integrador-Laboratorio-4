<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.Cliente" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Home</title>
</head>
<body>

<jsp:include page="nav.jsp" />
<!-- Contenido del Dashboard -->
<% 
    Cliente cliente = (Cliente) session.getAttribute("Cliente");
    if (cliente != null) {
        String nombreCliente = cliente.getNombre(); // Obtén el nombre del cliente
%>
<div class="dashboard-header">
    <h2>Bienvenido, <%= nombreCliente %></h2>
</div>
<% } %>
<div class="account-cliente-principal">
		<h2 class="edit-title">Cuenta corriente 123456789</h2>
		<h3>CBU: 00000000000</h3>
		<h3>Saldo: $5,250.00</h3>
		<div>
			<a href="DetalleCuenta.jsp" class="btn-aprobar">Ver detalle</a>
		</div>
</div>
<div class="dashboard-content">
    <div class="dashboard-card" onclick="window.location.href='MisCuentas.jsp'">
        <h3>Mis cuentas</h3>
        <p>Gestiona tus cuentas</p>
    </div>
    <div class="dashboard-card" onclick="window.location.href='ListarPrestamosServlet'">
        <h3>Mis prestamos</h3>
        <p>Gestiona tus prestamos</p>
    </div>
    <div class="dashboard-card" onclick="window.location.href='PerfilCliente.jsp'">
        <h3>Mi perfil</h3>
        <p>Ver mis datos personales</p>
    </div>
    <div class="dashboard-card" onclick="window.location.href='Transferencia.jsp'">
        <h3>Transferencias</h3>
        <p>Realizar nueva transferencia</p>
    </div>
</div>
</body>
</html>