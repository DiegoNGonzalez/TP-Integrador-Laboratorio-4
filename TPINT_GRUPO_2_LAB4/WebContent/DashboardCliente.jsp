<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="entidades.Cliente" %>
<%@ page import="entidades.Cuenta" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<div class="dashboard-header">
    <h2>Bienvenido, Juan Pérez</h2>
</div>
<!-- chequear que no sea null -->
<% Cliente cliente = (Cliente) request.getAttribute("cliente");  
    ArrayList<Cuenta> listaCuentas = cliente.getCuentas(); 
    Iterator<Cuenta> iteradorCuentas = listaCuentas.iterator();
    
    while (iteradorCuentas.hasNext()) {
        Cuenta cuenta = iteradorCuentas.next();
%>

<div class="account-cliente-principal">
		<h2 class="edit-title"><%= cuenta.getTipoCuenta().getTipo() %> $ <%= cuenta.getSaldo() %> .-</h2>
		<h3>CBU: <%= cuenta.getCbu() %></h3>
		<h3>Saldo: $ <%= cuenta.getSaldo() %></h3>
		<div>
			<a href="DetalleCuenta.jsp" class="btn-aprobar">Ver detalle</a>
			<a href="DetalleCuentaServlet?cuenta=<%= cuenta %>" class="btn-edit" >Editar</a>
		</div>
</div>
       
<% 
    } 
%>

<div class="dashboard-content">
    <div class="dashboard-card" onclick="window.location.href='MisCuentas.jsp'">
        <h3>Mis cuentas</h3>
        <p>Gestiona tus cuentas</p>
    </div>
    <div class="dashboard-card" onclick="window.location.href='MisPrestamos.jsp'">
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