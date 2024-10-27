<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Insert title here</title>
</head>
<body>
<!-- Menú de Navegación -->
<nav class="navbar">
    <div class="navbar-container">
        <div class="navbar-brand">
            <a href="DashboardAdmin.jsp">Banco XYZ - UTN</a>
        </div>
        <div class="navbar-user">
            <% if (session.getAttribute("usuario") != null) { %>
                <span>Bienvenido, <%= session.getAttribute("usuario") %></span>
                <a href="Logout.jsp" class="logout-button">Cerrar Sesión</a>
            <% } else { %>
                <span>No hay usuario logueado</span>
            <% } %>
        </div>
    </div>
</nav>
</body>
</html>