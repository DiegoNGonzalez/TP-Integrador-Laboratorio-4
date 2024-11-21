<%@page import="entidades.Nacionalidad" %>
<%@page import="entidades.Provincia" %>
<%@page import="entidades.Localidad" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link rel="stylesheet" type="text/css" href="css/styles.css">  -->
<title>Agregar Cliente</title>
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

<!-- Contenedor del Formulario de Agregar Cliente -->
<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-md-8 col-lg-6">
		<div class="card shadow-lg p-4">
    		<h2 class="text-center mb-4">Agregar Nuevo Cliente</h2>
    	<form action="AgregarClienteServlet" method="post" class="row g-3" >

        <!-- Nombre -->
        <div class="col-md-6">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" id="nombre" name="nombre" class="form-control" required placeholder="Ingrese el nombre del cliente" required>
        </div>

        <!-- Apellido -->
        <div class="col-md-6">
            <label for="apellido" class="form-label">Apellido</label>
            <input type="text" id="apellido" name="apellido" class="form-control" required placeholder="Ingrese el apellido del cliente">
        </div>

        <!-- DNI -->
        <div class="col-md-6">
            <label for="dni" class="form-label">DNI</label>
            <input type="text" id="dni" name="dni" class="form-control" required placeholder="Ingrese el DNI" required>
        </div>

        <!-- CUIL -->
        <div class="col-md-6">
            <label for="cuil" class="form-label">CUIL</label>
            <input type="text" id="cuil" name="cuil" class="form-control" required placeholder="Formato XX-XXXXXXXX-X" required>
        </div>

        <!-- Sexo -->
        <div class="col-md-6">
            <label for="sexo" class="form-label">Sexo</label>
            <select id="sexo" name="sexo" class="form-select" required>
                <option value="">Seleccione el sexo</option>
                <option value="M">Masculino</option>
                <option value="F">Femenino</option>
            </select>
        </div>

        <div class="col-md-6">
    <label for="nacionalidad" class="form-label">Nacionalidad</label>
    <select id="nacionalidad" name="nacionalidad" class="form-select" required>
        <option value="">Seleccione la nacionalidad</option>
        
        <% 
            // Obtener la lista de nacionalidades de la solicitud
            ArrayList<Nacionalidad> listaNacionalidades = (ArrayList<Nacionalidad>) request.getAttribute("listaNacionalidades");
            for (Nacionalidad nacionalidad : listaNacionalidades) {
        %>
            <option value="<%= nacionalidad.getId() %>"><%= nacionalidad.getNacionalidad() %></option>
        <% 
            }
        %>
    </select>
