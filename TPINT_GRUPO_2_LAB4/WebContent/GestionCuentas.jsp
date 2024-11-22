<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entidades.Cliente" %>
<%@page import="entidades.Cuenta" %>
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
		$('#gestion-cuentas').DataTable();
	});
	$('#filterByAmount').change(function() {
        $('#amountFilter').toggle(this.checked);
    });
</script>
<title>Gestión de Cuentas</title>

</head>
<body class="d-flex flex-column vh-100">

<jsp:include page="nav.jsp" />

<div class="container my-4">
	<div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="mx-auto mb-0">Gestión de Cuentas</h2>
	</div>
    <hr class="border-dark my-3">
   <div class="row"> 
    <form id="filterForm" action="FiltrosServlet" method="GET">
        <input type="hidden" name="action" value="filtrarCuentas">
        <div class="filter-container d-flex align-items-center gap-3">
            <div class="filter-option">
                <input type="checkbox" id="filterByDateCuentas" name="filterByDate" />
                <label for="filterByDate">Filtrar por rango de fechas</label>
                <div id="dateFilterPendientes" class="filter-inputs" style="display: none;">
                    <label for="startDate">Desde:</label>
                    <input type="date" id="startDate" name="startDate" />
                    <label for="endDate">Hasta:</label>
                    <input type="date" id="endDate" name="endDate" />
                </div>
            </div>
            <div class="filter-option">
                <input type="checkbox" id="filterByAmount" name="filterByAmount" />
                <label for="filterByAmount">Filtrar por rango de Saldo</label>
                <div id="amountFilter" class="filter-inputs" style="display: none;">
                    <label for="minAmount">Mínimo:</label>
                    <input type="number" id="minAmount" name="minAmount" placeholder="$0" />
                    <label for="maxAmount">Máximo:</label>
                    <input type="number" id="maxAmount" name="maxAmount" placeholder="$1,000,000" />
                </div>
            </div>
            <button type="submit" id="applyFilters" class="btn btn-primary">Aplicar Filtros</button>
            <button type="button" id="clearFilters" class="btn btn-secondary">Limpiar Filtros</button>
        </div>
    </form>
       </div>
    <table class="table table-striped" id="gestion-cuentas">
        <thead class="table-dark">
        <tr>
            <th>Cliente</th>
            <th>Fecha de Creación de la Cuenta</th>
            <th>Tipo de Cuenta</th>
            <th>Número de Cuenta</th>
            <th>CBU</th>
            <th>Saldo</th>
            <th>Eliminar</th>
            <th>Editar</th>
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
                
                <tr id="fila-<%= cuenta.getIdCuenta() %>">
       
                    <td><%= cliente.getNombre().toString() + " " + cliente.getApellido().toString() %></td>
                    <td><%= cuenta.getFechaCreacion().toString() %></td>
                    <td><%= cuenta.getTipoCuenta().getTipo() %></td>
                    <td><%= cuenta.getNumeroCuenta() %></td>
                    <td><%= cuenta.getCbu() %></td>
                    <td><%= cuenta.getSaldo() %></td>
                    <td>
        				<a href="#" onclick="eliminarCuenta(<%= cuenta.getIdCuenta() %>); return false;" class="btn btn-danger">Eliminar</a>
    				</td>
                    <td><a href="BuscarCuentaServlet?cuentaId=<%= cuenta.getIdCuenta() %>&clienteId=<%= cliente.getIdCliente() %>&action=editarCuenta" class="btn btn-warning">Editar</a></td>
               </tr>
        <% 
                } 
            } 
        %>
    </tbody>
    </table>
        <div class="col-12 d-flex justify-content-center">
       		<a href="DashboardAdmin.jsp" class="btn btn-primary">Volver</a>
    	</div>
    <div class="modal" tabindex="-1">
  		<div class="modal-dialog">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title">¿Está seguro que desea eliminar la cuenta?</h5>
        			<button type="button" id="close" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      			</div>
      			<div class="modal-body">
        			<p>¿Está seguro que desea eliminar la cuenta?</p>
      			</div>
      			<div class="modal-footer">
        			<button type="button" id="cancelaEliminar" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        			<button type="button" id="confirmEliminar" class="btn btn-danger">Eliminar</button>
      			</div>
    		</div>
  		</div>
	</div>
</div>
   <!-- Contenedor del Toast -->
<div aria-live="polite" aria-atomic="true" class="position-fixed top-0 end-0 p-3" style="z-index: 11">
    <div id="toastMessage" class="toast align-items-center text-bg-primary border-0" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="3000">
        <div class="d-flex">
            <div class="toast-body">
                <!-- Aquí aparecerá el mensaje -->
            </div>
            <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>
<jsp:include page="Footer.jsp" />
<script src="//cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#prestamosRechazados').DataTable();
		 // Mostrar u ocultar filtros
        $('#filterByDateCuentas').change(function() {
            $('#dateFilterPendientes').toggle(this.checked);
        });

        $('#filterByAmount').change(function() {
            $('#amountFilter').toggle(this.checked);
        });
	});
</script>
<script>
$(document).ready(function() {
    $('#clearFilters').click(function() {
        // Redirige al servlet para cargar la lista original
        window.location.href = 'ClienteCuentaServlet?action=listarCuentas';
    });
});
</script>
<script>

function eliminarCuenta(cuentaId) {
    // Mostrar el modal
    var modal = new bootstrap.Modal(document.querySelector('.modal'));
    modal.show();
    
    // Al hacer clic en el botón "Eliminar" dentro del modal
    document.getElementById('confirmEliminar').onclick = function() {
        fetch('EliminarCuentaServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'cuentaId=' + cuentaId
        })
        .then(response => response.text())
        .then(result => {
            if (result === 'success') {
                //alert("Cuenta eliminada exitosamente.");
                // Ocultar la fila de la tabla
                document.getElementById("fila-" + cuentaId).style.display = "none";
            } else {
                alert("Error al eliminar la cuenta.");
            }
        })
        .catch(error => {
            alert("Ocurrió un error: " + error);
        });

        // Cerrar el modal después de la confirmación
        modal.hide();
    };
    
    document.getElementById('cancelaEliminar').onclick = function() {
    	 modal.hide();	
    }
    
    document.getElementById('close').onclick = function() {
   	 modal.hide();	
   }
}
</script>
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
</body>
</html>