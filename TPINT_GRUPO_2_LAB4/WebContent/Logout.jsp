<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sesion Finalizada</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />


<div class="logout-container">
    <h2 class="logout-message">Has cerrado sesión correctamente</h2>
    <form action="Login.jsp" method="get">
        <input type="submit" class="btn-secondary" value="Volver a Iniciar Sesión">
    </form>
</div>


</body>
</html>