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
<!-- <link rel="stylesheet" type="text/css" href="css/styles.css"> -->
<title>Editar Cuenta</title>
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

    <!-- Contenedor Principal -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow-lg p-4">
                    <h2 class="card-title text-center mb-4">Modificar Cuenta</h2>

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
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" id="nombre" name="nombre" class="form-control" value="<%=cliente.getNombre()%>" readonly style="background-color: #e9ecef;">
                        </div>

                        <div class="mb-3">
                            <label for="apellido" class="form-label">Apellido</label>
                            <input type="text" id="apellido" name="apellido" class="form-control" value="<%=cliente.getApellido()%>" readonly style="background-color: #e9ecef;">
                        </div>

                        <div class="mb-3">
                            <label for="dni" class="form-label">DNI</label>
                            <input type="text" id="dni" name="dni" class="form-control" value="<%=cliente.getDni()%>" readonly style="background-color: #e9ecef;">
                        </div>

                        <!-- Fecha de Creación -->
                        <div class="mb-3">
                            <label for="fechaCreacion" class="form-label">Fecha de Creación</label>
                            <input type="date" id="fechaCreacion" name="fechaCreacion" class="form-control" value="<%= cuenta.getFechaCreacion() %>" readonly style="background-color: #e9ecef;">
                        </div>

                        <!-- Tipo de Cuenta -->
                        <div class="mb-3">
                            <label for="tipoCuenta" class="form-label">Tipo de Cuenta</label>
                            <select id="tipoCuenta" name="tipoCuenta" class="form-select">
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
                        <div class="mb-3">
                            <label for="numeroCuenta" class="form-label">Número de Cuenta</label>
                            <input type="text" id="numeroCuenta" name="numeroCuenta" class="form-control" value="<%= cuenta.getNumeroCuenta() %>" readonly style="background-color: #e9ecef;">
                        </div>

                        <!-- CBU -->
                        <div class="mb-3">
                            <label for="cbu" class="form-label">CBU</label>
                            <input type="text" id="cbu" name="cbu" class="form-control" value="<%= cuenta.getCbu() %>" readonly style="background-color: #e9ecef;">
                        </div>

                        <!-- Saldo -->
                        <div class="mb-3">
                            <label for="saldo" class="form-label">Saldo</label>
                            <input type="number" step="0.01" id="saldo" name="saldo" class="form-control" value="<%= cuenta.getSaldo() %>" >
                        </div>

                        <!-- Botones -->
                        <div class="col-12 d-flex justify-content-center">
                            <input type="submit" class="btn btn-success m-2" value="Guardar Cambios">
                            <input type="button" class="btn btn-secondary m-2" onclick="window.location.href='ClienteCuentaServlet'" value="Cancelar">
                        </div>

                    </form>
                </div>
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



function mostrarToast(mensaje) {
    const toastElement = document.getElementById("validationToast");
    toastElement.querySelector(".toast-body").innerHTML = mensaje;
    const toast = new bootstrap.Toast(toastElement);
    toast.show();
}
</script>
</body>
</html>