<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Panel Administrador</title>
</head>
<body>
<!-- Menú de Navegación -->
<nav class="navbar">
    <div class="navbar-container">
        <div class="navbar-brand">
            <a href="DashboardAdmin.jsp">Banco XYZ - UTN</a>
        </div>
        <div class="navbar-user">
            <% if (session.getAttribute("usuario") != null) { %>
                <span>Bienvenido, <%= session.getAttribute("usuario") %></span>
                <a href="Logout.jsp" class="logout-button">Cerrar Sesión</a>
            <% } else { %>
                <span>No hay usuario logueado</span>
            <% } %>
        </div>
    </div>
</nav>

<!-- Contenido del Dashboard -->
<div class="dashboard-header">
    <h2>Bienvenido, Administrador</h2>
    <p>Resumen del día y accesos rápidos a las secciones principales.</p>
</div>

<div class="dashboard-content">
    <div class="dashboard-card" onclick="window.location.href='MenuCliente.jsp'">
        <h3>Menú de Clientes</h3>
        <p>Gestión de clientes y perfiles.</p>
    </div>
    <div class="dashboard-card" onclick="window.location.href='GestionCuentas.jsp'">
        <h3>Cuentas</h3>
        <p>Administración de cuentas bancarias.</p>
    </div>
    <div class="dashboard-card" onclick="window.location.href='GestionPrestamos.jsp'">
        <h3>Gestión de Préstamos</h3>
        <p>Control y seguimiento de préstamos.</p>
    </div>
    <div class="dashboard-card" onclick="window.location.href='InformeEstadistico.jsp'">
        <h3>Informe Estadístico</h3>
        <p>Estadísticas y reportes financieros.</p>
    </div>
</div>
</body>
</html>
