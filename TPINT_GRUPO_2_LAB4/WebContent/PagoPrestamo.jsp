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
        String cuotaSeleccionada = (String) request.getAttribute("cuotaSeleccionada");
        int prestamoId = (Integer) request.getAttribute("prestamoId");
        ArrayList<Cuota> cuotasPendientes = (ArrayList<Cuota>) request.getAttribute("cuotasPendientes");
        if (cuotasPendientes != null) {
            for (Cuota cuota : cuotasPendientes) {
                String selected = (cuotaSeleccionada != null && cuotaSeleccionada.equals(String.valueOf(cuota.getIdCuota()))) ? "selected" : "";
    %>
                <option value="<%= cuota.getIdCuota() %>" <%= selected %>>
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
        <input type="hidden" name="prestamoId" value="<%= prestamoId %>">
    </div>
            
            <!-- Selección de cuenta de débito -->
            <div class="form-group">
                <label class="form-label m-2" for="cuentaDebito">Cuenta para Débito:</label>
<select class="form-select m-2" id="cuentaDebito" name="cuentaDebito" required>
    <%
        String cuentaDebitoSeleccionada = (String) request.getAttribute("cuentaDebitoSeleccionada");
        ArrayList<Cuenta> listaCuentas = (ArrayList<Cuenta>) request.getAttribute("listaCuentas");
        if (listaCuentas != null && !listaCuentas.isEmpty()) {
            for (Cuenta cuenta : listaCuentas) {
                String selected = (cuentaDebitoSeleccionada != null && cuentaDebitoSeleccionada.equals(String.valueOf(cuenta.getIdCuenta()))) ? "selected" : "";
    %>
                <option value="<%= cuenta.getIdCuenta() %>" <%= selected %>>
                    Cuenta - <%= cuenta.getNumeroCuenta() %> - Saldo: $<%= cuenta.getSaldo()%>
                </option>
    <%
            }
        } else {
    %>
            <option value="">No hay cuentas disponibles</option>
    <% 
        }
    %>
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
<!-- Contenedor del Toast -->
<div aria-live="polite" aria-atomic="true" class="position-fixed top-0 end-0 p-3" style="z-index: 11">
    <div id="toastMessage" 
         class="toast align-items-center text-bg-primary border-0" 
         role="alert" 
         aria-live="assertive" 
         aria-atomic="true" 
         data-bs-autohide="false">
        <div class="d-flex">
            <div class="toast-body">
                <!-- Aquí aparecerá el mensaje -->
            </div>
            <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>

<script>
    <% 
        String toastMessage = (String) request.getAttribute("toastMessage");
        String toastType = (String) request.getAttribute("toastType");
        if (toastMessage != null && toastType != null) { 
    %>
    $(document).ready(function() {
        let toastElement = $('#toastMessage');
        toastElement.addClass('bg-<%= toastType %>'); // Añadir tipo de mensaje (warning, success, etc.)
        toastElement.find('.toast-body').text('<%= toastMessage %>'); // Mensaje del toast
        let toast = new bootstrap.Toast(toastElement[0]);
        toast.show();
    });
    <% } %>
</script>
</body>
<jsp:include page="Footer.jsp" />
</html>
