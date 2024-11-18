<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Recuperar contraseña</title>
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />

<div class="login-container">
    <h2>Recuperar Contraseña</h2>
    <form action="RecuperarContraseniaServlet" method="post">
        <!-- DNI -->
        <div class="form-group">
            <label for="dni">DNI:</label>
            <input type="text" id="dni" name="dni" class="form-control" required>
        </div>
        
        <!-- Email -->
        <div class="form-group">
            <label for="email">Correo Electrónico:</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>
        
        <!-- Pregunta de Seguridad (Opción Múltiple) -->
        <div class="form-group">
            <label for="pregunta">Seleccione una pregunta de seguridad:</label>
            <select id="pregunta" name="pregunta" class="form-control" required>
                <option value="cbu">¿Cuál es su CBU?</option>
                <option value="numeroCuenta">¿Cuál es su número de cuenta?</option>
            </select>
        </div>
        
        <!-- Respuesta de Seguridad -->
        <div class="form-group">
            <label for="respuesta">Respuesta:</label>
            <input type="text" id="respuesta" name="respuesta" class="form-control" required>
        </div>
        
        <!-- Botón de Enviar -->
        <input type="submit" class="btn btn-primary" value="Recuperar Contraseña">
    </form>
</div>
</body>
</html>