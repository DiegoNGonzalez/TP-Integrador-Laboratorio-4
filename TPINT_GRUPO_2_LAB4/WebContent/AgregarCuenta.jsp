<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Insert title here</title>
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
<div class="account-container">
    <h2 class="add-title">Agregar Nueva Cuenta</h2>
    <form action="agregarCuenta.jsp" method="post">
        
        <!-- Cliente Asignado -->
        <div class="form-group">
            <label for="cliente" class="form-label">Cliente Asignado</label>
            <select id="cliente" name="cliente" class="form-control">
                <option value="">Seleccione un cliente</option>
                <option value="1">Juan P�rez</option>
                <option value="2">Mar�a G�mez</option>
                <option value="3">Pedro S�nchez</option>
                <!-- Agregar m�s clientes seg�n sea necesario -->
            </select>
        </div>

        <!-- Fecha de Creaci�n -->
        <div class="form-group">
            <label for="fechaCreacion" class="form-label">Fecha de Creaci�n</label>
            <input type="date" id="fechaCreacion" name="fechaCreacion" class="form-control">
        </div>

        <!-- Tipo de Cuenta -->
        <div class="form-group">
            <label for="tipoCuenta" class="form-label">Tipo de Cuenta</label>
            <select id="tipoCuenta" name="tipoCuenta" class="form-control">
                <option value="">Seleccione el tipo de cuenta</option>
                <option value="ahorro">Ahorro</option>
                <option value="corriente">Corriente</option>
                <option value="inversion">Inversi�n</option>
                <!-- Otros tipos de cuenta seg�n sea necesario -->
            </select>
        </div>

        <!-- N�mero de Cuenta -->
        <div class="form-group">
            <label for="numeroCuenta" class="form-label">N�mero de Cuenta</label>
            <input type="text" id="numeroCuenta" name="numeroCuenta" class="form-control" placeholder="Ingrese el n�mero de cuenta">
        </div>

        <!-- CBU -->
        <div class="form-group">
            <label for="cbu" class="form-label">CBU</label>
            <input type="text" id="cbu" name="cbu" class="form-control" placeholder="Ingrese el CBU">
        </div>

        <!-- Saldo -->
        <div class="form-group">
            <label for="saldo" class="form-label">Saldo</label>
            <input type="number" step="0.01" id="saldo" name="saldo" class="form-control" placeholder="Ingrese el saldo inicial">
        </div>

        <!-- Bot�n para Guardar la Nueva Cuenta -->
        <button type="submit" class="btn-save">Guardar Cuenta</button>

        <!-- Bot�n para Cancelar y Volver -->
        <button type="button" class="btn-cancel" onclick="window.location.href='GestionCuentas.jsp'">Cancelar</button>
    </form>
</div>
</body>
</html>