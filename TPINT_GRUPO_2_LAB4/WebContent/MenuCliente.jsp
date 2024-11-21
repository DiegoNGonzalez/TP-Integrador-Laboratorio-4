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

<title>Menu de Clientes</title>
</head>
<body class="d-flex flex-column vh-100">
<jsp:include page="nav.jsp" />
<div class="container my-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <a href="DashboardAdmin.jsp" class="btn btn-primary">
            Volver
        </a>
        <h2 class="mx-auto mb-0">Gestión Clientes</h2>
    </div>
    <hr class="border-dark my-3">

        
<!-- Tabla de Clientes -->
<div class="table-responsive" style="overflow-x: auto;" >
<div class="d-flex justify-content-between align-items-center mb-3">
<a href="CargarDesplegablesServlet?action=agregarCliente" class="btnAgregarCliente btn btn-primary">Agregar Nuevo Cliente</a>
</div>
    <table id="clientTable" class="table table-striped " style="width:100%">
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
            <td style="font-size: 1rem;"><%= cliente.getNombre() %></td>
            <td style="font-size: 1rem;"><%= cliente.getApellido() %></td>
            <td style="font-size: 1rem;"><%= cliente.getDni() %></td>
            <td style="font-size: 1rem;"><%= cliente.getCuil() %></td>
            <td style="font-size: 1rem;"><%= cliente.getSexo() %></td>
            <td style="font-size: 1rem;"><%= cliente.getNacionalidad().getNacionalidad() %></td>
            <td style="font-size: 1rem;"><%= cliente.getFechaNacimiento() %></td>
            <td style="font-size: 1rem;"><%= cliente.getDireccion() %></td>
            <td style="font-size: 1rem;"><%= cliente.getLocalidad().getLocalidad() %></td>
            <td style="font-size: 1rem;"><%= cliente.getProvincia().getProvincia() %></td>
            <td style="font-size: 1rem;"><%= cliente.getEmail() %></td>
            <td style="font-size: 1rem;"><%= cliente.getTelefono() %></td>
            <td style="font-size: 1rem;"><%= cliente.getUsuario().getNombreUsuario() %></td>
            <td>

				<div class="d-flex gap-1"	>
                    <a href="BuscarClienteServlet?clienteId=<%= cliente.getIdCliente() %>&action=editarCliente" class="btn btn-warning btn-sm" >Editar</a>
                    <a href="BuscarClienteServlet?clienteId=<%= cliente.getIdCliente() %>&action=agregarCuenta" class="btn btn-primary btn-sm">Agregar Cuenta</a>
                    <a href="BajaClienteServlet?clienteId=<%= cliente.getIdCliente() %>" class="btn btn-danger btn-sm">Eliminar Cliente</a>
                </div>
            </td>
        </tr>
<% 
    } 
%>
        </tbody>
    </table>
    <br>

</div>
</div>
<jsp:include page="Footer.jsp" />
<script src="//cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('#clientTable').DataTable();
    });
</script>

<script>
    $(document).ready(function() {
        // Verifica si hay un mensaje de toast
        var mensaje = "<%= request.getAttribute("toastMessage") %>";
        var tipo = "<%= request.getAttribute("toastType") %>";
        
        toastr.options.timeOut = 3000;
        toastr.options.positionClass = 'toast-top-right';
        toastr.options.preventDuplicates = true;

        if (mensaje) {
            if (tipo == "success") {
                toastr.success(mensaje);
            } else if (tipo == "error") {
                toastr.error(mensaje);
            }
        }
    });
</script>
</body>
</html>