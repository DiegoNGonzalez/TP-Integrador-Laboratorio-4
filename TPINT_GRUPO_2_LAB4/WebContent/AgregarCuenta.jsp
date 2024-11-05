<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Agregar Cuenta</title>
</head>
<body>
<!-- Men� de Navegaci�n -->
<jsp:include page="nav.jsp" />

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
                
            </select>
        </div>

        <!-- N�mero de Cuenta -->
        <div class="form-group">
            <label for="numeroCuenta" class="form-label">N�mero de Cuenta</label>
            <input type="text" id="numeroCuenta" name="numeroCuenta" class="form-control" value="12345678" readonly>
        </div>

        <!-- CBU -->
        <div class="form-group">
            <label for="cbu" class="form-label">CBU</label>
            <input type="text" id="cbu" name="cbu" class="form-control" value="123456789" readonly>
        </div>

        <!-- Saldo -->
        <div class="form-group">
            <label for="saldo" class="form-label">Saldo</label>
            <input type="number" step="0.01" id="saldo" name="saldo" class="form-control" value="10.000" readonly>
        </div>

        <!-- Bot�n para Guardar la Nueva Cuenta -->
        <input type="submit" class="btn-save" value="Guardar Cuenta" onclick="window.location.href='GestionCuentas.jsp'">

        <!-- Bot�n para Cancelar y Volver -->
        <input type="button" class="btn-cancel" onclick="window.location.href='GestionCuentas.jsp'" value="Cancelar">
    </form>
    <br/>
    <a href="DashboardAdmin.jsp" class=" btn-volver">Volver</a>
</div>
</body>
</html>