</div>

        <!-- Fecha de Nacimiento -->
        <div class="col-md-6">
            <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label>
            <input type="date" id="fechaNacimiento" required name="fechaNacimiento" class="form-control" placeholder="Formato de fecha aaaa-mm-dd" required>
        </div>

        <!-- Dirección -->
        <div class="col-md-6">
            <label for="direccion" class="form-label">Dirección</label>
            <input type="text" id="direccion" required name="direccion" class="form-control" placeholder="Ingrese la dirección" required>
        </div>

        <!-- Localidad -->
        <div class="col-md-6">
            <label for="localidad" class="form-label">Localidad</label>
            <select id="localidad" name="localidad" class="form-select" required>
                <option value="">Seleccione la localidad</option>
                <% 
                    ArrayList<Localidad> listaLocalidades = (ArrayList<Localidad>) request.getAttribute("listaLocalidades");
                    for (Localidad localidad : listaLocalidades) {
                %>
                    <option value="<%= localidad.getId() %>"><%= localidad.getLocalidad() %></option>
                <% 
                    }
                %>
            </select>
        </div>

        <!-- Provincia -->
        <div class="col-md-6">
            <label for="provincia" class="form-label">Provincia</label>
            <select id="provincia" name="provincia" class="form-select" required>
                <option value="">Seleccione la provincia</option>
                <% 
                    ArrayList<Provincia> listaProvincias = (ArrayList<Provincia>) request.getAttribute("listaProvincias");
                    for (Provincia provincia : listaProvincias) {
                %>
                    <option value="<%= provincia.getId() %>"><%= provincia.getProvincia() %></option>
                <% 
                    }
                %>
            </select>
        </div>


        <!-- Email -->
        <div class="col-md-6">
            <label for="email" class="form-label">Email</label>
            <input type="email" id="email" name="email" required class="form-control" placeholder="Ingrese el email" required>
        </div>

        <!-- Teléfono -->
        <div class="col-md-6">
            <label for="telefono" class="form-label">Teléfono</label>
            <input type="tel" id="telefono" name="telefono" required class="form-control" placeholder="Ingrese el teléfono" required>
        </div>

        <!-- Usuario -->
        <div class="col-md-6">
            <label for="usuario" class="form-label">Usuario</label>
            <input type="text" id="usuario" name="usuario" required class="form-control" placeholder="Ingrese el nombre de usuario" required>
        </div>

        <!-- Contraseña -->
        <div class="col-md-6">
            <label for="contrasena" class="form-label">Contraseña</label>
            <input type="password" id="contrasena" required name="contrasena" class="form-control" placeholder="Ingrese la contraseña" required minlength="5">
        </div>
		<!-- Repetir contraseña -->
        <div class="col-md-6">
            <label for="contrasenaRepetida" class="form-label">Repetir contraseña</label>
            <input type="password" id="contrasenaRepetida" required name="contrasenaRepetida" class="form-control" placeholder="Ingrese la contraseña" required minlength="5">
        </div>

<div class="col-12 d-flex justify-content-center">  
        <!-- Botón para Guardar el Nuevo Cliente -->
        <button type="submit" class="btn btn-primary m-3">Guardar Cliente</button>

        <!-- Botón para Cancelar y Volver -->
        <button type="button" class="btn btn-danger m-3" onclick="window.location.href='ListarClientesServlet'">Cancelar</button>
       </div>
    </form>
    </div>
    </div>
    </div>
    <div class="toast-container position-fixed top-50 start-50 translate-middle" style="z-index: 1055;">
    <div id="validationToast" class="toast align-items-center text-bg-danger border-0" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                <!-- Mensaje dinámico del backend -->
                <% 
                String errorMessage = (String) request.getSession().getAttribute("errorMsj");
                if (errorMessage != null) {
                    out.print(errorMessage);
                    request.getSession().setAttribute("errorMsj", null); // Limpia el mensaje
                }
                %>
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>

</div>
<script>
// Mostrar el Toast si hay un mensaje de error del backend
document.addEventListener("DOMContentLoaded", function () {
    const toastElement = document.getElementById("validationToast");
    const toastBody = toastElement.querySelector(".toast-body").textContent.trim();
    if (toastBody) {
        const toast = new bootstrap.Toast(toastElement);
        toast.show();
    }
});

// Validación del formulario
document.querySelector("form").addEventListener("submit", function (event) {
    if (!validarFormulario()) {
        event.preventDefault(); // Detiene el envío si hay errores
    }
});

function validarFormulario() {
    const contrasena = document.getElementById("contrasena").value;
    const contrasenaRepetida = document.getElementById("contrasenaRepetida").value;

    if (contrasena.length < 5) {
        mostrarToast("La contraseña debe tener al menos 5 caracteres.");
        return false;
    }

    if (contrasena !== contrasenaRepetida) {
        mostrarToast("Las contraseñas no coinciden.");
        return false;
    }

    return true; // Si todo está correcto, permite el envío
}

function mostrarToast(mensaje) {
    const toastElement = document.getElementById("validationToast");
    toastElement.querySelector(".toast-body").innerHTML = mensaje;
    const toast = new bootstrap.Toast(toastElement);
    toast.show();
}
</script>
</body>
</html>
