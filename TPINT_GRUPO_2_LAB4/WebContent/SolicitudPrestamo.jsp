<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entidades.Cuenta" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Agregar Préstamo</title>
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
        <h2 class="card-title text-center mb-4">Solicitud de Préstamo</h2>
        <form action="SolicitarPrestamoServlet" method="post">
            <!-- Importe del préstamo solicitado -->
            <div class="form-group">
                <label class="form-label" for="importe">Importe del Préstamo ($):</label>
                <input type="number" class="form-control" id="importe" name="importe" min="10000" max="6500000" step="0.01" required>
                <small style="font-size: 0.9em; color: gray; display: block;">
        			Podés solicitar desde $10.000 hasta $6.500.000
    			</small>
            </div>
            
            <!-- Monto calculado -->
			<div class="form-group">
    			<label class="form-label" for="montoCalculado">Monto Total a Devolver ($):</label>
    			<input type="text" class="form-control" id="montoCalculado" name="importeCalculado" readonly>
			</div>
            
            <!-- Selección de cantidad de cuotas -->
            <div class="form-group">
                <label class="form-label" for="cuotas">Cantidad de Cuotas:</label>
                <select class="form-select" id="cuotas" name="cuotas" required>
                    <option value="6">6 cuotas</option>
                    <option value="12">12 cuotas</option>
                    <option value="24">24 cuotas</option>
                    <option value="36">36 cuotas</option>
                </select>
            </div>

            <!-- Selección de cuenta para depósito -->
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
            
            <!-- Botones de acción -->
            
            <input type="submit" class="btn btn-success m-2" value="Solicitar Préstamo">
            </form>
        <form action="DashboardCliente.jsp" method="get">
            <input type="submit" class="btn btn-danger m-2" value="Cancelar">
        </form>
    </div>
    </div>
    </div>
    </div>
<jsp:include page="Footer.jsp" />
</body>
<script>
    document.getElementById('importe').addEventListener('input', function () {
        const importe = parseFloat(this.value);
        const montoCalculado = (importe * 1.5).toFixed(2); // Calcula el 1.5x del monto
        document.getElementById('montoCalculado').value = isNaN(montoCalculado) ? '' : montoCalculado;
    });
</script>
</html>
