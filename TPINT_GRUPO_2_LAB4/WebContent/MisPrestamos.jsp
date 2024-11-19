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
    <title>Mis Pr�stamos</title>
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
    <h2>Listado de Pr�stamos</h2>
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
                <label for="minAmount">M�nimo:</label>
                <input type="number" id="minAmount" placeholder="$0" />
                <label for="maxAmount">M�ximo:</label>
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
            <td colspan="7">No se encontraron pr�stamos</td>
        </tr>
    <% } %>
</tbody>

    </table>
  
    <div class="solicitar-prestamo-container">
        <a href="CargarDesplegablesServlet?action=cargarCuentasCliente&idCliente=<%= cliente.getIdCliente() %>" class="btn-solicitar">Solicitar Pr�stamo</a>
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

        // L�gica de aplicar filtros (solo front-end, sin interacci�n con backend)
        $('#applyFilters').click(function() {
            alert('Filtros aplicados. Esto es solo el front-end.');
        });
    });
</script>

</body>
</html>
