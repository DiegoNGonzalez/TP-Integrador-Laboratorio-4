<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.Cliente" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link rel="stylesheet" type="text/css" href="css/styles.css"> -->
<title>Perfil Cliente</title>
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

<%-- Incluir el menú de navegación desde nav.jsp --%>
<jsp:include page="nav.jsp" />

<%
    Cliente cliente = (Cliente) session.getAttribute("Cliente");
    if (cliente == null) {
        // si no hay cliente en sesión va a login
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- Contenedor del Perfil del Cliente -->
<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-md-8 col-lg-6">
			<div class="card shadow-lg p-4">
    <h2 class="text-center mb-4">Mi perfil</h2>
    <form action="">

        <!-- Nombre -->
        <div class="col-md-12">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" id="nombre" name="nombre" class="form-control" value="<%= cliente.getNombre() %>" readonly style="background-color: #e9ecef;">
        </div>

        <!-- Apellido -->
        <div class="col-md-12">
            <label for="apellido" class="form-label">Apellido</label>
            <input type="text" id="apellido" name="apellido" class="form-control" value="<%= cliente.getApellido() %>" readonly style="background-color: #e9ecef;">
        </div>

        <!-- DNI -->
        <div class="col-md-12">
            <label for="dni" class="form-label">DNI</label>
            <input type="text" id="dni" name="dni" class="form-control" value="<%= cliente.getDni() %>" readonly style="background-color: #e9ecef;">
        </div>
        
        <!-- Usuario -->
        <div class="col-md-12">
            <label for="usuario" class="form-label">Usuario</label>
            <input type="text" id="usuario" name="usuario" class="form-control" value="<%= cliente.getUsuario().getNombreUsuario() %>" readonly style="background-color: #e9ecef;">
        </div>
        
        <!-- CUIL -->
        <div class="col-md-12">
            <label for="cuil" class="form-label">CUIL</label>
            <input type="text" id="cuil" name="cuil" class="form-control" value="<%= cliente.getCuil() %>" readonly style="background-color: #e9ecef;">
        </div>

        <!-- Sexo -->
        <div class="col-md-12">
            <label for="sexo" class="form-label">Sexo</label>
       		<input type="text" id="cuil" name="sexo" class="form-control" value="<%= cliente.getSexo()%>" readonly style="background-color: #e9ecef;">
        </div>

        <!-- Nacionalidad -->
        <div class="col-md-12">
            <label for="nacionalidad" class="form-label">Nacionalidad</label>
            <input type="text" id="nacionalidad" name="nacionalidad" class="form-control" value="<%= cliente.getNacionalidad().getNacionalidad() %>" readonly style="background-color: #e9ecef;">
        </div>

        <!-- Fecha de Nacimiento -->
        <div class="col-md-12">
            <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label>
            <input type="date" id="fechaNacimiento" name="fechaNacimiento" class="form-control" value="<%= cliente.getFechaNacimiento()%>" readonly style="background-color: #e9ecef;">
        </div>

        <!-- Dirección -->
        <div class="col-md-12">
            <label for="direccion" class="form-label">Dirección</label>
            <input type="text" id="direccion" name="direccion" class="form-control" value="<%= cliente.getDireccion() %>" readonly style="background-color: #e9ecef;">
        </div>

        <!-- Localidad -->
        <div class="col-md-12">
            <label for="localidad" class="form-label">Localidad</label>
            <input type="text" id="localidad" name="localidad" class="form-control" value="<%= cliente.getLocalidad().getLocalidad() %>" readonly style="background-color: #e9ecef;">
        </div>

        <!-- Provincia -->
        <div class="col-md-12">
            <label for="provincia" class="form-label">Provincia</label>
            <input type="text" id="provincia" name="provincia" class="form-control" value="<%= cliente.getProvincia().getProvincia() %>" readonly style="background-color: #e9ecef;">
        </div>

        <!-- Email -->
        <div class="col-md-12">
            <label for="email" class="form-label">Email</label>
            <input type="email" id="email" name="email" class="form-control" value="<%= cliente.getEmail() %>" readonly style="background-color: #e9ecef;">
        </div>

        <!-- Teléfono -->
        <div class="col-md-12">
            <label for="telefono" class="form-label">Teléfono</label>
            <input type="tel" id="telefono" name="telefono" class="form-control" value="<%= cliente.getTelefono() %>" readonly style="background-color: #e9ecef;">
        </div>
    </form>
        <!-- Botón para volver -->
<div class="col-12 d-flex justify-content-center">
        <form action="DashboardCliente.jsp" method="get">
            <input type="submit" class="btn btn-primary mt-2" value="Volver">
        </form>
                </div>
        </div>
        </div>
        </div>

</div>
</body>
</html>
