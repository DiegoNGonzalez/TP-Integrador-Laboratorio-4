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
<style>
    .dataTables_scroll thead:nth-child(1) {
        display: none;
    }
</style>
<title>Gestión de Prestamos</title>
</head>
<body class="d-flex flex-column vh-100">
<jsp:include page="nav.jsp" />
<div class="container my-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="mx-auto mb-0">Gestión de Préstamos</h2> 
    </div>
    <hr class="border-dark my-3">
    
  <div class="card shadow-lg" style="border-width: 3px; border-color: #ffc107;">
  <div class="card-header text-center">
  <h2 class="mt-2">Préstamos Pendientes</h2>
  </div>
  <div class="row align-items-center">
  <div class="col">
  	<table class="inputs">
  		<tbody>
  			<tr>
  				<td>Monto mínimo</td>
  				<td><input type="number" id="pendientesMinMonto" name="minMonto"></td>
  			</tr>
  			<tr>
  				<td>Monto máximo</td>
  				<td><input type="number" id="pendientesMaxMonto" name="maxMonto"></td>
  			</tr>
  		</tbody>
  	</table>
  </div>
  <div class="col d-flex justify-content-end">
  	<table class="inputs">
  		<tbody>
  			<tr>
  				<td>Fecha desde: </td>
  				<td><input type="date" id="pendientesMinFecha" name="minFecha"></td>
  			</tr>
  			<tr>
  				<td>Fecha hasta: </td>
  				<td><input type="date" id="pendientesMaxFecha" name="maxFecha"></td>
  			</tr>
  		</tbody>
  	</table>
  </div>
</div>
<div class="col d-flex justify-content-center">
<a href="#" id="limpiar-filtros-pendientes" data-table="prestamosPendientes" data-prefix="pendientes" class="btn btn-warning">Limpiar filtros</a>
</div>
<section class="mt-2">
            <div class="container-fluid table-responsive">
                <table id="prestamosPendientes" class="table table-striped w-100">
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
                            <td><%= prestamo.getCliente().getNombre() + " " + prestamo.getCliente().getApellido() %></td>
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
  <h2 class="mt-2">Préstamos Aprobados</h2>
  </div>
<div class="row align-items-center">
  <div class="col">
  	<table class="inputs">
  		<tbody>
  			<tr>
  				<td>Monto mínimo</td>
  				<td><input type="number" id="aprobadosMinMonto" name="minMonto"></td>
  			</tr>
  			<tr>
  				<td>Monto máximo</td>
  				<td><input type="number" id="aprobadosMaxMonto" name="maxMonto"></td>
  			</tr>
  		</tbody>
  	</table>
  </div>
  <div class="col d-flex justify-content-end">
  	<table class="inputs">
  		<tbody>
  			<tr>
  				<td>Fecha desde: </td>
  				<td><input type="date" id="aprobadosMinFecha" name="minFecha"></td>
  			</tr>
  			<tr>
  				<td>Fecha hasta: </td>
  				<td><input type="date" id="aprobadosMaxFecha" name="maxFecha"></td>
  			</tr>
  		</tbody>
  	</table>
  </div>
</div>
<div class="col d-flex justify-content-center">
<a href="#" id="limpiar-filtros-aprobados" data-table="prestamosAprobados" data-prefix="aprobados" class="btn btn-warning">Limpiar filtros</a>
</div>   
<section class="mt-2">
            <div class="container-fluid table-responsive">
                <table id="prestamosAprobados" class="table table-striped table-bordered w-100">
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
  <h2 class="mt-2">Préstamos Rechazados</h2>
  </div>
 <div class="row align-items-center">
  <div class="col">
  	<table class="inputs">
  		<tbody>
  			<tr>
  				<td>Monto mínimo</td>
  				<td><input type="number" id="rechazadosMinMonto" name="minMonto"></td>
  			</tr>
  			<tr>
  				<td>Monto máximo</td>
  				<td><input type="number" id="rechazadosMaxMonto" name="maxMonto"></td>
  			</tr>
  		</tbody>
  	</table>
  </div>
  <div class="col d-flex justify-content-end">
  	<table class="inputs">
  		<tbody>
  			<tr>
  				<td>Fecha desde: </td>
  				<td><input type="date" id="rechazadosMinFecha" name="minFecha"></td>
  			</tr>
  			<tr>
  				<td>Fecha hasta: </td>
  				<td><input type="date" id="rechazadosMaxFecha" name="maxFecha"></td>
  			</tr>
  		</tbody>
  	</table>
  </div>
</div>
<div class="col d-flex justify-content-center">
<a href="#" id="limpiar-filtros-rechazados" data-table="prestamosRechazados" data-prefix="rechazados" class="btn btn-warning">Limpiar filtros</a>
</div>
<section class="mt-2">
<div class="container-fluid table-responsive">
    <table id="prestamosRechazados" class="table table-striped w-100">
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
</section>
</div>
 
    <!-- Contenedor del Toast -->
<div aria-live="polite" aria-atomic="true" class="position-fixed top-0 end-0 p-3" style="z-index: 11">
    <div id="toastMessage" class="toast align-items-center text-bg-primary border-0" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="4000">
        <div class="d-flex">
            <div class="toast-body">
                <!-- Aquí aparecerá el mensaje -->
            </div>
            <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>

