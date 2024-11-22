<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
		crossorigin="anonymous">
</script>

</head>
<body class="d-flex flex-column vh-100">

<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />


<div class="d-flex justify-content-center align-items-center flex-grow-1">
    <div class="card shadow-lg p-4 mt-4 mb-5" style="width: 100%; max-width: 400px;">
        <h2 class="text-center mb-4">Iniciar Sesión</h2>
        <!-- Formulario de Login -->
        <form action="LoginServlet" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Usuario</label>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <div class="d-grid">
                <input type="submit" class="btn btn-primary" value="Ingresar">
            </div>
        </form>
        <!-- Enlace para recuperar contraseña -->
        <div class="mt-3 text-center">
            <a href="RecuperarContrasenia.jsp" class="text-muted">¿Olvidaste tu contraseña?</a>
        </div>
    </div>
</div>


<jsp:include page="Footer.jsp" />
</body>
</html>