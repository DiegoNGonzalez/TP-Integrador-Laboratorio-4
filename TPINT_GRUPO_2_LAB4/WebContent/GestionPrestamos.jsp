<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="daoImpl.PrestamoDaoImpl" %>
<%@ page import="entidades.Prestamo" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
      crossorigin="anonymous">

<!-- DataTables CSS compatible con Bootstrap 5 -->
<link href="https://cdn.datatables.net/2.1.8/js/dataTables.bootstrap5.js" 
      rel="stylesheet">

<!-- Toastr CSS (si lo estás usando para notificaciones) -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" 
      rel="stylesheet" />

<!-- jQuery (solo una vez) -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<!-- Popper.js (requerido para Bootstrap) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" 
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" 
        crossorigin="anonymous"></script>

<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js" 
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" 
        crossorigin="anonymous"></script>

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.bootstrap5.js"></script>

<!-- Toastr JS (si lo estás usando para notificaciones) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$('#prestamosAprobados').DataTable();
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#prestamosRechazados').DataTable();
	});
</script>
<title>Gestión de Prestamos</title>
</head>
<body class="d-flex flex-column vh-100">
<jsp:include page="nav.jsp" />
<div class="container my-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <a href="DashboardAdmin.jsp" class="btn btn-primary">
            Volver
        </a>
        <h2 class="mx-auto mb-0">Gestión Prestamos</h2> 
    </div>
    <hr class="border-dark my-3">
    
  <div class="card border-warning shadow-lg" style="border-width: 3px; border-color: #ffc107;">
  <div class="card-header text-center">
  <h2 class="mt-2">Prestamos Pendientes</h2>
  </div>
    <div class="filter-container d-flex align-items-center mt-3">
        <div class="filter-option">
            <input type="checkbox" id="filterByDatePendientes" />
            <label for="filterByDate">Filtrar por rango de fechas</label>
            <div id="dateFilterPendientes" class="filter-inputs" style="display: none;">
                <label for="startDate">Desde:</label>
                <input type="date" id="startDate" />
                <label for="endDate">Hasta:</label>
                <input type="date" id="endDate" />
            </div>
        </div>

        <div class="filter-option">
            <input type="checkbox" id="filterByAmountPendientes" />
            <label for="filterByAmount">Filtrar por rango de montos</label>
            <div id="amountFilterPendientes" class="filter-inputs" style="display: none;">
                <label for="minAmount">Mínimo:</label>
                <input type="number" id="minAmount" placeholder="$0" />
                <label for="maxAmount">Máximo:</label>
                <input type="number" id="maxAmount" placeholder="$1,000,000" />
            </div>
        </div>
        
        <button id="applyFiltersPendientes" class="btn btn-primary">Aplicar Filtros</button>
    </div>
