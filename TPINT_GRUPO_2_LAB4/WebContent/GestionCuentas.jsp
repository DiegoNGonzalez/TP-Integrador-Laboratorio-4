<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entidades.Cliente" %>
<%@page import="entidades.Cuenta" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
<link rel="stylesheet" type="text/css" href="css/styles.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#gestion-cuentas').DataTable();
	});
	$('#filterByAmount').change(function() {
        $('#amountFilter').toggle(this.checked);
    });
</script>
<title>Gestión de Cuentas</title>
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />

<div class="account-management-container">
    <h2>Gestión de Cuentas</h2>
    <div class="filter-container">

        <div class="filter-option">
            <input type="checkbox" id="filterByAmount" />
            <label for="filterByAmount">Filtrar por rango de Saldo</label>
            <div id="amountFilter" class="filter-inputs" style="display: none;">
                <label for="minAmount">Mínimo:</label>
                <input type="number" id="minAmount" placeholder="$0" />
                <label for="maxAmount">Máximo:</label>
                <input type="number" id="maxAmount" placeholder="$1,000,000" />
            </div>
        </div>
        
        <button id="applyFilters" class="btn-apply">Aplicar Filtros</button>
    </div>
    <table class="account-table display" id="gestion-cuentas">
        <thead>
        <tr>
            <th>Cliente</th>
            <th>Fecha de Creación de la Cuenta</th>
            <th>Tipo de Cuenta</th>
            <th>Número de Cuenta</th>
            <th>CBU</th>
            <th>Saldo</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <% 
            ArrayList<Cliente> clientes = (ArrayList<Cliente>) request.getAttribute("clientes"); 
            for (Cliente cliente : clientes) { 
                ArrayList<Cuenta> cuentas = cliente.getCuentas(); 
                for (int i = 0; i < cuentas.size(); i++) { 
                    Cuenta cuenta = cuentas.get(i); 
        %>
                <tr>
                    <!-- Muestra el nombre del cliente en una celda solo en la primera cuenta -->
                    <% if (i == 0) { %>
                        <td rowspan="<%= cuentas.size() %>"><%= cliente.getNombre() %></td>
                    <% } %>
                    <td><%= cuenta.getFechaCreacion().toString() %></td>
                    <td><%= cuenta.getTipoCuenta().getTipo() %></td>
                       <td><%= cuenta.getNumeroCuenta() %></td>
                   <td><%= cuenta.getCbu() %></td>  
                    <td><%= cuenta.getSaldo() %></td>
                    <td><a href="BuscarCuentaServlet?cuentaId=<%= cuenta.getIdCuenta() %>&clienteId=<%= cliente.getIdCliente() %>&action=editarCuenta" class="btn-edit">Editar</a></td>
                </tr>
        <% 
                } 
            } 
        %>
    </tbody>
    </table>
    <br/>
    <a href="DashboardAdmin.jsp" class=" btn-volver">Volver</a>
</div>
</body>
</html>