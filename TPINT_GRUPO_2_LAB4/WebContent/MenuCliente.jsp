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
<!-- Bootstrap  -->
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<!--<link rel="stylesheet" type="text/css" href="css/styles.css"> -->
<link rel="stylesheet" href="//cdn.datatables.net/2.1.8/css/dataTables.dataTables.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

<title>Menu de Clientes</title>
</head>
<body class="d-flex flex-column vh-100">
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />
<div class="container-fluid flex-grow-1 d-flex flex-column justify-content-center align-items-center">
<div class="text-center mb-4">
            <h2>Gestión de Clientes</h2>
            <p class="text-secondary">Listado de clientes con accesos rápidos a acciones principales.</p>
        <hr class="border-dark my-3">
        </div>

        
<!-- Tabla de Clientes -->
<div class="table-responsive" >
    <table id="clientTable" class="table table-striped table-bordered table-sm">
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
            <td><%= cliente.getNombre() %></td>
            <td><%= cliente.getApellido() %></td>
            <td><%= cliente.getDni() %></td>
            <td><%= cliente.getCuil() %></td>
            <td><%= cliente.getSexo() %></td>
            <td><%= cliente.getNacionalidad().getNacionalidad() %></td>
            <td><%= cliente.getFechaNacimiento() %></td>
            <td><%= cliente.getDireccion() %></td>
            <td><%= cliente.getLocalidad().getLocalidad() %></td>
            <td><%= cliente.getProvincia().getProvincia() %></td>
            <td><%= cliente.getEmail() %></td>
            <td><%= cliente.getTelefono() %></td>
            <td><%= cliente.getUsuario().getNombreUsuario() %></td>
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
<div style="margin: 10px;">
<a href="CargarDesplegablesServlet?action=agregarCliente" class="btnAgregarCliente btn btn-primary">Agregar Nuevo Cliente</a>
<a href="DashboardAdmin.jsp" class="btn btn-primary">Volver</a>
</div>

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