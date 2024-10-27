<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
	<jsp:include page="css\styles.css"></jsp:include>
</style>
<title>Panel Administrador </title>
</head>
<body>

<nav style="background-color: #3a7bd5; padding: 10px; color: white;">
    <div style="display: flex; justify-content: space-between; align-items: center;">

        <div>
            <a href="DashboardAdmin.jsp" style="color: white; text-decoration: none; font-size: 20px; font-weight: bold;">
                Banco XYZ - UTN
            </a>
        </div>
        
        <!-- Secci�n de usuario y cierre de sesi�n -->
        <div>
            <%-- Verificaci�n de usuario logueado (para despu�s) --%>
            <% if (session.getAttribute("usuario") != null) { %>
                <span>Bienvenido, <%= session.getAttribute("usuario") %></span>
                <a href="Logout.jsp" style="color: white; margin-left: 15px; text-decoration: none;">Cerrar Sesi�n</a>
            <% } else { %>
                <span>No hay usuario logueado</span>
            <% } %>
        </div>
    </div>
</nav>

    <div class="dashboard-header">
        <h2>Bienvenido, Administrador</h2>
        <p>Resumen del d�a y accesos r�pidos a las secciones principales.</p>
    </div>

    <!-- Secci�n de resumen con tarjetas de acceso r�pido -->
    <div class="dashboard-content">
        <!-- Tarjetas de acceso r�pido -->
        <div class="dashboard-card" onclick="window.location.href='MenuClientes.jsp'">
            <h3>Men� de Clientes</h3>
            <p>Gesti�n de clientes y perfiles.</p>
        </div>
        <div class="dashboard-card" onclick="window.location.href='Cuenta.jsp'">
            <h3>Cuentas</h3>
            <p>Administraci�n de cuentas bancarias.</p>
        </div>
        <div class="dashboard-card" onclick="window.location.href='GestionPrestamos.jsp'">
            <h3>Gesti�n de Pr�stamos</h3>
            <p>Control y seguimiento de pr�stamos.</p>
        </div>
        <div class="dashboard-card" onclick="window.location.href='InformeEstadistico.jsp'">
            <h3>Informe Estad�stico</h3>
            <p>Estad�sticas y reportes financieros.</p>
        </div>
    </div>

</body>
</html>