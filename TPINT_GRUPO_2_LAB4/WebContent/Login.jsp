<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Login</title>
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />


<div class="login-container">
    <h2 class="login-title">Iniciar Sesión</h2>
    <form action="DashboardAdmin.jsp" method="post">
        <div class="form-group">
            <label for="username" class="form-label">Usuario</label>
            <input type="text" id="username" name="username" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="password" class="form-label">Contraseña</label>
            <input type="password" id="password" name="password" class="form-control" required>
        </div>
        <input type="submit" class="btn-primary" value="Ingresar">
        <a href="RecuperarContrasenia.jsp" class="forgot-password">¿Olvidaste tu contraseña?</a>
    </form>
</div>



</body>
</html>