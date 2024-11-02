<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nueva transferencia</title>
</head>
<body>
	<!-- Menú de Navegación -->
	<nav class="navbar">
		<div class="navbar-container">
			<div class="navbar-brand">
				<a href="DashboardCliente.jsp">Banco XYZ - UTN</a>
			</div>
			<div class="navbar-user">
				<% if (session.getAttribute("usuario") != null) { %>
				<span>Bienvenido, <%= session.getAttribute("usuario") %></span> <a
					href="Logout.jsp" class="logout-button">Cerrar Sesión</a>
				<% } else { %>
				<span>No hay usuario logueado</span>
				<% } %>
			</div>
		</div>
	</nav>

    <div class="account-container">
        <h2 class="edit-title">Nueva transferencia</h2>
        
            <!-- Selección de cuenta origen -->
            <div class="form-group">
                <label class="form-label" for="cuentaOrigen">Seleccione cuenta de origen:</label>
                <select class="form-control" id="cuentaOrigen" name="cuentaOrigen" required>
                    <option value="1">Caja ahorro 123456789 - Saldo: $15,000.00</option>
                    <option value="2">Cuenta corriente - Saldo: $5,250.00</option>
                </select>
            </div>
            <!-- Selección de tipo de cuenta destino -->
        	<div class="form-group">
    			<label class="form-label">Seleccione tipo de cuenta destino:</label>
    			<div class="radio-option">
        			<input type="radio" id="cuentaPropia" name="tipoCuentaDestino" value="propia" required>
        			<label for="cuentaPropia">Cuenta propia</label>
    			</div>
    			<div class="radio-option">
        			<input type="radio" id="cuentaTerceros" name="tipoCuentaDestino" value="terceros">
        			<label for="cuentaTerceros">Cuenta de terceros</label>
    			</div>
			</div>

            
            <!-- Selección de cuenta destino -->
            <div class="form-group">
                <label class="form-label" for="cuentaDestino">Seleccione cuenta destino:</label>
                <select class="form-control" id="cuentaDestino" name="cuentaDestino" required>
                    <option value="1">Caja ahorro 123456789 - Saldo: $15,000.00</option>
                    <option value="2">Cuenta corriente - Saldo: $5,250.00</option>
                </select>
            </div>
                        <div class="form-group">
                <label class="form-label" for="monto">Monto ($):</label>
                <input type="number" class="form-control" id="monto" name="monto" min="1" step="0.01" required>
            </div>
            
            
            <!-- Botones de acción -->
            <button type="submit" class="btn-save">Realizar transferencia</button>
            <button type="reset" class="btn-cancel">Cancelar</button>
    </div>

</body>
</html>