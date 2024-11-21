<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <!--  <link rel="stylesheet" type="text/css" href="css/styles.css">-->
    <link rel="stylesheet" type="text/css" href="css/styles2.css">
    <title>Panel Administrador</title>
    <link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body class="d-flex flex-column vh-100">
<!-- Menú de Navegación -->
<jsp:include page="nav.jsp" />

<div class="container-fluid flex-grow-1 d-flex flex-column justify-content-center align-items-center">
    <!-- Header -->
    <div class="text-center mb-4">
        <h2>Accesos Directos Del Administrador</h2>
    </div>

    <!-- Cards para el Dashboard -->
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">
        <!-- Card 1: Menú de Clientes -->
        <div class="col">
            <div class="card h-100 border-primary shadow-sm dashboard-card hover-shadow" style="cursor: pointer;" onclick="window.location.href='ListarClientesServlet'">
                <div class="card-body d-flex flex-column justify-content-center align-items-center text-center">
                    <div class="mb-3 text-primary">
                        <i class="fas fa-users fa-3x"></i>
                    </div>
                    <h5 class="card-title">Menú de Clientes</h5>
                    <p class="card-text">Gestión de clientes y perfiles.</p>
                </div>
            </div>
        </div>

        <!-- Card 2: Cuentas -->
        <div class="col">
            <div class="card h-100 border-success shadow-sm dashboard-card hover-shadow" style="cursor: pointer;" onclick="window.location.href='ClienteCuentaServlet'">
                <div class="card-body d-flex flex-column justify-content-center align-items-center text-center">
                    <div class="mb-3 text-success">
                        <i class="fas fa-wallet fa-3x"></i>
                    </div>
                    <h5 class="card-title">Cuentas</h5>
                    <p class="card-text">Administración de cuentas bancarias.</p>
                </div>
            </div>
        </div>

        <!-- Card 3: Gestión de Préstamos -->
        <div class="col">
            <div class="card h-100 border-warning shadow-sm dashboard-card hover-shadow" style="cursor: pointer;" onclick="window.location.href='GestionPrestamosServlet'">
                <div class="card-body d-flex flex-column justify-content-center align-items-center text-center">
                    <div class="mb-3 text-warning">
                        <i class="fas fa-hand-holding-usd fa-3x"></i>
                    </div>
                    <h5 class="card-title">Gestión de Préstamos</h5>
                    <p class="card-text">Control y seguimiento de préstamos.</p>
                </div>
            </div>
        </div>

        <!-- Card 4: Informe Estadístico -->
        <div class="col">
            <div class="card h-100 border-danger shadow-sm dashboard-card hover-shadow" style="cursor: pointer;" onclick="window.location.href='Reporte.jsp'">
                <div class="card-body d-flex flex-column justify-content-center align-items-center text-center">
                    <div class="mb-3 text-danger">
                        <i class="fas fa-chart-bar fa-3x"></i>
                    </div>
                    <h5 class="card-title">Informe Estadístico</h5>
                    <p class="card-text">Estadísticas y reportes financieros.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="Footer.jsp" />
</body>
</html>
