<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Recuperar contrase�a</title>
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
<!-- Men� de Navegaci�n -->
<jsp:include page="nav.jsp" />

<div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow-lg p-4">
    <h2 class="card-title text-center mb-4">Recuperar Contrase�a</h2>
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
            <select id="pregunta" name="pregunta" class="form-select" required>
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
        <div class="col-12 d-flex justify-content-center">
        	<input type="submit" class="btn btn-primary m-2" value="Recuperar Contrase�a">
        </div>
    </form>
</div>
</div>
</div>
</div>

</body>
</html>