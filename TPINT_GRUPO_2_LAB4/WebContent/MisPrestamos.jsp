<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entidades.Prestamo" %>
<%@ page import="entidades.Cliente" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="//cdn.datatables.net/2.1.8/css/dataTables.dataTables.min.css">
    <title>Mis Préstamos</title>
</head>
<body>
<jsp:include page="nav.jsp" />

<% 
    Cliente cliente = (Cliente) session.getAttribute("Cliente");
    ArrayList<Prestamo> prestamos = (ArrayList<Prestamo>) request.getAttribute("prestamos");
    String mensajePrestamoPendiente = (String) request.getAttribute("mensaje");
    if (mensajePrestamoPendiente != null) { 
%>
<script>
    alert("<%= mensajePrestamoPendiente %>");
</script>
<% 
    }  
%>


<div class="client-management-container">
    <h2>Listado de Préstamos</h2>
    <form id="filterForm" action="FiltrosServlet" method="GET">
    <input type="hidden" name="action" value="filtrarMisPrestamos">
    <div class="filter-container">
        <div class="filter-option">
            <input type="checkbox" id="filterByDatePrestamos" name="filterByDate" />
            <label for="filterByDate">Filtrar por rango de fechas</label>
            <div id="dateFilter" class="filter-inputs" style="display: none;">
                <label for="startDate">Desde:</label>
                <input type="date" id="startDate" name="startDate" />
                <label for="endDate">Hasta:</label>
                <input type="date" id="endDate" name="endDate" />
            </div>
        </div>

        <div class="filter-option">
            <input type="checkbox" id="filterByAmountPrestamos" name="filterByAmount" />
            <label for="filterByAmount">Filtrar por rango de montos</label>
            <div id="amountFilter" class="filter-inputs" style="display: none;">
                <label for="minAmount">Mínimo:</label>
                <input type="number" id="minAmount" name="minAmount" placeholder="$0" />
                <label for="maxAmount">Máximo:</label>
                <input type="number" id="maxAmount" name="maxAmount" placeholder="$1,000,000" />
            </div>
        </div>
        
        <button type="submit" id="applyFilters" class="btn-apply">Aplicar Filtros</button>
        <button type="button" id="clearFilters" class="btn-clean">Limpiar Filtros</button>
    </div>
    </form>
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
    <% if (prestamos != null && !prestamos.isEmpty()) { %>
        <% for (Prestamo prestamo : prestamos) { %>
            <tr>
                <td>
                    <% 
                        if (prestamo.getFechaAltaPrestamo() != null) {
                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                            String fechaFormateada = sdf.format(prestamo.getFechaAltaPrestamo());
                            out.print(fechaFormateada); // Mostrar fecha formateada
                        } else {
                            out.print("No disponible"); // Mostrar si la fecha es null
                        }
                    %>
                </td>
                <td>$<%= prestamo.getImporteTotal() %></td>
                <td>$<%= prestamo.getImporteTotal() %></td>
                <td><%= prestamo.getCantCuotas() %></td>
<td class="estado 
    <%= prestamo.getEstado().equals("Activo") ? "estado-aprobado" : 
        prestamo.getEstado().equals("Pendiente") ? "estado-pendiente" : "estado-rechazado" %>">
    <%= 
        prestamo.getEstado().equals("Activo") ? "Aprobado" : 
        prestamo.getEstado().equals("Pendiente") ? "Pendiente" : "Rechazado" 
    %>
</td>
               <td><a href="BuscarPrestamoServlet?prestamoId=<%= prestamo.getIdPrestamo() %>&origen=MisPrestamos" class="btn-detalle">Detalle</a></td>
                                <td>
                    <% if (prestamo.getEstado().equals("Activo")) { %>
                        <a href="BuscarCuotasServlet?prestamoId=<%= prestamo.getIdPrestamo() %>&origen=MisPrestamos&action=listarPendientes" class="btn-pagar">
    					Pagar cuota
						</a>
                    <% } %>
                </td>
            </tr>
        <% } %>
    <% } else { %>
        <tr>
            <td colspan="7">No se encontraron préstamos</td>
        </tr>
    <% } %>
</tbody>

    </table>
  
    <div class="solicitar-prestamo-container">
        <a href="CargarDesplegablesServlet?action=cargarCuentasCliente&idCliente=<%= cliente.getIdCliente() %>" class="btn-solicitar">Solicitar Préstamo</a>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    // Mostrar u ocultar filtros según los checkboxes
    $('#filterByDatePrestamos').change(function() {
        $('#dateFilter').toggle(this.checked);
    });

    $('#filterByAmountPrestamos').change(function() {
        $('#amountFilter').toggle(this.checked);
    });

    // Para el botón de limpiar filtros
    $('#clearFilters').click(function() {
        // Redirigir a la misma página para limpiar los filtros
        window.location.href = 'ListarPrestamosServlet'
    });
});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#prestamosRechazados').DataTable();
		 // Mostrar u ocultar filtros
        $('#filterByDateRechazados').change(function() {
            $('#dateFilterRechazados').toggle(this.checked);
        });

        $('#filterByAmountRechazados').change(function() {
            $('#amountFilterRechazados').toggle(this.checked);
        });

        // Lógica de aplicar filtros (solo front-end, sin interacción con backend)
        $('#applyFiltersRechazados').click(function() {
            // Aquí puedes añadir la lógica para filtrar los datos en la tabla
            alert('Filtros aplicados. Esto es solo el front-end.');
        });
	});
</script>

</body>
</html>
