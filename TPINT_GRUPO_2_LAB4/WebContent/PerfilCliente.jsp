<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

<!-- Contenedor del Perfil del Cliente -->
<div class="client-container">
    <h2 class="edit-title">Mi perfil</h2>
    <form action="">

        <!-- Nombre -->
        <div class="form-group">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" id="nombre" name="nombre" class="form-control" value="Lucas" readonly>
        </div>

        <!-- Apellido -->
        <div class="form-group">
            <label for="apellido" class="form-label">Apellido</label>
            <input type="text" id="apellido" name="apellido" class="form-control" value="Saputo" readonly>
        </div>

        <!-- DNI -->
        <div class="form-group">
            <label for="dni" class="form-label">DNI</label>
            <input type="text" id="dni" name="dni" class="form-control" value="12345678" readonly>
        </div>
        
        <!-- Usuario -->
        <div class="form-group">
            <label for="usuario" class="form-label">Usuario</label>
            <input type="text" id="usuario" name="usuario" class="form-control" value="lucasUser" readonly>
        </div>
        
        <!-- CUIL -->
        <div class="form-group">
            <label for="cuil" class="form-label">CUIL</label>
            <input type="text" id="cuil" name="cuil" class="form-control" value="20-12345678-1" readonly>
        </div>

        <!-- Sexo -->
        <div class="form-group">
            <label for="sexo" class="form-label">Sexo</label>
       		<input type="text" id="cuil" name="sexo" class="form-control" value="Masculino" readonly>
        </div>

        <!-- Nacionalidad -->
        <div class="form-group">
            <label for="nacionalidad" class="form-label">Nacionalidad</label>
            <input type="text" id="nacionalidad" name="nacionalidad" class="form-control" value="Argentina" readonly>
        </div>

        <!-- Fecha de Nacimiento -->
        <div class="form-group">
            <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label>
            <input type="date" id="fechaNacimiento" name="fechaNacimiento" class="form-control" value="1996-11-05" readonly>
        </div>

        <!-- Dirección -->
        <div class="form-group">
            <label for="direccion" class="form-label">Dirección</label>
            <input type="text" id="direccion" name="direccion" class="form-control" value="Calle Real 321" readonly>
        </div>

        <!-- Localidad -->
        <div class="form-group">
            <label for="localidad" class="form-label">Localidad</label>
            <input type="text" id="localidad" name="localidad" class="form-control" value="Almagro" readonly>
        </div>

        <!-- Provincia -->
        <div class="form-group">
            <label for="provincia" class="form-label">Provincia</label>
            <input type="text" id="provincia" name="provincia" class="form-control" value="Buenos Aires" readonly>
        </div>

        <!-- Email -->
        <div class="form-group">
            <label for="email" class="form-label">Email</label>
            <input type="email" id="email" name="email" class="form-control" value="lucas.saputo@example.com" readonly>
        </div>

        <!-- Teléfono -->
        <div class="form-group">
            <label for="telefono" class="form-label">Teléfono</label>
            <input type="tel" id="telefono" name="telefono" class="form-control" value="1155448877" readonly>
        </div>
    </form>
        <!-- Botón para volver -->
        <form action="DashboardCliente.jsp" method="get">
            <button type="submit" class="btn-volver">Volver</button>
        </form>

</div>
</body>
</html>
