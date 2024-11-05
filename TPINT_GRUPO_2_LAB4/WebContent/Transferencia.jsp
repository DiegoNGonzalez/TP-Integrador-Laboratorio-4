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
<jsp:include page="nav.jsp" />

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
            
                        <!--Ingreso de CBU -->
            
                        <div class="form-group">
                <label class="form-label" for="cbu">Ingrese CBU cuenta de terceros:</label>
                <input type="number" class="form-control" id="cbu" name="cbu" min="1000000000000000000000" step="1" max="9999999999999999999999" pattern="\d{22}" required>
            </div>
            
                        <div class="form-group">
                <label class="form-label" for="monto">Monto a transferir ($):</label>
                <input type="number" class="form-control" id="monto" name="monto" min="1" step="0.01" required>
            </div>
            
            
            <!-- Botones de acción -->
            <button type="submit" class="btn-save">Realizar transferencia</button>
        <form action="DashboardCliente.jsp" method="get">
            <button type="submit" class="btn-cancel">Cancelar</button>
        </form>
    </div>

</body>
</html>