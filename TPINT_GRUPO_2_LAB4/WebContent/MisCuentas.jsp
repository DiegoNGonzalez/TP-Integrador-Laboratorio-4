<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//cdn.datatables.net/2.1.8/css/dataTables.dataTables.min.css">
<title>Mis Cuentas</title>
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />

<div class="dashboard-header">
    <h2>Gestión de Cuentas</h2>
    <p>Listado de cuentas corrientes del cliente.</p>
</div>

<!-- Tabla de Cuentas -->
<div class="account-management-container">
    <h2>Mis Cuentas Corrientes</h2>
    <table id="accountTable" class="account-table">
        <thead>
            <tr>
                <th>Cliente</th>
                <th>Fecha de Creación</th>
                <th>Tipo de Cuenta</th>
                <th>Número de Cuenta</th>
                <th>CBU</th>
                <th>Saldo</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Juan Pérez</td>
                <td>2023-06-15</td>
                <td>Caja de Ahorro</td>
                <td>123456789</td>
                <td>1234567890123456789012</td>
                <td>$10,000</td>
            </tr>
            <tr>
                <td>María López</td>
                <td>2022-11-20</td>
                <td>Cuenta Corriente</td>
                <td>987654321</td>
                <td>2109876543210987654321</td>
                <td>$10,000</td>
            </tr>
        </tbody>
    </table>
    <br>
</div>

<script src="//cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('#accountTable').DataTable();
    });
</script>

</body>
</html>
