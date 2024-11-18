<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.Cuota" %>
<%@ page import="entidades.Cuenta" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Gestion de Préstamos</title>
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />
    <div class="account-container">
        <h2 class="edit-title">Menú de Pago de Préstamos</h2>
        
            <!-- Selección de cuota a pagar -->
            <div class="form-group">
        <label class="form-label" for="cuota">Cuotas Pendientes de Pago:</label>
        <select class="form-control" id="cuota" name="cuota" required>
            <% 
                // Recuperar la lista de cuotas desde el atributo request
                ArrayList<Cuota> cuotasPendientes = (ArrayList<Cuota>) request.getAttribute("cuotasPendientes");
                if (cuotasPendientes != null) {
                    for (Cuota cuota : cuotasPendientes) {
            %>
                        <option value="<%= cuota.getIdCuota() %>">
                            Cuota <%= cuota.getNumCuota() %> - Vencimiento: <%= cuota.getFechaPago() %> - Monto: $<%= cuota.getMontoAPagar() %>
                        </option>
            <% 
                    } 
                } else { 
            %>
                    <option>No hay cuotas pendientes</option>
            <% 
                }
            %>
        </select>
    </div>
            
            <!-- Selección de cuenta de débito -->
            <div class="form-group">
                <label class="form-label" for="cuentaDebito">Cuenta para Débito:</label>
                <select class="form-control" id="cuentaDebito" name="cuentaDebito" required>
                    <%
            			ArrayList<Cuenta> listaCuentas = (ArrayList<Cuenta>) request.getAttribute("listaCuentas");
            				if (listaCuentas != null && !listaCuentas.isEmpty()) {
                				for (Cuenta cuenta : listaCuentas) {
        			%>
        				<option value="<%= cuenta.getTipoCuenta() %>">Cuenta - <%= cuenta.getNumeroCuenta() %></option>
        			<%      }
            			} else {
        			%>
        				<option value="">No hay cuentas disponibles</option>
        			<% } %>
                </select>
            </div>
            
            <!-- Botones de acción -->
<div class="back-button-container" style="display: flex; align-items: center; justify-content: center;">
    <button type="submit" class="btn-save" style="width: auto; padding: 10px 15px; margin-right: 15px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer;">
        Pagar Cuota
    </button>
    <a href="ListarPrestamosServlet" class="btn-volver" style="width: auto; padding: 10px 15px; background-color: #2196F3; color: white; text-decoration: none; border-radius: 5px; text-align: center;">
        Volver
    </a>
</div>

    </div>
</body>
</html>
