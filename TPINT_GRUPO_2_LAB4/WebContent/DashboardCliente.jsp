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

<div class="account-cliente-principal">
		<h2 class="edit-title">Cuenta corriente 123456789</h2>
		<h3>CBU: 00000000000</h3>
		<h3>Saldo: $5,250.00</h3>
		<div>
			<a href="DetalleCuenta.jsp" class="btn-aprobar">Ver detalle</a>
		</div>
</div>
<div class="dashboard-content">
    <div class="dashboard-card" onclick="window.location.href='MenuCliente.jsp'">
        <h3>Mis cuentas</h3>
        <p>Gestiona tus cuentas</p>
    </div>
    <div class="dashboard-card" onclick="window.location.href='GestionCuentas.jsp'">
        <h3>Mis prestamos</h3>
        <p>Gestiona tus prestamos</p>
    </div>
    <div class="dashboard-card" onclick="window.location.href='PerfilCliente.jsp'">
        <h3>Mi perfil</h3>
    </div>
    <div class="dashboard-card" onclick="window.location.href='Transferencia.jsp'">
        <h3>Transferir pesos</h3>
    </div>
</div>
</body>
</html>