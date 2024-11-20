<%@ page import="entidades.Cliente" %>
<%@ page import="entidades.Cuenta" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="css/styles.css">  -->
<style>
    .hidden {
        display: none;
    }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nueva transferencia</title>
<!-- Bootstrap  -->
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="nav.jsp" />
<% 
    Cliente cliente = (Cliente) request.getAttribute("cliente");
    Cuenta cuentaSeleccionada = (Cuenta) request.getAttribute("cuenta");
    ArrayList<Cuenta> listaCuentas = cliente.getCuentas(); 
    boolean tieneUnaCuenta = (listaCuentas != null && listaCuentas.size() == 1);
    boolean tieneMasDeUnaCuenta = (listaCuentas != null && listaCuentas.size() > 1);
%>

<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-md-8 col-lg-6">
			<div class="card shadow-lg p-4">
    <h2 class="text-center mb-4">Nueva transferencia</h2>
    <form action="confirmarTransferenciaServlet" method="post">
        <!-- Selecci�n de cuenta origen -->
        <div class="form-group mb-3">
            <label for="cuentaOrigen" class="form-label">Seleccione cuenta de origen:</label>
            <select name="cuenta" id="cuentaOrigen" class="form-select" onchange="actualizarDestino()" 
                <%= cuentaSeleccionada != null ? "disabled" : "" %> >
                <% 
                    if (cuentaSeleccionada != null) {
                %>
                    <option value="<%= cuentaSeleccionada.getIdCuenta() %>" selected>
                        <%= cuentaSeleccionada.getNumeroCuenta() %> - <%= cuentaSeleccionada.getTipoCuenta().getTipo() %>
                    </option>
                <%  
                    } else if (listaCuentas != null && !listaCuentas.isEmpty()) {
                        for (Cuenta cuenta : listaCuentas) {
                %>
                    <option value="<%= cuenta.getIdCuenta() %>">
                        <%= cuenta.getTipoCuenta().getTipo() %> <%= cuenta.getNumeroCuenta() %> - Saldo: $<%=cuenta.getSaldo() %>
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
        
        <!-- Selecci�n de tipo de cuenta destino -->
        <div class="form-group mb-3">
            <label class="form-label">Seleccione tipo de cuenta destino:</label>
            <div class="form-check">
                <input type="radio" id="cuentaPropia" name="tipoCuentaDestino" value="propia" 
                       onclick="mostrarDestino('propia')" 
                       <%= tieneUnaCuenta ? "disabled" : "" %> >
                <label for="cuentaPropia">Cuenta propia</label>
            </div>
            <div class="form-check">
                <input type="radio" id="cuentaTerceros" name="tipoCuentaDestino" value="terceros" 
                       onclick="mostrarDestino('terceros')" 
                       <%= tieneUnaCuenta ? "checked" : "" %> required>
                <label for="cuentaTerceros">Cuenta de terceros</label>
            </div>
        </div>

        <!-- Selecci�n de cuenta destino -->
        <div id="destinoCuentaPropia" class="form-group <%= tieneUnaCuenta ? "hidden" : "" %> mb-3">
            <label class="form-label" for="cbuDestinoPropio">Seleccione cuenta destino:</label>
            <select class="form-select" id="cbuDestinoPropio" name="cbuDestinoPropio">
                <option value="">Seleccione cuenta...</option>
                <% 
                    for (Cuenta cuenta : listaCuentas) {
                %>
                    <option value="<%= cuenta.getIdCuenta() %>" data-numero-cuenta="<%= cuenta.getNumeroCuenta() %>">
                        <%= cuenta.getTipoCuenta().getTipo() %> <%= cuenta.getNumeroCuenta() %>
                    </option>
                <% 
                    }
                %>
            </select>
        </div>

        <!-- Ingreso de CBU (solo cuando se seleccione cuenta de terceros) -->
        <div id="destinoCbu" class="form-group <%= tieneUnaCuenta ? "" : "hidden" %> mb-3">
            <label class="form-label" for="cbu">Ingrese CBU cuenta de terceros:</label>
            <input type="number" class="form-control" id="cbuTercero" name="cbuTercero" required>
        </div>

        <div class="form-group mb-3">
            <label class="form-label" for="monto">Monto a transferir ($):</label>
            <input type="number" class="form-control" id="monto" name="monto" min="1" step="0.01" required>
        </div>

        <div class="form-group mb-3">
            <label class="form-label" for="concepto">Concepto:</label>
            <input type="text" class="form-control" id="concepto" name="concepto" placeholder="Ingrese concepto" required>
        </div>
        <!-- Botones de acci�n -->
<div class="col-12 d-flex justify-content-center">
        <button type="submit" class="btn btn-success m-2" name="realizarTransferencia">Realizar transferencia</button>
        <button type="button" class="btn btn-danger m-2" onclick="window.location.href='DashboardCliente.jsp'">Cancelar</button>
</div>
    </form>
    </div>
    </div>
    </div>
</div>

<script>
function mostrarDestino(tipo) {
    const destinoCuentaPropia = document.getElementById('destinoCuentaPropia');
    const destinoCbu = document.getElementById('destinoCbu');

    if (tipo === 'propia') {
        destinoCuentaPropia.classList.remove('hidden');
        destinoCbu.classList.add('hidden');
        actualizarDestino();
    } else if (tipo === 'terceros') {
        destinoCuentaPropia.classList.add('hidden');
        destinoCbu.classList.remove('hidden');
    }
}

function actualizarDestino() {
    const cuentaOrigen = document.getElementById('cuentaOrigen').value;
    const destinoCuentaPropia = document.getElementById('cbuDestinoPropio');
    for (let i = 0; i < destinoCuentaPropia.options.length; i++) {
        const option = destinoCuentaPropia.options[i];
        option.disabled = (option.value === cuentaOrigen);
    }
    if (destinoCuentaPropia.value === cuentaOrigen) {
        destinoCuentaPropia.value = '';
    }
}

window.onload = function () {
    // Si hay m�s de una cuenta, mantener los campos ocultos por defecto
    if (<%= tieneMasDeUnaCuenta %>) {
        document.getElementById('destinoCuentaPropia').classList.add('hidden');
        document.getElementById('destinoCbu').classList.add('hidden');
    }
    if (document.getElementById('cuentaTerceros').checked) {
        mostrarDestino('terceros');
    }
};
</script>
</body>
</html>
