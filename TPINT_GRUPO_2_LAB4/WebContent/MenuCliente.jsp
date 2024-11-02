<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//cdn.datatables.net/2.1.8/css/dataTables.dataTables.min.css">
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
            <tr>
                <td>Juan</td>
            	<td>Pérez</td>
            	<td>12345678</td>
            	<td>20-12345678-9</td>
            	<td>M</td>
            	<td>Argentina</td>
            	<td>1985-07-12</td>
            	<td>Calle Falsa 123</td>
            	<td>Buenos Aires</td>
            	<td>Buenos Aires</td>
            	<td>juan.perez@example.com</td>
            	<td>1234-5678</td>
            	<td>juanp</td>
                <td>
                    <a href="EditarCliente.jsp?clienteId=12345678" class="btn-edit">Editar</a>
                    <a href="AgregarCuenta.jsp" class="btn-edit">Agregar Cuenta</a>
                </td>
            </tr>
            <tr>
                <td>María</td>
            	<td>López</td>
            	<td>87654321</td>
            	<td>27-87654321-3</td>
            	<td>F</td>
            	<td>Argentina</td>
            	<td>1990-03-25</td>
            	<td>Avenida Siempre Viva 456</td>
            	<td>Rosario</td>
            	<td>Santa Fe</td>
            	<td>maria.lopez@example.com</td>
            	<td>5678-1234</td>
            	<td>marial</td>
                <td>
                    <a href="EditarCliente.jsp?clienteId=87654321" class="btn-edit">Editar</a>
                    <a href="AgregarCuenta.jsp" class="btn-edit">Agregar Cuenta</a>
                </td>
            </tr>
        </tbody>
    </table>
    <br>
    <a href="AgregarCliente.jsp" class="btnAgregarCliente btn-primary">Agregar Nuevo Cliente</a>
</div>
<script src="//cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('#clientTable').DataTable();
    });
</script>

</body>
</html>