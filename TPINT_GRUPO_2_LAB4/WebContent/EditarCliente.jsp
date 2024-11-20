<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.Cliente" %>
<%@ page import="entidades.Nacionalidad" %>
<%@ page import="entidades.Provincia" %>
<%@ page import="entidades.Localidad" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--  <link rel="stylesheet" type="text/css" href="css/styles.css">-->
<title>Editar Cliente</title>
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

<!-- Contenedor del Formulario de Editar Cliente -->
<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-md-8 col-lg-6">
			<div class="card shadow-lg p-4">
    			<h2 class="text-center mb-4">Editar Cliente</h2>
    <form action="EditarClienteServlet" method="post" class="row g-3">

        <% Cliente cliente = (Cliente) request.getAttribute("cliente"); %>
        
        <input id="idCliente" name="idCliente" value="<%= cliente.getIdCliente() %>" type="hidden">

<div class="col-md-6">
    <label for="nombre" class="form-label">Nombre</label>
    <input type="text" required id="nombre" name="nombre" class="form-control" value="<%= cliente.getNombre() %>">
</div>

<div class="col-md-6">
    <label for="apellido" class="form-label">Apellido</label>
    <input type="text" required id="apellido" name="apellido" class="form-control" value="<%= cliente.getApellido() %>">
</div>

<div class="col-md-6">
    <label for="dni" class="form-label">DNI</label>
    <input type="text" required id="dni" name="dni" class="form-control" value="<%= cliente.getDni() %>" readonly>
</div>

<div class="col-md-6">
    <label for="cuil" class="form-label">CUIL</label>
    <input type="text" required id="cuil" name="cuil" class="form-control" value="<%= cliente.getCuil() %>" readonly>
</div>

<div class="col-md-6">
    <label for="sexo" class="form-label">Sexo</label>
    <select id="sexo" name="sexo" class="form-control">
        <option value="M" <%= cliente.getSexo() == 'M' ? "selected" : "" %>>Masculino</option>
        <option value="F" <%= cliente.getSexo() == 'F' ? "selected" : "" %>>Femenino</option>
    </select>
</div>

<div class="col-md-6">
    <label for="nacionalidad" class="form-label">Nacionalidad</label>
    <select id="nacionalidad" name="nacionalidad" class="form-select">
        <% for (Nacionalidad nacionalidad : (List<Nacionalidad>) request.getAttribute("listaNacionalidades")) { %>
            <option value="<%= nacionalidad.getId() %>" <%= nacionalidad.getId() == cliente.getNacionalidad().getId() ? "selected" : "" %>>
                <%= nacionalidad.getNacionalidad() %>
            </option>
        <% } %>
    </select>
</div>

<div class="col-md-6">
    <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label>
    <input type="date" required id="fechaNacimiento" name="fechaNacimiento" class="form-control" value="<%= cliente.getFechaNacimiento() %>" readonly>
</div>

<div class="col-md-6">
    <label for="direccion" class="form-label">Dirección</label>
    <input type="text" required id="direccion" name="direccion" class="form-control" value="<%= cliente.getDireccion() %>">
</div>

<div class="col-md-6">
    <label for="localidad" class="form-label">Localidad</label>
    <select id="localidad" name="localidad" class="form-select">
        <% for (Localidad localidad : (List<Localidad>) request.getAttribute("listaLocalidades")) { %>
            <option value="<%= localidad.getId() %>" <%= localidad.getId() == cliente.getLocalidad().getId() ? "selected" : "" %>>
                <%= localidad.getLocalidad() %>
            </option>
        <% } %>
    </select>
</div>

<div class="col-md-6">
    <label for="provincia" class="form-label">Provincia</label>
    <select id="provincia" name="provincia" class="form-select">
        <% for (Provincia provincia : (List<Provincia>) request.getAttribute("listaProvincias")) { %>
            <option value="<%= provincia.getId() %>" <%= provincia.getId() == cliente.getProvincia().getId() ? "selected" : "" %>>
                <%= provincia.getProvincia() %>
            </option>
        <% } %>
    </select>
</div>


<div class="col-md-6">
    <label for="email" class="form-label">Email</label>
    <input type="email" required id="email" name="email" class="form-control" value="<%= cliente.getEmail() %>">
</div>

<div class="col-md-6">
    <label for="telefono" class="form-label">Teléfono</label>
    <input type="tel" required id="telefono" name="telefono" class="form-control" value="<%= cliente.getTelefono() %>">
</div>

<div class="col-12 d-flex justify-content-center">
        <!-- Botón para Guardar Cambios -->
        <input type="submit" class="btn btn-primary me-2" value="Guardar cambios">

        <!-- Botón para Cancelar -->
        <input type="button" class="btn btn-secondary" onclick="window.location.href='ListarClientesServlet'" value="Cancelar">
        </div>
    </form>
    </div>
    </div>
    </div>
</div>
</body>
</html>
