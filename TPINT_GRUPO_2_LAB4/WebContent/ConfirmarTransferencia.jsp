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
<%-- Incluir el menú de navegación desde nav.jsp --%>
<jsp:include page="nav.jsp" />
    <div class="account-container">
        <h2 class="edit-title">Confirmar transferencia</h2>
        
            <!-- cuenta origen -->
            <div class="form-group">
                <label class="form-label" for="cuentaOrigen">Cuenta de origen: Caja ahorro 123456789 - Saldo: $15,000.00</label>
            </div>
            <!-- tipo de cuenta destino -->
        	<div class="form-group">
    			<label class="form-label">Tipo de cuenta destino: de terceros</label>
			</div>
            <!-- cuenta destino -->
            <div class="form-group">
                <label class="form-label" for="cuentaDestino">Seleccione cuenta destino: Cuenta corriente - Saldo: $5,250.00</label>
            </div>
            <!-- monto -->
            <div class="form-group">
                <label class="form-label" for="monto">Monto ($): 10.000.-</label>
            </div>
            
            <!-- Botones de acción -->
            <button type="submit" class="btn-save">Realizar transferencia</button>
            <button type="reset" class="btn-cancel">Cancelar</button>
    </div>

</body>
</html>