<div class="col-12 d-flex justify-content-center m-2">
        <a href="DashboardAdmin.jsp" class="btn btn-primary">
            Volver
        </a>
    </div>
</div>
<jsp:include page="Footer.jsp" />


<%
    String toastMessage = (String) request.getAttribute("toastMessage");
    String toastType = (String) request.getAttribute("toastType"); // success, error, info, warning
%>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        <% if (toastMessage != null) { %>
            const toastEl = document.getElementById('toastMessage');
            const toastBody = toastEl.querySelector('.toast-body');
            const toastInstance = new bootstrap.Toast(toastEl);

            // Asignar el mensaje y estilo
            toastBody.textContent = "<%= toastMessage %>";
            toastEl.classList.remove('text-bg-primary', 'text-bg-danger', 'text-bg-warning', 'text-bg-success');
            toastEl.classList.add('text-bg-<%= toastType %>'); // Estilo dinámico

            // Mostrar el toast
            toastInstance.show();
        <% } %>
    });
</script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    // Función para inicializar una DataTable con sus filtros
    function initializeDataTable(tableId, filterPrefix) {
        let table = new DataTable('#' + tableId, {
            language: {
                url: 'https://cdn.datatables.net/plug-ins/2.1.8/i18n/es-AR.json'
            },
            paging: true,
            searching: true,
            info: true,
            responsive: false,
            autoWidth: false,
            scrollX: false
            
        });
        
        
        // Obtener referencias a los elementos de filtro
        const minMontoInput = document.getElementById(filterPrefix + 'MinMonto');
        const maxMontoInput = document.getElementById(filterPrefix + 'MaxMonto');
        const minFechaInput = document.getElementById(filterPrefix + 'MinFecha');
        const maxFechaInput = document.getElementById(filterPrefix + 'MaxFecha');

        if (minMontoInput && maxMontoInput) {
            // Filtros por monto
            table.search.fixed('monto', function(searchStr, data, index) {
                var min = parseFloat(minMontoInput.value) || 0;
                var max = parseFloat(maxMontoInput.value) || Infinity;
                var monto = parseFloat(data[1].replace('$', '').replace(/\s/g, '')) || 0;
                
                if ((isNaN(min) && isNaN(max)) || 
                    (isNaN(min) && monto <= max) ||
                    (min <= monto && isNaN(max)) ||
                    (min <= monto && monto <= max)) {
                    return true;
                }
                return false;
            });

            // Eventos para monto
            minMontoInput.addEventListener('input', function() {
                table.draw();
            });
            maxMontoInput.addEventListener('input', function() {
                table.draw();
            });
        }

        if (minFechaInput && maxFechaInput) {
            // Filtros por fecha
            table.search.fixed('fecha', function(searchStr, data, index) {
                var min = minFechaInput.value ? new Date(minFechaInput.value) : false;
                var max = maxFechaInput.value ? new Date(maxFechaInput.value) : false;
                var fecha = new Date(data[3]);
                
                if ((min <= fecha || !min) && (max >= fecha || !max)) {
                    return true;
                }
                return false;
            });

            // Eventos para fecha
            minFechaInput.addEventListener('input', function() {
                table.draw();
            });
            maxFechaInput.addEventListener('input', function() {
                table.draw();
            });
        }

        return table;
    }

    // Inicializar las tablas
    const tablaPendientes = initializeDataTable('prestamosPendientes', 'pendientes');
    const tablaAprobados = initializeDataTable('prestamosAprobados', 'aprobados');
    const tablaRechazados = initializeDataTable('prestamosRechazados', 'rechazados');

    // Función para limpiar filtros
    async function limpiarFiltros(tableId, filterPrefix) {
        const minMontoInput = document.getElementById(filterPrefix + 'MinMonto');
        const maxMontoInput = document.getElementById(filterPrefix + 'MaxMonto');
        const minFechaInput = document.getElementById(filterPrefix + 'MinFecha');
        const maxFechaInput = document.getElementById(filterPrefix + 'MaxFecha');

        if (minMontoInput) minMontoInput.value = '';
        if (maxMontoInput) maxMontoInput.value = '';
        if (minFechaInput) minFechaInput.value = '';
        if (maxFechaInput) maxFechaInput.value = '';

        try {
            const response = await fetch('GestionPrestamosServlet', {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            if (!response.ok) {
                throw new Error('Error al recargar los datos');
            }

            window.location.reload();
            toastr.success('Filtros limpiados correctamente');

        } catch (error) {
            console.error('Error:', error);
            toastr.error('Error al recargar los datos');
        }
    }

    // Agregar eventos a los botones de limpiar
    document.querySelectorAll('[id^="limpiar-filtros-"]').forEach(button => {
        button.addEventListener('click', async function(e) {
            e.preventDefault();
            const tableId = this.dataset.table;
            const filterPrefix = this.dataset.prefix;
            await limpiarFiltros(tableId, filterPrefix);
        });
    });
});
</script>





</body>
</html>