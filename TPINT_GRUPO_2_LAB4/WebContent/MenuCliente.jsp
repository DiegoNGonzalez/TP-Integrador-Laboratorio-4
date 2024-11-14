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
<link rel="stylesheet" type="text/css" href="css/styles.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//cdn.datatables.net/2.1.8/css/dataTables.dataTables.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

<title>Menu de Clientes</title>
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />

<div class="dashboard-header">
    <h2>Gestión de clientes</h2>
    <p>Listado de clientes y accesos rápidos a las secciones principales.</p>
</div>
<!-- Tabla de Clientes -->
<div class="client-management-container">
    <h2>Clientes</h2>
    <table id="clientTable" class="client-table">
        <thead>
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
        <tbody>
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
                <div class="action-buttons">

				<div class="action-buttons">
                    <a href="BuscarClienteServlet?clienteId=<%= cliente.getIdCliente() %>&action=editarCliente" class="btn-edit" >Editar</a>
                    <a href="BuscarClienteServlet?clienteId=<%= cliente.getIdCliente() %>&action=agregarCuenta" class="btn-add-account">Agregar Cuenta</a>
                    <a href="BajaClienteServlet?clienteId=<%= cliente.getIdCliente() %>" class="btn-add-account">Eliminar Cliente</a>

                </div>
            </td>
        </tr>
<% 
    } 
%>
        </tbody>
    </table>
    <br>
<a href="CargarDesplegablesServlet?action=agregarCliente" class="btnAgregarCliente btn-primary">Agregar Nuevo Cliente</a>

</div>
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
        toastr.options.positionClass = 'toast-top-right'; /
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