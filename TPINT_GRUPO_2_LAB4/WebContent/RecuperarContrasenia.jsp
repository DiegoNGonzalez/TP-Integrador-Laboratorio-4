<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Recuperar contraseña</title>
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
    <h2 class="card-title text-center mb-4">Recuperar Contraseña</h2>
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
        
       
        <div class="form-group">
            <label for="pregunta">Seleccione una pregunta de seguridad:</label>
            <select id="pregunta" name="pregunta" class="form-select" required>
                <option value="cbu">¿Cuál es su número de cbu?</option>
            </select>
        </div>
        
        <!-- Respuesta de Seguridad -->
        <div class="form-group">
            <label for="respuesta">Respuesta:</label>
            <input type="text" id="respuesta" name="respuesta" class="form-control" required>
        </div>
        
        <!-- Botón de Enviar -->
        <div class="col-12 d-flex justify-content-center">
        	<input type="submit" class="btn btn-primary m-2" value="Recuperar Contraseña">
        </div>
    </form>
    <!-- Contenedor del Toast -->
<div aria-live="polite" aria-atomic="true" class="position-fixed top-0 end-0 p-3" style="z-index: 11">
    <div id="toastMessage" class="toast align-items-center text-bg-primary border-0" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="3000">
        <div class="d-flex">
            <div class="toast-body">
                <!-- Aquí aparecerá el mensaje -->
            </div>
            <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
<%
    String toastMessage = (String) request.getAttribute("toastMessage");
    String toastType = (String) request.getAttribute("toastType"); // success, error, info, warning
%>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        <% if (toastMessage != null) { %>
            const toastEl = document.getElementById('toastMessage');
            const toastBody = toastEl.querySelector('.toast-body');
            const toastInstance = new bootstrap.Toast(toastEl);

            // Asignar el mensaje y estilo
            toastBody.textContent = "<%= toastMessage %>";
            toastEl.classList.remove('text-bg-primary', 'text-bg-danger', 'text-bg-warning', 'text-bg-success');
            toastEl.classList.add('text-bg-error'); // Estilo dinámico

            // Mostrar el toast
            toastInstance.show();
        <% } %>
    });
</script>
</body>
</html>