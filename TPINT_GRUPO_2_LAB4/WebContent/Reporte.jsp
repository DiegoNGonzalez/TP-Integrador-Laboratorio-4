<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Reporte Estadístico de Transacciones</title>
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
                <a href="Logout.jsp" class="logout-button">Cerrar Sesión</a>
            <% } else { %>
                <span>No hay usuario logueado</span>
            <% } %>
        </div>
    </div>
</nav>
    <div class="account-management-container">
        <h2 class="edit-title">Reporte Estadístico de Transacciones</h2>

        <!-- Filtro de fechas -->
        <form action="GenerarReporteServlet" method="get">
            <div class="form-group">
                <label class="form-label" for="fechaInicio">Fecha Inicio:</label>
                <input type="date" class="form-control" id="fechaInicio" name="fechaInicio" required>
            </div>
            <div class="form-group">
                <label class="form-label" for="fechaFin">Fecha Fin:</label>
                <input type="date" class="form-control" id="fechaFin" name="fechaFin" required>
            </div>
            <button type="submit" class="btn-save">Generar Reporte</button>
        </form>
        
        <!-- Tabla de resultados -->
        <table class="account-table">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Concepto</th>
                    <th>Débitos</th>
                    <th>Créditos</th>
                    <th>Saldo</th>
                </tr>
            </thead>
            <tbody>
                
                <tr>
                    <td>2024-10-01</td>
                    <td>Pago de Préstamo</td>
                    <td>$1,000.00</td>
                    <td>$0.00</td>
                    <td>$9,000.00</td>
                </tr>
                <tr>
                    <td>2024-10-15</td>
                    <td>Ingreso de Nómina</td>
                    <td>$0.00</td>
                    <td>$2,500.00</td>
                    <td>$11,500.00</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
