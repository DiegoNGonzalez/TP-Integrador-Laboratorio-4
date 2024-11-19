<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entidades.Cuenta" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Agregar Pr�stamo</title>
</head>
<body>
<!-- Men� de Navegaci�n -->
<jsp:include page="nav.jsp" />
    <div class="account-container">
        <h2 class="edit-title">Solicitud de Pr�stamo</h2>
        <form action="SolicitarPrestamoServlet" method="post">
            <!-- Importe del pr�stamo solicitado -->
            <div class="form-group">
                <label class="form-label" for="importe">Importe del Pr�stamo ($):</label>
                <input type="number" class="form-control" id="importe" name="importe" min="10000" max="10000000" step="0.01" required>
                <small style="font-size: 0.9em; color: gray; display: block;">
        			Pod�s solicitar desde $10.000 hasta $10.000.000.
    			</small>
            </div>
            
            <!-- Selecci�n de cantidad de cuotas -->
            <div class="form-group">
                <label class="form-label" for="cuotas">Cantidad de Cuotas:</label>
                <select class="form-control" id="cuotas" name="cuotas" required>
                    <option value="6">6 cuotas</option>
                    <option value="12">12 cuotas</option>
                    <option value="24">24 cuotas</option>
                    <option value="36">36 cuotas</option>
                </select>
            </div>

            <!-- Selecci�n de cuenta para dep�sito -->
            <div class="form-group">
                <label class="form-label" for="cuentaDestino">Cuenta a Acreditar:</label>
      <select class="form-control" id="cuentaDestino" name="cuentaDestino" required>
        <%
            ArrayList<Cuenta> listaCuentas = (ArrayList<Cuenta>) request.getAttribute("listaCuentas");
            if (listaCuentas != null && !listaCuentas.isEmpty()) {
                for (Cuenta cuenta : listaCuentas) {
        %>
        <option value="<%= cuenta.getIdCuenta() %>">Cuenta - <%= cuenta.getNumeroCuenta() %></option>
        <%      }
            } else {
        %>
        <option value="">No hay cuentas disponibles</option>
        <% } %>
    </select>
            </div>
            
            <!-- Botones de acci�n -->
            <input type="submit" class="btn-save" value="Solicitar Pr�stamo">
            </form>
        <form action="DashboardCliente.jsp" method="get">
            <input type="submit" class="btn-cancel" value="Cancelar">
        </form>
    </div>
</body>
</html>
