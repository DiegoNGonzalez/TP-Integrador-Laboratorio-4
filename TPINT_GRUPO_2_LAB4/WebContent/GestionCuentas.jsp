<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
<link rel="stylesheet" type="text/css" href="css/styles.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#gestion-cuentas').DataTable();
	});
</script>
<title>Gestión de Cuentas</title>
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />

<div class="account-management-container">
    <h2>Gestión de Cuentas</h2>
    <table class="account-table display" id="gestion-cuentas">
        <thead>
            <tr>
                <th>Cliente Asignado</th>
                <th>Fecha de Creación</th>
                <th>Tipo de Cuenta</th>
                <th>Número de Cuenta</th>
                <th>CBU</th>
                <th>Saldo</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Juan Pérez</td>
                <td>2024-01-15</td>
                <td>Ahorro</td>
                <td>123456789</td>
                <td>0123456789123456789012</td>
                <td>$15,000.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=123456789" class="btn-edit">Editar</a></td>
            </tr>
            <tr>
                <td>María Gómez</td>
                <td>2023-11-05</td>
                <td>Corriente</td>
                <td>987654321</td>
                <td>2109876543210987654321</td>
                <td>$5,250.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=987654321" class="btn-edit">Editar</a></td>
            </tr>
            <tr>
                <td>Juan Pérez</td>
                <td>2024-01-15</td>
                <td>Ahorro</td>
                <td>123456789</td>
                <td>0123456789123456789012</td>
                <td>$15,000.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=123456789" class="btn-edit">Editar</a></td>
            </tr>
            <tr>
                <td>Juan Pérez</td>
                <td>2024-01-15</td>
                <td>Ahorro</td>
                <td>123456789</td>
                <td>0123456789123456789012</td>
                <td>$15,000.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=123456789" class="btn-edit">Editar</a></td>
            </tr>
            <tr>
                <td>Juan Pérez</td>
                <td>2024-01-15</td>
                <td>Ahorro</td>
                <td>123456789</td>
                <td>0123456789123456789012</td>
                <td>$15,000.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=123456789" class="btn-edit">Editar</a></td>
            </tr>
            <tr>
                <td>Juan Pérez</td>
                <td>2024-01-15</td>
                <td>Ahorro</td>
                <td>123456789</td>
                <td>0123456789123456789012</td>
                <td>$15,000.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=123456789" class="btn-edit">Editar</a></td>
            </tr>
            <tr>
                <td>Juan Pérez</td>
                <td>2024-01-15</td>
                <td>Ahorro</td>
                <td>123456789</td>
                <td>0123456789123456789012</td>
                <td>$15,000.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=123456789" class="btn-edit">Editar</a></td>
            </tr>
            <tr>
                <td>Juan Pérez</td>
                <td>2024-01-15</td>
                <td>Ahorro</td>
                <td>123456789</td>
                <td>0123456789123456789012</td>
                <td>$15,000.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=123456789" class="btn-edit">Editar</a></td>
            </tr>
            <tr>
                <td>Juan Pérez</td>
                <td>2024-01-15</td>
                <td>Ahorro</td>
                <td>123456789</td>
                <td>0123456789123456789012</td>
                <td>$15,000.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=123456789" class="btn-edit">Editar</a></td>
            </tr>
            <tr>
                <td>Juan Pérez</td>
                <td>2024-01-15</td>
                <td>Ahorro</td>
                <td>123456789</td>
                <td>0123456789123456789012</td>
                <td>$15,000.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=123456789" class="btn-edit">Editar</a></td>
            </tr>
            <tr>
                <td>Juan Pérez</td>
                <td>2024-01-15</td>
                <td>Ahorro</td>
                <td>123456789</td>
                <td>0123456789123456789012</td>
                <td>$15,000.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=123456789" class="btn-edit">Editar</a></td>
            </tr>
            <tr>
                <td>Juan Pérez</td>
                <td>2024-01-15</td>
                <td>Ahorro</td>
                <td>123456789</td>
                <td>0123456789123456789012</td>
                <td>$15,000.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=123456789" class="btn-edit">Editar</a></td>
            </tr>
            <tr>
                <td>Juan Pérez</td>
                <td>2024-01-15</td>
                <td>Ahorro</td>
                <td>123456789</td>
                <td>0123456789123456789012</td>
                <td>$15,000.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=123456789" class="btn-edit">Editar</a></td>
            </tr>
            <tr>
                <td>Juan Pérez</td>
                <td>2024-01-15</td>
                <td>Ahorro</td>
                <td>123456789</td>
                <td>0123456789123456789012</td>
                <td>$15,000.00</td>
                <td><a href="EditarCuenta.jsp?cuentaId=123456789" class="btn-edit">Editar</a></td>
            </tr>
            
        </tbody>
    </table>
</div>
</body>
</html>