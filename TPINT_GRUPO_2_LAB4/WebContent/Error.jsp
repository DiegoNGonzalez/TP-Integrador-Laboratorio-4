<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>ERROR</title>
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />
    <%
        // Obtengo el mensaje de error o excepción desde la sesión.
        String errorMsj = (String) session.getAttribute("errorMsj");
        if (errorMsj != null) {
    %>
        <div class="error-box">
            <p><%= errorMsj %></p>
        </div>
    <%
        // Elimino el mensaje de error de la sesión después de mostrarlo
        session.removeAttribute("errorMsj");
        } else {
            errorMsj = "No hay errores.";
    %>
        <div class="error-box">
            <p><%= errorMsj %></p>
        </div>
    <%
        }
    %>
</body>
<jsp:include page="Footer.jsp" />
</html>
