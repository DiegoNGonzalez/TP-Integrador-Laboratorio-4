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
<body class="d-flex flex-column vh-100 overflow-hidden">

<jsp:include page="nav.jsp" />
<!-- Contenido del Dashboard -->
<% 
    Cliente cliente = (Cliente) session.getAttribute("Cliente");
    if (cliente != null) {
        String nombreCliente = cliente.getNombre(); // ObtÃ©n el nombre del cliente
%>
<div class="container-fluid flex-grow-1 d-flex flex-column justify-content-center align-items-center overflow-hidden">
    <div class="text-center mb-4">
        <h2>Bienvenido, <%= nombreCliente %></h2>
    </div>
</div>
<% } %>

<!-- Sección de Cuentas del Cliente -->
<div class="row mt-4">
<% 
    ArrayList<Cuenta> listaCuentas = cliente.getCuentas(); 
    Iterator<Cuenta> iteradorCuentas = listaCuentas.iterator();
    
    while (iteradorCuentas.hasNext()) {
        Cuenta cuenta = iteradorCuentas.next();
%>
    <!-- Card para cada cuenta -->
    <div class="col-12 col-md-4 mb-4">
        <div class="card shadow dashboard-card h-100" style="cursor: pointer;" onclick="window.location.href='BuscarCuentaServlet?cuentaId=<%= cuenta.getIdCuenta() %>&action=detalleCuenta'">
            <div class="card-body d-flex flex-column justify-content-center align-items-center">
                <h5 class="card-title text-center"><%= cuenta.getTipoCuenta().getTipo() %> - $<%= cuenta.getSaldo() %>.-</h5>
                <h6 class="card-subtitle mb-2 text-muted">Número de cuenta: <%= cuenta.getNumeroCuenta() %></h6>
                <p class="card-text text-center">CBU: <%= cuenta.getCbu() %></p>
                <a href="BuscarCuentaServlet?cuentaId=<%= cuenta.getIdCuenta() %>&action=detalleCuenta" 
                   class="btn btn-primary w-100">Ver detalle</a>
            </div>
        </div>
    </div>
<% 
    } 
%>
</div>

<div class="dashboard-content mt-5">
    <div class="row">
        <!-- Card 1: Mis Préstamos -->
        <div class="col-12 col-md-4 mb-4">
            <div class="card shadow dashboard-card h-100" style="cursor: pointer;" onclick="window.location.href='ListarPrestamosServlet'">
                <div class="card-body d-flex flex-column justify-content-center align-items-center">
                    <h5 class="card-title text-center">Mis préstamos</h5>
                    <p class="card-text text-center">Gestiona tus préstamos</p>
                </div>
            </div>
        </div>
        
        <!-- Card 2: Mi Perfil -->
        <div class="col-12 col-md-4 mb-4">
            <div class="card shadow dashboard-card h-100" style="cursor: pointer;" onclick="window.location.href='PerfilCliente.jsp'">
                <div class="card-body d-flex flex-column justify-content-center align-items-center">
                    <h5 class="card-title text-center">Mi perfil</h5>
                    <p class="card-text text-center">Ver mis datos personales</p>
                </div>
            </div>
        </div>
        
        <!-- Card 3: Transferencias -->
        <div class="col-12 col-md-4 mb-4">
            <div class="card shadow dashboard-card h-100" style="cursor: pointer;" 
                 onclick="window.location.href='TransferenciasServlet?idUsuario=<%= cliente.getUsuario().getId() %>&action=dashboardCliente'">
                <div class="card-body d-flex flex-column justify-content-center align-items-center">
                    <h5 class="card-title text-center">Transferencias</h5>
                    <p class="card-text text-center">Realizar nueva transferencia</p>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="Footer.jsp" />
</body>
</html>