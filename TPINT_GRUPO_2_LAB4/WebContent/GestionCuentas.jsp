<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Gesti�n de Cuentas</title>
</head>
<body>
<nav class="navbar">
    <div class="navbar-container">
        <div class="navbar-brand">
            <a href="DashboardAdmin.jsp">Banco XYZ - UTN</a>
        </div>
        <div class="navbar-user">
            <% if (session.getAttribute("usuario") != null) { %>
                <span>Bienvenido, <%= session.getAttribute("usuario") %></span>
                <a href="Logout.jsp" class="logout-button">Cerrar Sesi�n</a>
            <% } else { %>
                <span>No hay usuario logueado</span>
            <% } %>
        </div>
    </div>
</nav>
<div class="account-management-container">
    <h2>Gesti�n de Cuentas</h2>
    <table class="account-table">
        <thead>
            <tr>
                <th>Cliente Asignado</th>
                <th>Fecha de Creaci�n</th>
                <th>Tipo de Cuenta</th>
                <th>N�mero de Cuenta</th>
                <th>CBU</th>
                <th>Saldo</th>
                <th>Acci�n</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Juan P�rez</td>
                <td>2024-01-15</td>
                <td>Ahorro</td>
                <td>123456789</td>
                <td>0123456789123456789012</td>
                <td>$15,000.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=123456789" class="btn-edit">Editar</a></td>
            </tr>
            <tr>
                <td>Mar�a G�mez</td>
                <td>2023-11-05</td>
                <td>Corriente</td>
                <td>987654321</td>
                <td>2109876543210987654321</td>
                <td>$5,250.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=987654321" class="btn-edit">Editar</a></td>
            </tr>
            
        </tbody>
    </table>
</div>
</body>
</html>