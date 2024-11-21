<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="entidades.Cliente" %>
<%@ page import="entidades.Cuenta" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="entidades.Cliente" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles2.css">
<title>Home</title>
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
		crossorigin="anonymous">
</script>
</head>
<body class="d-flex flex-column vh-100">

<jsp:include page="nav.jsp" />
<!-- Contenido del Dashboard -->
<% 
    Cliente cliente = (Cliente) session.getAttribute("Cliente");
%>

<div class="container mt-4">
    <!-- Sección de Cuentas del Cliente -->
    <div class="row justify-content-center mb-5">
        <% 
            ArrayList<Cuenta> listaCuentas = cliente.getCuentas(); 
            Iterator<Cuenta> iteradorCuentas = listaCuentas.iterator();
            
            while (iteradorCuentas.hasNext()) {
                Cuenta cuenta = iteradorCuentas.next();
        %>
        <div class="col-12 col-md-4 mb-3">
            <div class="card shadow-lg border-0 dashboard-card h-100" style="cursor: pointer;" onclick="window.location.href='BuscarCuentaServlet?cuentaId=<%= cuenta.getIdCuenta() %>&action=detalleCuenta'">
                <div class="card-header bg-primary text-white text-center">
                    <h5 class="mb-0"><%= cuenta.getTipoCuenta().getTipo() %></h5>
                </div>
                <div class="card-body d-flex flex-column justify-content-center align-items-center">
                    <h6 class="card-subtitle mb-2 text-muted">Número de cuenta: <%= cuenta.getNumeroCuenta() %></h6>
                    <p class="card-text text-center">CBU: <%= cuenta.getCbu() %></p>
                    <p class="card-text text-center text-success fw-bold">Saldo: $<%= cuenta.getSaldo() %></p>
                    <a href="BuscarCuentaServlet?cuentaId=<%= cuenta.getIdCuenta() %>&action=detalleCuenta" class="btn btn-outline-primary w-100 mt-3">Ver detalle</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <!-- Sección de Mi Perfil, Mis Préstamos y Transferencias -->
    <div class="row justify-content-center">
        <div class="col-12 col-md-3 mb-4">
            <div class="card h-100 border-primary shadow-sm dashboard-card hover-shadow" style="cursor: pointer;" onclick="window.location.href='PerfilCliente.jsp'">
                <div class="card-body d-flex flex-column justify-content-center align-items-center text-center">
                    <div class="mb-3 text-primary">
                        <i class="fas fa-users fa-3x"></i>
                    </div>
                    <h5 class="card-title">Mi Perfil</h5>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-3 mb-4">
            <div class="card h-100 border-warning shadow-sm dashboard-card hover-shadow" style="cursor: pointer;" onclick="window.location.href='ListarPrestamosServlet'">
                <div class="card-body d-flex flex-column justify-content-center align-items-center text-center">
                    <div class="mb-3 text-warning">
                        <i class="fas fa-hand-holding-usd fa-3x"></i>
                    </div>
                    <h5 class="card-title">Mis Préstamos</h5>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-3 mb-4">
            <div class="card h-100 border-success shadow-sm dashboard-card hover-shadow" style="cursor: pointer;" onclick="window.location.href='TransferenciasServlet?idUsuario=<%= cliente.getUsuario().getId() %>&action=dashboardCliente'">
                <div class="card-body d-flex flex-column justify-content-center align-items-center text-center">
                    <div class="mb-3 text-success">
                        <i class="fas fa-wallet fa-3x"></i>
                    </div>
                    <h5 class="card-title">Transferencias</h5>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="Footer.jsp" />
</body>
</html>