<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.Cuota" %>
<%@ page import="entidades.Cuenta" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link rel="stylesheet" type="text/css" href="css/styles.css">  -->
<title>Gestion de Préstamos</title>
<!-- Bootstrap  -->
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body class="d-flex flex-column vh-100">
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />
<div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow-lg p-4">
        <h2 class="card-title text-center mb-4">Menú de Pago de Préstamos</h2>
        <form action="PagarPrestamoServlet" method="post">
            <!-- Selección de cuota a pagar -->
            <div class="form-group">
        <label class="form-label m-2" for="cuota">Cuotas Pendientes de Pago:</label>
        <select class="form-select m-2" id="cuota" name="cuota" required>
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
                <label class="form-label m-2" for="cuentaDebito">Cuenta para Débito:</label>
                <select class="form-select m-2" id="cuentaDebito" name="cuentaDebito" required>
                    <%
            			ArrayList<Cuenta> listaCuentas = (ArrayList<Cuenta>) request.getAttribute("listaCuentas");
            				if (listaCuentas != null && !listaCuentas.isEmpty()) {
                				for (Cuenta cuenta : listaCuentas) {
        			%>
        				<option value="<%= cuenta.getIdCuenta() %>">
        				Cuenta - <%= cuenta.getNumeroCuenta() %> - Saldo: $<%= cuenta.getSaldo()%>
        				</option>
        			<%      }
            			} else {
        			%>
        				<option value="">No hay cuentas disponibles</option>
        			<% } %>
                </select>
            </div>
            
            <!-- Botones de acción -->
<div class="col-12 d-flex justify-content-center">
    <input type="submit" value="Pagar cuota"class="btn btn-success m-2">
        
    <a href="ListarPrestamosServlet" class="btn btn-primary m-2">
        Volver
    </a>
</div>
</form>
    </div>
    </div>
    </div>
    </div>
</body>
<jsp:include page="Footer.jsp" />
</html>
