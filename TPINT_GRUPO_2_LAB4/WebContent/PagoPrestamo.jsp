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
<div class="back-button-container" style="display: flex; align-items: center; justify-content: center;">
    <button type="submit" class="btn-save" style="width: auto; padding: 10px 15px; margin-right: 15px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer;">
        Pagar Cuota
    </button>
    <a href="DetallePrestamo.jsp" class="btn-volver" style="width: auto; padding: 10px 15px; background-color: #2196F3; color: white; text-decoration: none; border-radius: 5px; text-align: center;">
        Volver
    </a>
</div>

    </div>
</body>
</html>
