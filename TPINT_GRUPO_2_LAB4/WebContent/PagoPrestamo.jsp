<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Gestion de Pr�stamos</title>
</head>
<body>
<!-- Men� de Navegaci�n -->
<jsp:include page="nav.jsp" />
    <div class="account-container">
        <h2 class="edit-title">Men� de Pago de Pr�stamos</h2>
        
            <!-- Selecci�n de cuota a pagar -->
            <div class="form-group">
                <label class="form-label" for="cuota">Cuotas Pendientes de Pago:</label>
                <select class="form-control" id="cuota" name="cuota" required>
                    <option value="1">Cuota 1 - Vencimiento: 2024-11-01 - Monto: $1,000.00</option>
                    <option value="2">Cuota 2 - Vencimiento: 2024-12-01 - Monto: $1,000.00</option>
                    <option value="3">Cuota 3 - Vencimiento: 2025-01-01 - Monto: $1,000.00</option>
                </select>
            </div>
            
            <!-- Selecci�n de cuenta de d�bito -->
            <div class="form-group">
                <label class="form-label" for="cuentaDebito">Cuenta para D�bito:</label>
                <select class="form-control" id="cuentaDebito" name="cuentaDebito" required>
                    <option value="123456789">Cuenta Ahorro - 123456789</option>
                    <option value="987654321">Cuenta Corriente - 987654321</option>
                </select>
            </div>
            
            <!-- Botones de acci�n -->
            <button type="submit" class="btn-save">Pagar Cuota</button>
            <button type="reset" class="btn-cancel">Cancelar</button>
    </div>
</body>
</html>
