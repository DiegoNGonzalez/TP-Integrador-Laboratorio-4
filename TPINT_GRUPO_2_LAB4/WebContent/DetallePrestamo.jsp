<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Detalle de Pr�stamo</title>
</head>
<body>
<jsp:include page="nav.jsp" />

<div class="loan-detail-container">
    <h2>Detalle del Pr�stamo</h2>
    
    <!-- Informaci�n del pr�stamo -->
    <p><strong>Cliente:</strong> Juan P�rez</p>
    <p><strong>Monto del Pr�stamo:</strong> $10,000</p>
    <p><strong>Cuotas Totales:</strong> 12</p>
    <p><strong>Cuotas Pagadas:</strong> 8</p>
    <p><strong>Cuotas Faltantes:</strong> 4</p>
    <p><strong>Monto Adeudado:</strong> $3,000</p>
    <p><strong>Monto Final:</strong> $10,800</p>

    <div class="back-button-container">
        <a href="MisPrestamos.jsp" class="btn-volver">Volver</a>
        <a href="PagoPrestamo.jsp" class="btn-volver">Pagar cuota</a>
    </div>
</div>


</body>
</html>