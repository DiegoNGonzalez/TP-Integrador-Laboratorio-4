<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Recuperar contrase�a</title>
</head>
<body>
<!-- Men� de Navegaci�n -->
<jsp:include page="nav.jsp" />

<div class="login-container">
    <h2>Recuperar Contrase�a</h2>
    <form action="RecuperarContraseniaServlet" method="post">
        <!-- DNI -->
        <div class="form-group">
            <label for="dni">DNI:</label>
            <input type="text" id="dni" name="dni" class="form-control" required>
        </div>
        
        <!-- Email -->
        <div class="form-group">
            <label for="email">Correo Electr�nico:</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>
        
        <!-- Pregunta de Seguridad (Opci�n M�ltiple) -->
        <div class="form-group">
            <label for="pregunta">Seleccione una pregunta de seguridad:</label>
            <select id="pregunta" name="pregunta" class="form-control" required>
                <option value="cbu">�Cu�l es su CBU?</option>
                <option value="numeroCuenta">�Cu�l es su n�mero de cuenta?</option>
            </select>
        </div>
        
        <!-- Respuesta de Seguridad -->
        <div class="form-group">
            <label for="respuesta">Respuesta:</label>
            <input type="text" id="respuesta" name="respuesta" class="form-control" required>
        </div>
        
        <!-- Bot�n de Enviar -->
        <input type="submit" class="btn btn-primary" value="Recuperar Contrase�a">
    </form>
</div>
</body>
</html>