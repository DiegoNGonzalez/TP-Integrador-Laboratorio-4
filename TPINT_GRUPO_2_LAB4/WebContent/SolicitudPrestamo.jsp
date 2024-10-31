<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Agregar Préstamo</title>
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
    <div class="account-container">
        <h2 class="edit-title">Solicitud de Préstamo</h2>
        
            <!-- Importe del préstamo solicitado -->
            <div class="form-group">
                <label class="form-label" for="importe">Importe del Préstamo ($):</label>
                <input type="number" class="form-control" id="importe" name="importe" min="1" step="0.01" required>
            </div>
            
            <!-- Selección de cantidad de cuotas -->
            <div class="form-group">
                <label class="form-label" for="cuotas">Cantidad de Cuotas:</label>
                <select class="form-control" id="cuotas" name="cuotas" required>
                    <option value="6">6 cuotas</option>
                    <option value="12">12 cuotas</option>
                    <option value="24">24 cuotas</option>
                    <option value="36">36 cuotas</option>
                </select>
            </div>

            <!-- Selección de cuenta para depósito -->
            <div class="form-group">
                <label class="form-label" for="cuentaDestino">Cuenta para Depósito:</label>
                <select class="form-control" id="cuentaDestino" name="cuentaDestino" required>
                    <option value="123456789">Cuenta Ahorro - 123456789</option>
                    <option value="987654321">Cuenta Corriente - 987654321</option>
                </select>
            </div>
            
            <!-- Botones de acción -->
            <button type="submit" class="btn-save">Solicitar Préstamo</button>
            <button type="reset" class="btn-cancel">Cancelar</button>
    </div>
</body>
</html>
