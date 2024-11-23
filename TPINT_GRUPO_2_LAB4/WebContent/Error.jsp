<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>ERROR</title>
<!-- Bootstrap  -->
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow-lg p-4">
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
    </div>
    </div>
    </div>
    </div>
</body>
<jsp:include page="Footer.jsp" />
</html>
