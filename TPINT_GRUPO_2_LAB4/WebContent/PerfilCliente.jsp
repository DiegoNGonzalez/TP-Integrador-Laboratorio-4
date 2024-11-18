<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.Cliente" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Perfil Cliente</title>
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
<div class="client-container">
    <h2 class="edit-title">Mi perfil</h2>
    <form action="">

        <!-- Nombre -->
        <div class="form-group">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" id="nombre" name="nombre" class="form-control" value="<%= cliente.getNombre() %>" readonly>
        </div>

        <!-- Apellido -->
        <div class="form-group">
            <label for="apellido" class="form-label">Apellido</label>
            <input type="text" id="apellido" name="apellido" class="form-control" value="<%= cliente.getApellido() %>" readonly>
        </div>

        <!-- DNI -->
        <div class="form-group">
            <label for="dni" class="form-label">DNI</label>
            <input type="text" id="dni" name="dni" class="form-control" value="<%= cliente.getDni() %>" readonly>
        </div>
        
        <!-- Usuario -->
        <div class="form-group">
            <label for="usuario" class="form-label">Usuario</label>
            <input type="text" id="usuario" name="usuario" class="form-control" value="<%= cliente.getUsuario().getNombreUsuario() %>" readonly>
        </div>
        
        <!-- CUIL -->
        <div class="form-group">
            <label for="cuil" class="form-label">CUIL</label>
            <input type="text" id="cuil" name="cuil" class="form-control" value="<%= cliente.getCuil() %>" readonly>
        </div>

        <!-- Sexo -->
        <div class="form-group">
            <label for="sexo" class="form-label">Sexo</label>
       		<input type="text" id="cuil" name="sexo" class="form-control" value="<%= cliente.getSexo()%>" readonly>
        </div>

        <!-- Nacionalidad -->
        <div class="form-group">
            <label for="nacionalidad" class="form-label">Nacionalidad</label>
            <input type="text" id="nacionalidad" name="nacionalidad" class="form-control" value="<%= cliente.getNacionalidad().getNacionalidad() %>" readonly>
        </div>

        <!-- Fecha de Nacimiento -->
        <div class="form-group">
            <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label>
            <input type="date" id="fechaNacimiento" name="fechaNacimiento" class="form-control" value="<%= cliente.getFechaNacimiento()%>" readonly>
        </div>

        <!-- Dirección -->
        <div class="form-group">
            <label for="direccion" class="form-label">Dirección</label>
            <input type="text" id="direccion" name="direccion" class="form-control" value="<%= cliente.getDireccion() %>" readonly>
        </div>

        <!-- Localidad -->
        <div class="form-group">
            <label for="localidad" class="form-label">Localidad</label>
            <input type="text" id="localidad" name="localidad" class="form-control" value="<%= cliente.getLocalidad().getLocalidad() %>" readonly>
        </div>

        <!-- Provincia -->
        <div class="form-group">
            <label for="provincia" class="form-label">Provincia</label>
            <input type="text" id="provincia" name="provincia" class="form-control" value="<%= cliente.getProvincia().getProvincia() %>" readonly>
        </div>

        <!-- Email -->
        <div class="form-group">
            <label for="email" class="form-label">Email</label>
            <input type="email" id="email" name="email" class="form-control" value="<%= cliente.getEmail() %>" readonly>
        </div>

        <!-- Teléfono -->
        <div class="form-group">
            <label for="telefono" class="form-label">Teléfono</label>
            <input type="tel" id="telefono" name="telefono" class="form-control" value="<%= cliente.getTelefono() %>" readonly>
        </div>
    </form>
        <!-- Botón para volver -->
        <form action="DashboardCliente.jsp" method="get">
            <input type="submit" class="btn-volver" value="Volver">
        </form>

</div>
</body>
</html>
