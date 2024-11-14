<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.Cliente"%>
<%@ page import="entidades.Cuenta"%>
<%@ page import="entidades.TipoCuenta"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Editar Cuenta</title>
</head>
<body>
	<!-- Menú de Navegación -->
	<jsp:include page="nav.jsp" />

	<div class="account-container">
		<h2 class="add-title">Modificar Cuenta</h2>
<form action="EditarCuentaServlet" method="post" onsubmit="
    if(document.getElementById('tipoCuenta').value === '') { 
        alert('Por favor, seleccione el tipo de cuenta.'); 
        return false; 
    } 
    if(document.getElementById('saldo').value === '' || parseFloat(document.getElementById('saldo').value) <= 0) { 
        alert('El saldo debe ser mayor a 0 y no puede estar vacío.'); 
        return false; 
    }
">
			<%
				Cliente cliente = (Cliente) request.getAttribute("cliente");
				Cuenta cuenta = (Cuenta) request.getAttribute("cuenta");
			%>

        <input id="idCuenta" name="idCuenta" value="<%= cuenta.getIdCuenta() %>" type="hidden">

			<!-- Cliente Asignado -->
			<div class="form-group">
				<label for="nombre" class="form-label">Nombre</label> <input
					type="text" id="nombre" name="nombre" class="form-control"
					value="<%=cliente.getNombre()%>" readonly>
			</div>

			<div class="form-group">
				<label for="apellido" class="form-label">Apellido</label> <input
					type="text" id="apellido" name="apellido" class="form-control"
					value="<%=cliente.getApellido()%>" readonly>
			</div>

			<div class="form-group">
				<label for="dni" class="form-label">DNI</label> <input type="text"
					id="dni" name="dni" class="form-control"
					value="<%=cliente.getDni()%>" readonly>
			</div>

			<!-- Fecha de Creación -->
			<div class="form-group">
				<label for="fechaCreacion" class="form-label">Fecha de
					Creación</label> <input type="date" id="fechaCreacion" name="fechaCreacion"
					class="form-control"
					value="<%= cuenta.getFechaCreacion() %>" readonly>
			</div>

			<!-- Tipo de Cuenta -->
			<div class="form-group">
				<label for="tipoCuenta" class="form-label">Tipo de Cuenta</label> <select
					id="tipoCuenta" name="tipoCuenta" class="form-control">
					<option value="">Seleccione el tipo de cuenta</option>
					<%
			          int tipoCuentaActualId = cuenta.getTipoCuenta().getId();

						ArrayList<TipoCuenta> listaTiposCuenta = (ArrayList<TipoCuenta>) request.getAttribute("listaTiposCuenta");

						for (TipoCuenta tipoCuenta : listaTiposCuenta) {
			                boolean isSelected = tipoCuenta.getId() == tipoCuentaActualId;
					%>
        <option value="<%= tipoCuenta.getId() %>" <%= isSelected ? "selected" : "" %>>
            <%= tipoCuenta.getTipo() %>
        </option>
					<%
						}
					%>
				</select>
			</div>


			<!-- Número de Cuenta -->
			<div class="form-group">
				<label for="numeroCuenta" class="form-label">Número de
					Cuenta</label> <input type="text" id="numeroCuenta" name="numeroCuenta"
					class="form-control"
					value="<%= cuenta.getNumeroCuenta() %>" readonly>
			</div>

 			<!-- CBU -->
 			<div class="form-group">
				<label for="cbu" class="form-label">CBU</label> <input type="text"
					id="cbu" name="cbu" class="form-control"
					value="<%= cuenta.getCbu() %>" readonly>
			</div>  


			<!-- Saldo -->
			<div class="form-group">
				<label for="saldo" class="form-label">Saldo</label> <input
					type="number" step="0.01" id="saldo" name="saldo"
					class="form-control" value="<%= cuenta.getSaldo() %>" >
			</div>

			<!-- Botón para Guardar los cambios -->
			<input type="submit" class="btn-save" value="Guardar Cambios">

			<!-- Botón para Cancelar y Volver -->
        <input type="button" class="btn-cancel" onclick="window.location.href='ClienteCuentaServlet'" value="Cancelar">
		</form>
	</div>
</body>
</html>