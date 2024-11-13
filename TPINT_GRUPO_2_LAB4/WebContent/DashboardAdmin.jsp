<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Panel Administrador</title>
</head>
<body>
<!-- Men� de Navegaci�n -->
<jsp:include page="nav.jsp" />

<!-- Contenido del Dashboard -->
<div class="dashboard-header">
    <h2>Bienvenido, Administrador</h2>
    <p>Resumen del d�a y accesos r�pidos a las secciones principales.</p>
</div>

<div class="dashboard-content">
    <div class="dashboard-card" onclick="window.location.href='ListarClientesServlet'">
        <h3>Men� de Clientes</h3>
        <p>Gesti�n de clientes y perfiles.</p>
    </div>
    <div class="dashboard-card" onclick="window.location.href='GestionCuentas.jsp'">
        <h3>Cuentas</h3>
        <p>Administraci�n de cuentas bancarias.</p>
    </div>
    <div class="dashboard-card" onclick="window.location.href='GestionPrestamos.jsp'">
        <h3>Gesti�n de Pr�stamos</h3>
        <p>Control y seguimiento de pr�stamos.</p>
    </div>
    <div class="dashboard-card" onclick="window.location.href='Reporte.jsp'">
        <h3>Informe Estad�stico</h3>
        <p>Estad�sticas y reportes financieros.</p>
    </div>
</div>
</body>
</html>
