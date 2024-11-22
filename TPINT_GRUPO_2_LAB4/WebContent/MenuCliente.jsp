<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="entidades.Cliente" %>
<%@ page import="entidades.Nacionalidad" %>
<%@ page import="entidades.Provincia" %>
<%@ page import="entidades.Localidad" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- DataTables CSS -->
<link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">


<!-- Popper.js (requerido para Bootstrap) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" 
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" 
        crossorigin="anonymous"></script>


<title>Menu de Clientes</title>
</head>
<body class="d-flex flex-column vh-100">
<jsp:include page="nav.jsp" />
<div class="container-fluid my-6">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="mx-auto mb-0">Gestión Clientes</h2>
    </div>
    <hr class="border-dark my-3">

        
<!-- Tabla de Clientes -->
<div class="table-responsive" style="overflow-x: auto;" >
<div class="d-flex justify-content-between align-items-center mb-3">

</div>
    <table id="clientTable" class="table table-striped" style="width:100%">
<thead class="table-dark">
    <tr>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>DNI</th>
        <th>CUIL</th>
        <th>Sexo</th>
        <th>Nacionalidad</th>
        <th>Fecha de Nacimiento</th>
        <th>Dirección</th>
        <th>Localidad</th>
        <th>Provincia</th>
        <th>Email</th>
        <th>Teléfono</th>
        <th>Usuario</th>
        <th>Acción</th>
    </tr>
</thead>
        <tbody style="font-size: 0.65rem;">
            <% 
    ArrayList<Cliente> listaClientes = (ArrayList<Cliente>) request.getAttribute("listaClientes"); 
    Iterator<Cliente> iteradorClientes = listaClientes.iterator();
    
    while (iteradorClientes.hasNext()) {
        Cliente cliente = iteradorClientes.next();
%>
        <tr>
            <td style="font-size: 0.75rem;"><%= cliente.getNombre() %></td>
            <td style="font-size: 0.75rem;"><%= cliente.getApellido() %></td>
            <td style="font-size: 0.75rem;"><%= cliente.getDni() %></td>
            <td style="font-size: 0.65rem;"><%= cliente.getCuil() %></td>
            <td style="font-size: 0.75rem;"><%= cliente.getSexo() %></td>
            <td style="font-size: 0.75rem;"><%= cliente.getNacionalidad().getNacionalidad() %></td>
            <td style="font-size: 0.75rem;"><%= cliente.getFechaNacimiento() %></td>
            <td style="font-size: 0.75rem;"><%= cliente.getDireccion() %></td>
            <td style="font-size: 0.75rem;"><%= cliente.getLocalidad().getLocalidad() %></td>
            <td style="font-size: 0.75rem;"><%= cliente.getProvincia().getProvincia() %></td>
            <td style="font-size: 0.75rem;"><%= cliente.getEmail() %></td>
            <td style="font-size: 0.75rem;"><%= cliente.getTelefono() %></td>
            <td style="font-size: 0.75rem;"><%= cliente.getUsuario().getNombreUsuario() %></td>
            <td>

				<div class="d-flex gap-1"	>
                    <a href="BuscarClienteServlet?clienteId=<%= cliente.getIdCliente() %>&action=editarCliente" class="btn btn-warning btn-sm" >Editar</a>
                    <a href="BuscarClienteServlet?clienteId=<%= cliente.getIdCliente() %>&action=agregarCuenta" class="btn btn-primary btn-sm">Agregar Cuenta</a>
					<a href="#" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal" data-id="<%= cliente.getIdCliente() %>">Eliminar Cliente</a>
					
                </div>
            </td>
        </tr>
<% 
    } 
%>
        </tbody>
    </table>
    <div class="d-flex justify-content-center align-items-center mb-3">
        <a href="CargarDesplegablesServlet?action=agregarCliente" class="btnAgregarCliente btn btn-success m-2">Agregar Nuevo Cliente</a>
        <a href="DashboardAdmin.jsp" class="btn btn-primary m-2">
            Volver
        </a>
    </div>
    <!-- Modal de confirmación de eliminación -->
<div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmDeleteModalLabel">¿Está seguro que desea eliminar?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>¿Está seguro que desea eliminar el cliente?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Eliminar</button>
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
    <br>

</div>
</div>
<jsp:include page="Footer.jsp" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script src="//cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('#clientTable').DataTable();
    });
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
<script>
    // Capturar el evento de clic en el botón "Eliminar Cliente"
    var deleteBtn = document.querySelectorAll('a[data-bs-toggle="modal"]');
    var confirmDeleteBtn = document.getElementById('confirmDeleteBtn');
    var modal = new bootstrap.Modal(document.getElementById('confirmDeleteModal'));
    var clientIdToDelete = null;

    deleteBtn.forEach(function(button) {
        button.addEventListener('click', function(event) {
            // Guardar el ID del cliente
            clientIdToDelete = event.target.getAttribute('data-id');
        });
    });

    // Confirmar eliminación y redirigir
    confirmDeleteBtn.addEventListener('click', function() {
        if (clientIdToDelete !== null) {
            window.location.href = "BajaClienteServlet?clienteId=" + clientIdToDelete;
        }
    });
</script>

</body>
</html>