<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//cdn.datatables.net/2.1.8/css/dataTables.dataTables.min.css">
<title>Gestión de Prestamos</title>
</head>
<body>

<%-- Incluir el menú de navegación desde nav.jsp --%>
<jsp:include page="nav.jsp" />
<div class="management-container">
    <h2>Prestamos Pendientes</h2>
    <table id="prestamos" class="account-table">
        <thead>
            <tr>
                <th>Cliente</th>
                <th>Monto</th>
                <th>Cuotas</th>
                <th>Fecha de solicitud</th>
                <th>Tipo de Cuenta</th> 
                <th>Aprobar</th>
                <th>Rechazar</th>               
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Carlos Gonzalez</td>
                <td>$ 1.000.000,02.-</td>
                <td>6</td>
                <td>2024-10-30</td>
                <td>Corriente</td>
                <td><a href="AprobarPrestamo.jsp?prestamoId=123456789" class="btn-aprobar">Aprobar</a></td>
                <td><a href="RechazarPrestamo.jsp?prestamoId=123456789" class="btn-rechazar">Rechazar</a></td>
            </tr>
            <tr>
                <td>Carla Rodriguez</td>
                <td>$ 890.000,00.-</td>
                <td>24</td>
                <td>2024-10-22</td>
                <td>Corriente</td>
                <td><a href="AprobarPrestamo.jsp?prestamoId=123456789" class="btn-aprobar">Aprobar</a></td>
                <td><a href="RechazarPrestamo.jsp?prestamoId=123456789" class="btn-rechazar">Rechazar</a></td>
            </tr>
            
        </tbody>
    </table>
</div>
</body>
<script src="//cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('#prestamos').DataTable();
    });
</script>
</html>