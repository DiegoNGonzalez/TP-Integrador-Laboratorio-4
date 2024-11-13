<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.Cliente" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Editar Cliente</title>
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />

<!-- Contenedor del Formulario de Editar Cliente -->
<div class="client-container">
    <h2 class="edit-title">Editar Cliente</h2>
    <form action="EditarCliente.jsp" method="post">

        <% Cliente cliente = (Cliente) request.getAttribute("cliente"); %>

<div class="form-group">
    <label for="nombre" class="form-label">Nombre</label>
    <input type="text" id="nombre" name="nombre" class="form-control" value="<%= cliente.getNombre() %>">
</div>

<div class="form-group">
    <label for="apellido" class="form-label">Apellido</label>
    <input type="text" id="apellido" name="apellido" class="form-control" value="<%= cliente.getApellido() %>">
</div>

<div class="form-group">
    <label for="dni" class="form-label">DNI</label>
    <input type="text" id="dni" name="dni" class="form-control" value="<%= cliente.getDni() %>" readonly>
</div>

<div class="form-group">
    <label for="cuil" class="form-label">CUIL</label>
    <input type="text" id="cuil" name="cuil" class="form-control" value="<%= cliente.getCuil() %>">
</div>

<div class="form-group">
    <label for="sexo" class="form-label">Sexo</label>
    <select id="sexo" name="sexo" class="form-control">
        <option value="M" <%= cliente.getSexo() == 'M' ? "selected" : "" %>>Masculino</option>
        <option value="F" <%= cliente.getSexo() == 'F' ? "selected" : "" %>>Femenino</option>
    </select>
</div>

<div class="form-group">
    <label for="nacionalidad" class="form-label">Nacionalidad</label>
    <input type="text" id="nacionalidad" name="nacionalidad" class="form-control" value="<%= cliente.getNacionalidad().getNacionalidad() %>">
</div>

<div class="form-group">
    <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label>
    <input type="date" id="fechaNacimiento" name="fechaNacimiento" class="form-control" value="<%= cliente.getFechaNacimiento() %>">
</div>

<div class="form-group">
    <label for="direccion" class="form-label">Dirección</label>
    <input type="text" id="direccion" name="direccion" class="form-control" value="<%= cliente.getDireccion() %>">
</div>

<div class="form-group">
    <label for="localidad" class="form-label">Localidad</label>
    <input type="text" id="localidad" name="localidad" class="form-control" value="<%= cliente.getLocalidad().getLocalidad() %>">
</div>

<div class="form-group">
    <label for="provincia" class="form-label">Provincia</label>
    <input type="text" id="provincia" name="provincia" class="form-control" value="<%= cliente.getProvincia().getProvincia() %>">
</div>

<div class="form-group">
    <label for="email" class="form-label">Email</label>
    <input type="email" id="email" name="email" class="form-control" value="<%= cliente.getEmail() %>">
</div>

<div class="form-group">
    <label for="telefono" class="form-label">Teléfono</label>
    <input type="tel" id="telefono" name="telefono" class="form-control" value="<%= cliente.getTelefono() %>">
</div>

<div class="form-group">
    <label for="usuario" class="form-label">Usuario</label>
    <input type="text" id="usuario" name="usuario" class="form-control" value="<%= cliente.getUsuario().getNombreUsuario() %>" readonly>
</div>


        <!-- Botón para Guardar Cambios -->
        <input type="submit" class="btn-save" value="Guardar cambios">

        <!-- Botón para Cancelar -->
        <input type="submit" class="btn-cancel" onclick="window.location.href='MenuCliente.jsp'" value="Cancelar">
    </form>
</div>
</body>
</html>
