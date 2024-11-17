<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="entidades.Cliente" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" type="text/css" href="css/styles.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//cdn.datatables.net/2.1.8/css/dataTables.dataTables.min.css">
<title>Mis Prestamos</title>
</head>
<body>
<jsp:include page="nav.jsp" />

<% 
    Cliente cliente = (Cliente) session.getAttribute("Cliente");
%>
<div class="client-management-container">
    <h2>Listado de Préstamos</h2>
    <div class="filter-container">
        <div class="filter-option">
            <input type="checkbox" id="filterByDate" />
            <label for="filterByDate">Filtrar por rango de fechas</label>
            <div id="dateFilter" class="filter-inputs" style="display: none;">
                <label for="startDate">Desde:</label>
                <input type="date" id="startDate" />
                <label for="endDate">Hasta:</label>
                <input type="date" id="endDate" />
            </div>
        </div>

        <div class="filter-option">
            <input type="checkbox" id="filterByAmount" />
            <label for="filterByAmount">Filtrar por rango de montos</label>
            <div id="amountFilter" class="filter-inputs" style="display: none;">
                <label for="minAmount">Mínimo:</label>
                <input type="number" id="minAmount" placeholder="$0" />
                <label for="maxAmount">Máximo:</label>
                <input type="number" id="maxAmount" placeholder="$1,000,000" />
            </div>
        </div>
        
        <button id="applyFilters" class="btn-apply">Aplicar Filtros</button>
    </div>
    
    <table id="misPrestamos" class="client-table">
        <thead>
            <tr>
                <th>Fecha de solicitud</th>
                <th>Monto solicitado</th>
                <th>Monto a abonar</th>
                <th>Cuotas</th>
                <th>Estado</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>2024-10-10</td>
                <td>$100,000</td>
                <td>$150,000</td>
                <td>12</td>
                <td class="estado estado-pendiente">Pendiente</td>
                <td><a href="DetallePrestamo.jsp?id=1" class="btn-detalle">Ver Detalle</a></td>
                <td><a href="" class="btn-pagar disabled">Pagar cuota</a></td>
            </tr>
            <tr>
                <td>2024-10-12</td>
                <td>$500,000</td>
                <td>$750,000</td>
                <td>6</td>
                <td class="estado estado-aprobado">Aprobado</td>
                <td><a href="DetallePrestamo.jsp?id=2" class="btn-detalle">Ver Detalle</a></td>
                <td><a href="PagoPrestamo.jsp?id=2" class="btn-pagar">Pagar cuota</a></td>
            </tr>
            <tr>
                <td>2024-10-15</td>
                <td>$800,500</td>
                <td>$1,000,000</td>
                <td>10</td>
                <td class="estado estado-rechazado">Rechazado</td>
                <td><a href="DetallePrestamo.jsp?id=3" class="btn-detalle">Ver Detalle</a></td>
                <td><a href="" class="btn-pagar disabled">Pagar cuota</a></td>
            </tr>
        </tbody>
    </table>
  
    <div class="solicitar-prestamo-container">
    <a href="CargarDesplegablesServlet?action=cargarCuentasCliente&idCliente=<%= cliente.getIdCliente() %>" class="btn-solicitar">Solicitar Préstamo</a>

    </div>
</div>

<script>
    $(document).ready(function() {
        $('#misPrestamos').DataTable();

        // Mostrar u ocultar filtros
        $('#filterByDate').change(function() {
            $('#dateFilter').toggle(this.checked);
        });

        $('#filterByAmount').change(function() {
            $('#amountFilter').toggle(this.checked);
        });

        // Lógica de aplicar filtros (solo front-end, sin interacción con backend)
        $('#applyFilters').click(function() {
            // Aquí puedes añadir la lógica para filtrar los datos en la tabla
            alert('Filtros aplicados. Esto es solo el front-end.');
        });
    });
</script>

</body>
</html>