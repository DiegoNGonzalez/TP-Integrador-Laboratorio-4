<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Home</title>
</head>
<body>
<!-- Menú de Navegación -->
<nav class="navbar">
    <div class="navbar-container">
        <div class="navbar-brand">
            <a href="DashboardCliente.jsp">Banco XYZ - UTN</a>
        </div>
        <div class="navbar-user">
            <% if (session.getAttribute("usuario") != null) { %>
                <span>Bienvenido, <%= session.getAttribute("usuario") %></span>
                <a href="Logout.jsp" class="logout-button">Cerrar Sesión</a>
            <% } else { %>
                <span>No hay usuario logueado</span>
            <% } %>
        </div>
    </div>
</nav>

<!-- Contenido del Dashboard -->
<div class="dashboard-header">
    <h2>Bienvenido, Juan Pérez</h2>
</div>

<div class="account-management-container">
    <h2 class="edit-title">Mis Cuentas</h2>
            <div>
    <table class="account-table">
        <thead>
            <tr>
                <th>Tipo de Cuenta</th>
                <th>Número de Cuenta</th>
                <th>Saldo</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Caja de ahorro</td>
                <td>123456789</td>
                <td>$15,000.00</td>
                <td><a href="DetalleCuenta.jsp?cuentaId=123456789" class="btn-edit">Ver detalle</a></td>
            </tr>
            <tr>
                <td>Cuenta corriente</td>
                <td>987654321</td>
                <td>$5,250.00</td>
                <td><a href="DetalleCuenta.jsp?cuentaId=987654321" class="btn-edit">Ver detalle</a></td>
            </tr>
                        
        </tbody>
    </table>
                        </div>
                                <div style="margin-bottom: 20px;"></div>
        <div>
                <a href="Transferencia.jsp?clienteId=11111" class="btn-aprobar">Realizar transferencia</a>  
                    </div>
    </div>
                <div class="account-management-container">           
                <h2 class="edit-title">Mis Préstamos</h2>
                <table class="account-table">
        <thead>
            <tr>
                <th>Fecha de solicitud</th>
                <th>Monto solicitado</th>
                <th>Cuotas</th>
                <th>Monto a abonar por mes</th>
                <th>Fecha de vencimiento</th>
                <th>Cuotas pendientes</th>
                <th>Estado</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>12/10/2024</td>
                <td>$500,000.00</td>
                <td>6</td>                
                <td>$100,000.00</td>
                <td>12/04/2025</td>
                <td>5</td>     
                <td>Aprobado</td>                
                <td><a href="PagoPrestamo.jsp?prestamoId=123456789" class="btn-edit">Pagar cuota</a></td>
            </tr>
            <tr>
                <td>15/11/2024</td>
                <td>$1,000,000.00</td>
                <td>12</td>                
                <td>$100,000.00</td>
                <td>15/11/2025</td>
                <td>12</td>     
                <td>Rechazado</td>
                <td><a href="PagoPrestamo.jsp?prestamoId=987654321" class="btn-edit">Pagar cuota</a></td>
            </tr>
            
        </tbody>
    </table>
                                    <div style="margin-bottom: 20px;"></div>
                <a href="SolicitudPrestamo.jsp?clienteId=11111" class="btn-aprobar">Solicitar nuevo préstamo</a>  
</div>
</body>
</html>