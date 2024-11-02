<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Agregar Cliente</title>
</head>
<body>
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />

<!-- Contenedor del Formulario de Agregar Cliente -->
<div class="client-container">
    <h2 class="add-title">Agregar Nuevo Cliente</h2>
    <form action="agregarCliente.jsp" method="post">

        <!-- Nombre -->
        <div class="form-group">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Ingrese el nombre del cliente">
        </div>

        <!-- Apellido -->
        <div class="form-group">
            <label for="apellido" class="form-label">Apellido</label>
            <input type="text" id="apellido" name="apellido" class="form-control" placeholder="Ingrese el apellido del cliente">
        </div>

        <!-- DNI -->
        <div class="form-group">
            <label for="dni" class="form-label">DNI</label>
            <input type="text" id="dni" name="dni" class="form-control" placeholder="Ingrese el DNI">
        </div>

        <!-- CUIL -->
        <div class="form-group">
            <label for="cuil" class="form-label">CUIL</label>
            <input type="text" id="cuil" name="cuil" class="form-control" placeholder="Ingrese el CUIL">
        </div>

        <!-- Sexo -->
        <div class="form-group">
            <label for="sexo" class="form-label">Sexo</label>
            <select id="sexo" name="sexo" class="form-control">
                <option value="">Seleccione el sexo</option>
                <option value="M">Masculino</option>
                <option value="F">Femenino</option>
            </select>
        </div>

        <!-- Nacionalidad -->
        <div class="form-group">
            <label for="nacionalidad" class="form-label">Nacionalidad</label>
            <input type="text" id="nacionalidad" name="nacionalidad" class="form-control" placeholder="Ingrese la nacionalidad">
        </div>

        <!-- Fecha de Nacimiento -->
        <div class="form-group">
            <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label>
            <input type="date" id="fechaNacimiento" name="fechaNacimiento" class="form-control">
        </div>

        <!-- Dirección -->
        <div class="form-group">
            <label for="direccion" class="form-label">Dirección</label>
            <input type="text" id="direccion" name="direccion" class="form-control" placeholder="Ingrese la dirección">
        </div>

        <!-- Localidad -->
        <div class="form-group">
            <label for="localidad" class="form-label">Localidad</label>
            <input type="text" id="localidad" name="localidad" class="form-control" placeholder="Ingrese la localidad">
        </div>

        <!-- Provincia -->
        <div class="form-group">
            <label for="provincia" class="form-label">Provincia</label>
            <input type="text" id="provincia" name="provincia" class="form-control" placeholder="Ingrese la provincia">
        </div>

        <!-- Email -->
        <div class="form-group">
            <label for="email" class="form-label">Email</label>
            <input type="email" id="email" name="email" class="form-control" placeholder="Ingrese el email">
        </div>

        <!-- Teléfono -->
        <div class="form-group">
            <label for="telefono" class="form-label">Teléfono</label>
            <input type="tel" id="telefono" name="telefono" class="form-control" placeholder="Ingrese el teléfono">
        </div>

        <!-- Usuario -->
        <div class="form-group">
            <label for="usuario" class="form-label">Usuario</label>
            <input type="text" id="usuario" name="usuario" class="form-control" placeholder="Ingrese el nombre de usuario">
        </div>

        <!-- Contraseña -->
        <div class="form-group">
            <label for="contrasena" class="form-label">Contraseña</label>
            <input type="password" id="contrasena" name="contrasena" class="form-control" placeholder="Ingrese la contraseña">
        </div>

        <!-- Botón para Guardar el Nuevo Cliente -->
        <button type="submit" class="btn-primary">Guardar Cliente</button>

        <!-- Botón para Cancelar y Volver -->
        <button type="button" class="btn-cancel" onclick="window.location.href='MenuCliente.jsp'">Cancelar</button>
    </form>
</div>
</body>
</html>
