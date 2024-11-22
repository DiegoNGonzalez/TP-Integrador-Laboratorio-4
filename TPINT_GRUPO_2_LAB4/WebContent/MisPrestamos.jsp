<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entidades.Prestamo" %>
<%@ page import="entidades.Cliente" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <!-- Bootstrap  -->
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <title>Mis Préstamos</title>
<link rel="stylesheet" type="text/css" href="css/styles2.css">
</head>
<body class="d-flex flex-column vh-100">
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


<div class="container flex-grow-1 my-4">
    
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="mx-auto mb-0">Mis Prestamos</h2>
	</div>
    <hr class="border-dark my-3">
    <div class="row"> 
    <form id="filterForm" action="FiltrosServlet" method="GET">
    <input type="hidden" name="action" value="filtrarMisPrestamos">
    <div class="filter-container d-flex align-items-center gap-3 mb-5">
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
        
        <button type="submit" id="applyFilters" class="btn btn-primary m-2">Aplicar Filtros</button>
        <button type="button" id="clearFilters" class="btn btn-danger m-2" >Limpiar Filtros</button>
    </div>
    </form>
    </div>
    <table id="misPrestamos" class="table table-striped">
        <thead class="table-dark" >
            <tr>
                <th>Fecha de solicitud</th>
                <th>Monto a Abonar</th>
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
                <td><%= prestamo.getCantCuotas() %></td>
<td class="estado 
    <%= prestamo.getEstado().equals("Activo") ? "estado-aprobado" : 
        prestamo.getEstado().equals("Pendiente") ? "estado-pendiente" : prestamo.getEstado().equals("Finalizado") ? "estado-aprobado" : "estado-rechazado"%>">
    <%= 
        prestamo.getEstado().equals("Activo") ? "Aprobado" : 
        prestamo.getEstado().equals("Pendiente") ? "Pendiente" : prestamo.getEstado().equals("Finalizado") ? "Finalizado" : "Rechazado"
    %>
</td>
               <td><a href="BuscarPrestamoServlet?prestamoId=<%= prestamo.getIdPrestamo() %>&origen=MisPrestamos" class="btn btn-info">Detalle</a></td>
                                <td>
                    <% if (prestamo.getEstado().equals("Activo")) { %>
                        <a href="BuscarCuotasServlet?prestamoId=<%= prestamo.getIdPrestamo() %>&origen=MisPrestamos&action=listarPendientes" class="btn btn-success">
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
  
    <div class="col-12 d-flex justify-content-center">
        <a href="CargarDesplegablesServlet?action=cargarCuentasCliente&idCliente=<%= cliente.getIdCliente() %>" class="btn btn-success m-2">Solicitar Nuevo Préstamo</a>
        <a href="DashboardCliente.jsp" class="btn btn-primary m-2"> Volver </a>
    </div>
</div>
<script src="//cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
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
		$('#misPrestamos').DataTable();
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
<jsp:include page="Footer.jsp" />
</html>
