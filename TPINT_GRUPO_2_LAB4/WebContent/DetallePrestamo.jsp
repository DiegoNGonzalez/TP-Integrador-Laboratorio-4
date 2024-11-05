<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Detalle de Préstamo</title>
</head>
<body>
<jsp:include page="nav.jsp" />

<div class="loan-detail-container">
    <h2>Detalle del Préstamo</h2>
    
    <!-- Información del préstamo -->
    <p><strong>Cliente:</strong> Juan Pérez</p>
    <p><strong>Monto del Préstamo:</strong> $10,000</p>
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