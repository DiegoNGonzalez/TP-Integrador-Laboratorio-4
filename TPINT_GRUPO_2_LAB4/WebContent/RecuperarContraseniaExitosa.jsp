
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Recuperación de Contraseña</title>
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />
    <h2>Recuperación de Contraseña Exitosa</h2>
    <p>Estimado/a <%= request.getAttribute("nombreUsuario") %>, su contraseña es: <%= request.getAttribute("contrasenia") %></p>
    <a href="Login.jsp">Login</a>
</body>
</html>