<section class="mt-2">
            <div class="table-responsive">
                <table id="prestamosPendientes" class="table table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>Cliente</th>
                            <th>Monto</th>
                            <th>Cuotas</th>
                            <th>Fecha de Solicitud</th>
                            <th>Aprobar</th>
                            <th>Rechazar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        ArrayList<Prestamo> prestamosPendientes = (ArrayList<Prestamo>) request.getAttribute("prestamosPendientes");
                        for (Prestamo prestamo : prestamosPendientes) { %>
                        <tr>
                            <td><%= prestamo.getCliente().getNombre() + ", " + prestamo.getCliente().getApellido() %></td>
                            <td><%= prestamo.getImporteTotal() %></td>
                            <td><%= prestamo.getCantCuotas() %></td>
                            <td><%= prestamo.getFechaAltaPrestamo() %></td>
                            <td><a href="AprobarPrestamoServlet?prestamoId=<%= prestamo.getIdPrestamo() %>" class="btn btn-success btn-sm">Aprobar</a></td>
                            <td><a href="RechazarPrestamoServlet?prestamoId=<%= prestamo.getIdPrestamo() %>" class="btn btn-danger btn-sm">Rechazar</a></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </section>
	</div>

  <div class="card mt-5 border-success shadow-lg" style="border-width: 3px; border-color: #ffc107;">
  <div class="card-header text-center">
  <h2 class="mt-2">Prestamos Aprobados</h2>
  </div>
    <div class="filter-container d-flex align-items-center mt-3">
        <div class="filter-option">
            <input type="checkbox" id="filterByDateAprobados" />
            <label for="filterByDate">Filtrar por rango de fechas</label>
            <div id="dateFilterAprobados" class="filter-inputs" style="display: none;">
                <label for="startDate">Desde:</label>
                <input type="date" id="startDate" />
                <label for="endDate">Hasta:</label>
                <input type="date" id="endDate" />
            </div>
        </div>

        <div class="filter-option">
            <input type="checkbox" id="filterByAmountAprobados" />
            <label for="filterByAmount">Filtrar por rango de montos</label>
            <div id="amountFilterAprobados" class="filter-inputs" style="display: none;">
                <label for="minAmount">Mínimo:</label>
                <input type="number" id="minAmount" placeholder="$0" />
                <label for="maxAmount">Máximo:</label>
                <input type="number" id="maxAmount" placeholder="$1,000,000" />
            </div>
        </div>
        
        <button id="applyFiltersAprobados" class="btn btn-primary">Aplicar Filtros</button>
    </div>
<section class="mt-2">
            <div class="table-responsive">
                <table id="prestamosAprobados" class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Cliente</th>
                            <th>Monto</th>
                            <th>Cuotas</th>
                            <th>Fecha de Solicitud</th>
                            <th>Detalle</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        ArrayList<Prestamo> prestamosAprobados = (ArrayList<Prestamo>) request.getAttribute("prestamosAprobados");
                        for (Prestamo prestamo : prestamosAprobados) { %>
                        <tr>
                            <td><%= prestamo.getCliente().getNombre() + ", " + prestamo.getCliente().getApellido() %></td>
                            <td><%= prestamo.getImporteTotal() %></td>
                            <td><%= prestamo.getCantCuotas() %></td>
                            <td><%= prestamo.getFechaAltaPrestamo() %></td>
                            <td><a href="BuscarPrestamoServlet?prestamoId=<%= prestamo.getIdPrestamo() %>&origen=Gestionprestamos" class="btn btn-info btn-sm">Detalle</a></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </section>
	 </div>
  <div class="card mt-5 mb-5 border-danger shadow-lg" style="border-width: 3px; border-color: #ffc107;">
  <div class="card-header text-center">
  <h2 class="mt-2">Prestamos Rechazados</h2>
  </div>
     
     <div class="filter-container d-flex align-items-center mt-3">
        <div class="filter-option">
            <input type="checkbox" id="filterByDateRechazados" />
            <label for="filterByDate">Filtrar por rango de fechas</label>
            <div id="dateFilterRechazados" class="filter-inputs" style="display: none;">
                <label for="startDate">Desde:</label>
                <input type="date" id="startDate" />
                <label for="endDate">Hasta:</label>
                <input type="date" id="endDate" />
            </div>
        </div>

        <div class="filter-option">
            <input type="checkbox" id="filterByAmountRechazados" />
            <label for="filterByAmount">Filtrar por rango de montos</label>
            <div id="amountFilterRechazados" class="filter-inputs" style="display: none;">
                <label for="minAmount">Mínimo:</label>
                <input type="number" id="minAmount" placeholder="$0" />
                <label for="maxAmount">Máximo:</label>
                <input type="number" id="maxAmount" placeholder="$1,000,000" />
            </div>
        </div>
        
        <button id="applyFiltersRechazados" class="btn btn-primary">Aplicar Filtros</button>
    </div>
    <table id="prestamosRechazados" class="table table-striped">
    <thead class="table-dark">
        <tr>
            <th>Cliente</th>
            <th>Monto</th>
            <th>Cuotas</th>
            <th>Fecha de solicitud</th>
            <th>Detalle</th>             
        </tr>
    </thead>
    <tbody>
        <% 
        ArrayList<Prestamo> prestamosRechazados = (ArrayList<Prestamo>) request.getAttribute("prestamosRechazados");
        for (Prestamo prestamo : prestamosRechazados) { %>
            <tr>
                <td><%= prestamo.getCliente().getNombre() + ", "+ prestamo.getCliente().getApellido()%></td>  <!-- Asumiendo que el cliente tiene un método getNombre() -->
                <td><%= prestamo.getImporteTotal() %></td>
                <td><%= prestamo.getCantCuotas() %></td>
                <td><%= prestamo.getFechaAltaPrestamo() %></td>
                <td><a href="BuscarPrestamoServlet?prestamoId=<%= prestamo.getIdPrestamo() %>&origen=Gestionprestamos" class="btn btn-info">Detalle</a></td>
            </tr>
        <% } %>
    </tbody>
</table>
</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('#prestamosPendientes').DataTable();
		 // Mostrar u ocultar filtros
        $('#filterByDatePendientes').change(function() {
            $('#dateFilterPendientes').toggle(this.checked);
        });

        $('#filterByAmountPendientes').change(function() {
            $('#amountFilterPendientes').toggle(this.checked);
        });
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#prestamosAprobados').DataTable();
		 // Mostrar u ocultar filtros
        $('#filterByDateAprobados').change(function() {
            $('#dateFilterAprobados').toggle(this.checked);
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
	});
</script>
</body>
</html>