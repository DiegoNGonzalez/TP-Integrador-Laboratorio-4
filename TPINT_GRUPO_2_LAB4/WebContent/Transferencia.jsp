<%@ page import="entidades.Cliente" %>
<%@ page import="entidades.Cuenta" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<style>
    .hidden {
        display: none;
    }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nueva transferencia</title>
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

<div class="account-container">
    <h2 class="edit-title">Nueva transferencia</h2>
    <form action="confirmarTransferenciaServlet" method="post">
        <!-- Selección de cuenta origen -->
        <div class="form-group">
            <label for="cuentaOrigen" class="form-label">Seleccione cuenta de origen:</label>
            <select name="cuenta" id="cuentaOrigen" class="form-control" onchange="actualizarDestino()" 
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
        
        <!-- Selección de tipo de cuenta destino -->
        <div class="form-group">
            <label class="form-label">Seleccione tipo de cuenta destino:</label>
            <div class="radio-option">
                <input type="radio" id="cuentaPropia" name="tipoCuentaDestino" value="propia" 
                       onclick="mostrarDestino('propia')" 
                       <%= tieneUnaCuenta ? "disabled" : "" %> >
                <label for="cuentaPropia">Cuenta propia</label>
            </div>
            <div class="radio-option">
                <input type="radio" id="cuentaTerceros" name="tipoCuentaDestino" value="terceros" 
                       onclick="mostrarDestino('terceros')" 
                       <%= tieneUnaCuenta ? "checked" : "" %> >
                <label for="cuentaTerceros">Cuenta de terceros</label>
            </div>
        </div>

        <!-- Selección de cuenta destino -->
        <div id="destinoCuentaPropia" class="form-group <%= tieneUnaCuenta ? "hidden" : "" %>">
            <label class="form-label" for="cbuDestinoPropio">Seleccione cuenta destino:</label>
            <select class="form-control" id="cbuDestinoPropio" name="cbuDestinoPropio">
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
        <div id="destinoCbu" class="form-group <%= tieneUnaCuenta ? "" : "hidden" %>">
            <label class="form-label" for="cbu">Ingrese CBU cuenta de terceros:</label>
            <input type="number" class="form-control" id="cbuTercero" name="cbuTercero">
        </div>

        <div class="form-group">
            <label class="form-label" for="monto">Monto a transferir ($):</label>
            <input type="number" class="form-control" id="monto" name="monto" min="1" step="0.01" required>
        </div>

        <div class="form-group">
            <label class="form-label" for="concepto">Concepto:</label>
            <input type="text" class="form-control" id="concepto" name="concepto" placeholder="Ingrese concepto" required>
        </div>

        <!-- Botones de acción -->
        <button type="submit" class="btn-save" name="realizarTransferencia">Realizar transferencia</button>
        <button type="button" class="btn-cancel" onclick="window.location.href='DashboardCliente.jsp'">Cancelar</button>
    </form>
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
    // Si hay más de una cuenta, mantener los campos ocultos por defecto
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
