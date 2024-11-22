<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="entidades.Prestamo" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <!--    <link rel="stylesheet" type="text/css" href="css/styles.css"> -->
<title>Detalle de Préstamo</title>
<!-- Bootstrap  -->
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>		
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body class="d-flex flex-column vh-100">
<jsp:include page="nav.jsp" />
<%
    Prestamo prestamo = (Prestamo) request.getAttribute("prestamo");
    String origen = request.getParameter("origen");
%>


<div class="container mt-5 mb-5">
	<div class="row justify-content-center">
		<div class="col-md-8 col-lg-6">
			<div class="card shadow-lg p-4">
    <h2 class="text-center mb-4">Detalle del Préstamo</h2>
    
    <% if (prestamo != null) { %>
    <ul class="list-group mb-4">
        <li class="list-group-item"><strong>Cliente:</strong> <%= prestamo.getCliente().getNombre() + " " + prestamo.getCliente().getApellido() %></li>
        <li class="list-group-item"><strong>Cuotas:</strong> <%= prestamo.getCantCuotas() %></li>
        <li class="list-group-item"><strong>Cuotas Pagas:</strong> <%= request.getAttribute("cuotasPagadas") %></li>
        <li class="list-group-item"><strong>Cuotas Faltantes:</strong> <%= request.getAttribute("cuotasPendientes") %></li>
        <li class="list-group-item"><strong>Monto Solicitado:</strong> $<%= request.getAttribute("montoSolicitado") %></li>
        <li class="list-group-item"><strong>Monto A Abonar:</strong> $<%= prestamo.getImporteTotal() %></li>
        <li class="list-group-item"><strong>Monto Abonado:</strong> $<%= request.getAttribute("montoAbonado") %></li>
        <li class="list-group-item"><strong>Monto Adeudado:</strong> $<%= request.getAttribute("montoAdeudado") %></li>
	 </ul>
	<% }%>
        <div class="d-flex justify-content-center">
        <% if ("Gestionprestamos".equals(origen)) { %>
            <a href="GestionPrestamosServlet" class="btn btn-primary m-2">Volver a Gestión de Préstamos</a>
        <% } else { %>
            <a href="ListarPrestamosServlet" class="btn btn-primary m-2">Volver a Listado de Préstamos</a>
               <% if (prestamo.getEstado().equals("Activo")) { %>
                  <a href="BuscarCuotasServlet?prestamoId=<%= prestamo.getIdPrestamo() %>&origen=MisPrestamos&action=listarPendientes" class="btn btn-success m-2">
                  Pagar cuota
                  </a>
               <% } %>
        <% } %>
		</div>
</div>
</div>
</div>
</div>
</body>
<jsp:include page="Footer.jsp" />
</html>