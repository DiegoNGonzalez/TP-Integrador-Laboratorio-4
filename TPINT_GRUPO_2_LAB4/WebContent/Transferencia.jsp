<%@ page import="entidades.Cliente" %>
<%@ page import="entidades.Cuenta" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
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
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />
<% Cliente cliente = (Cliente) request.getAttribute("cliente");
Cuenta cuentaSeleccionada = (Cuenta) request.getAttribute("cuenta");
ArrayList<Cuenta> listaCuentas = cliente.getCuentas(); %>

    <div class="account-container">
        <h2 class="edit-title">Nueva transferencia</h2>
        <form action="confirmarTransferenciaServlet" method="post" >
            <!-- Selección de cuenta origen -->
          	<div class="form-group">
			    <label for="cuentaOrigen" class="form-label">Seleccione cuenta de origen:</label>
<select name="cuenta" id="cuenta" class="form-control">
    <%
        if (cuentaSeleccionada != null) {
            // Si hay una cuenta seleccionada, mostrarla como única opción y deshabilitar el desplegable
    %>
            <option value="<%= cuentaSeleccionada.getIdCuenta() %>" selected>
                <%= cuentaSeleccionada.getNumeroCuenta() %> - <%= cuentaSeleccionada.getTipoCuenta().getTipo() %>
            </option>
    <%  
        } else {
            // Si no hay cuenta seleccionada, mostrar todas las cuentas disponibles
            if (listaCuentas != null && !listaCuentas.isEmpty()) {
                for (Cuenta cuenta : listaCuentas) {
    %>
                    <option value="<%= cuenta.getIdCuenta() %>">
                        <%= cuenta.getNumeroCuenta() %> - <%= cuenta.getTipoCuenta().getTipo() %>
                    </option>
    <%  
                }
            } else {
    %>
                <option value="">No hay cuentas disponibles</option>
    <%  
            }
        }
    %>
</select>
			</div>
            
            <!-- Selección de tipo de cuenta destino -->
        	<div class="form-group">
    			<label class="form-label">Seleccione tipo de cuenta destino:</label>
    			<div class="radio-option">
        			<input type="radio" id="cuentaPropia" name="tipoCuentaDestino" value="propia" onclick= "mostrarDestino('propia')" checked>
        			<label for="cuentaPropia">Cuenta propia</label>
    			</div>
    			<div class="radio-option">
        			<input type="radio" id="cuentaTerceros" name="tipoCuentaDestino" value="terceros" onclick= "mostrarDestino('terceros')">
        			<label for="cuentaTerceros">Cuenta de terceros</label>
    			</div>
			</div>

	           <!-- Selección de cuenta destino -->
	           <div id="destinoCuentaPropia" class="form-group">
			    <label class="form-label" for="cbuDestinoPropio">Seleccione cuenta destino:</label>
			     <select class="form-control" id="cbuDestinoPropio" name="cbuDestinoPropio">
			        <option value="">Seleccione cuenta...</option>
			        
			        <% 
			            for (Cuenta cuenta : listaCuentas) {
			        %>
			            <option value="<%= cuenta.getCbu() %>"><%= cuenta.getTipoCuenta().getTipo() %> Saldo: $ <%=cuenta.getSaldo() %>.-</option>
			        <% 
			            }
			        %>
			    </select>
			</div>
            
           <!--Ingreso de CBU -->
           <div id="destinoCbu" class="form-group hidden">
               <label class="form-label" for="cbu">Ingrese CBU cuenta de terceros:</label>
               <!--<input type="number" class="form-control" id="cbu" name="cbu" min="1000000000000000000000" step="1" max="9999999999999999999999" pattern="\d{22}" required>-->
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
	         <!-- Botón para Cancelar y Volver -->
       		 <button type="button" class="btn-cancel" onclick="window.location.href='DashboardCliente.jsp'">Cancelar</button>
    </form>
    </div>
   <script>
	    function mostrarDestino(tipo) {
	        const destinoCuentaPropia = document.getElementById('destinoCuentaPropia');
	        const destinoCbu = document.getElementById('destinoCbu');
	
	        if (tipo === 'propia') {
	            destinoCuentaPropia.classList.remove('hidden'); // Mostrar cuenta propia
	            destinoCbu.classList.add('hidden'); // Ocultar CBU
	        } else if (tipo === 'terceros') {
	            destinoCbu.classList.remove('hidden'); // Mostrar CBU
	            destinoCuentaPropia.classList.add('hidden'); // Ocultar cuenta propia
	        }
	    }
	</script>
</body>
</html>