<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Mis Prestamos</title>
</head>
<body>
<jsp:include page="nav.jsp" />

<div class="client-management-container">
    <h2>Listado de Préstamos</h2>
    <table class="client-table">
        <thead>
            <tr>
                <th>Cliente</th>
                <th>Monto</th>
                <th>Cuotas</th>
                <th>Fecha de solicitud</th>
                <th>Tipo de Cuenta</th>
                <th>Estado</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Juan Pérez</td>
                <td>$10,000</td>
                <td>12</td>
                <td>2024-10-10</td>
                <td>Ahorro</td>
                <td class="estado estado-pendiente">Pendiente</td>
            </tr>
            <tr>
                <td>Ana López</td>
                <td>$5,000</td>
                <td>6</td>
                <td>2024-10-12</td>
                <td>Corriente</td>
                <td class="estado estado-aprobado">Aprobado</td>
            </tr>
            <tr>
                <td>María García</td>
                <td>$8,500</td>
                <td>10</td>
                <td>2024-10-15</td>
                <td>Corriente</td>
                <td class="estado estado-rechazado">Rechazado</td>
            </tr>
        </tbody>
    </table>
</div>


</body>
</html>