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
            <input type="text" id="nombre" name="nombre" class="form-control" required placeholder="Ingrese el nombre del cliente">
        </div>

        <!-- Apellido -->
        <div class="col-md-6">
            <label for="apellido" class="form-label">Apellido</label>
            <input type="text" id="apellido" name="apellido" class="form-control" required placeholder="Ingrese el apellido del cliente">
        </div>

        <!-- DNI -->
        <div class="col-md-6">
            <label for="dni" class="form-label">DNI</label>
            <input type="text" id="dni" name="dni" class="form-control" required placeholder="Ingrese el DNI">
        </div>

        <!-- CUIL -->
        <div class="col-md-6">
            <label for="cuil" class="form-label">CUIL</label>
            <input type="text" id="cuil" name="cuil" class="form-control" required placeholder="Formato XX-XXXXXXXX-X">
        </div>

        <!-- Sexo -->
        <div class="col-md-6">
            <label for="sexo" class="form-label">Sexo</label>
            <select id="sexo" name="sexo" class="form-select">
                <option value="">Seleccione el sexo</option>
                <option value="M">Masculino</option>
                <option value="F">Femenino</option>
            </select>
        </div>

        <div class="col-md-6">
    <label for="nacionalidad" class="form-label">Nacionalidad</label>
    <select id="nacionalidad" name="nacionalidad" class="form-select">
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
            <input type="date" id="fechaNacimiento" required name="fechaNacimiento" class="form-control" placeholder="Formato de fecha aaaa-mm-dd">
        </div>

        <!-- Dirección -->
        <div class="col-md-6">
            <label for="direccion" class="form-label">Dirección</label>
            <input type="text" id="direccion" required name="direccion" class="form-control" placeholder="Ingrese la dirección">
        </div>

        <!-- Localidad -->
        <div class="col-md-6">
            <label for="localidad" class="form-label">Localidad</label>
            <select id="localidad" name="localidad" class="form-select">
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
            <select id="provincia" name="provincia" class="form-select">
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
            <input type="email" id="email" name="email" required class="form-control" placeholder="Ingrese el email">
        </div>

        <!-- Teléfono -->
        <div class="col-md-6">
            <label for="telefono" class="form-label">Teléfono</label>
            <input type="tel" id="telefono" name="telefono" required class="form-control" placeholder="Ingrese el teléfono">
        </div>

        <!-- Usuario -->
        <div class="col-md-6">
            <label for="usuario" class="form-label">Usuario</label>
            <input type="text" id="usuario" name="usuario" required class="form-control" placeholder="Ingrese el nombre de usuario">
        </div>

        <!-- Contraseña -->
        <div class="col-md-6">
            <label for="contrasena" class="form-label">Contraseña</label>
            <input type="password" id="contrasena" required name="contrasena" class="form-control" placeholder="Ingrese la contraseña">
        </div>
		<!-- Repetir contraseña -->
        <div class="col-md-6">
            <label for="contrasenaRepetida" class="form-label">Repetir contraseña</label>
            <input type="password" id="contrasenaRepetida" required name="contrasenaRepetida" class="form-control" placeholder="Ingrese la contraseña">
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

</div>

</body>
</html>
