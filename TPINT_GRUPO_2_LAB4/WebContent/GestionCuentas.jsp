<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entidades.Cliente" %>
<%@page import="entidades.Cuenta" %>
<%@ page import="java.util.ArrayList" %>
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
<!--<link rel="stylesheet" type="text/css" href="css/styles.css">  -->
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
<body class="d-flex flex-column vh-100">
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />

<div class="container-fluid flex-grow-1 d-flex flex-column justify-content-center align-items-center">
    <h2>Gestión de Cuentas</h2>
   <div class="row"> 
    <form id="filterForm" action="FiltrosServlet" method="GET">
        <input type="hidden" name="action" value="filtrarCuentas">
        <div class="filter-container">
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
        <thead>
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
       
                    <td><%= cliente.getNombre().toString() %></td>
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
    <br/>
    <a href="DashboardAdmin.jsp" class="btn btn-primary">Volver</a>
    <div class="modal" tabindex="-1">
  		<div class="modal-dialog">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title">¿Está seguro que desea eliminar?</h5>
        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      			</div>
      			<div class="modal-body">
        			<p>¿Está seguro que desea eliminar la cuenta?</p>
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        			<button type="button" id="confirmEliminar" class="btn btn-danger">Eliminar</button>
      			</div>
    		</div>
  		</div>
	</div>
</div>

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
}
</script>
</body>
</html>