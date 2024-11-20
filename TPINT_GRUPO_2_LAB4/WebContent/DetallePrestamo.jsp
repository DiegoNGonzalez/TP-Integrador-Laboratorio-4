<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="entidades.Prestamo" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Detalle de Préstamo</title>
</head>
<body>
<jsp:include page="nav.jsp" />
<%
    Prestamo prestamo = (Prestamo) request.getAttribute("prestamo");
    String origen = request.getParameter("origen");
%>


<div class="loan-detail-container">
    <h2>Detalle del Préstamo</h2>
    
    <% if (prestamo != null) { %>
        <p><strong>Cliente:</strong> <%= prestamo.getCliente().getNombre() + ", " + prestamo.getCliente().getApellido() %></p>
        <p><strong>Cuotas:</strong> <%= prestamo.getCantCuotas() %></p>
        <p><strong>Cuotas Pagas:</strong> <%= request.getAttribute("cuotasPagadas") %></p>
        <p><strong>Cuotas Faltantes:</strong> <%= request.getAttribute("cuotasPendientes") %></p>
        <p><strong>Monto Solicitado:</strong> $<%= prestamo.getImporteTotal() %></p>
        <p><strong>Monto Abonado:</strong> $<%= request.getAttribute("montoAbonado") %></p>
        <p><strong>Monto Adeudado:</strong> $<%= request.getAttribute("montoAdeudado") %></p>
	<% }%>
        <div class="back-button-container">
        <% if ("Gestionprestamos".equals(origen)) { %>
            <a href="GestionPrestamosServlet" class="btn-volver">Volver a Gestión de Préstamos</a>
        <% } else { %>
            <a href="ListarPrestamosServlet" class="btn-volver">Volver a Listado de Préstamos</a>
               <% if (prestamo.getEstado().equals("Activo")) { %>
                  <a href="BuscarCuotasServlet?prestamoId=<%= prestamo.getIdPrestamo() %>&origen=MisPrestamos&action=listarPendientes" class="btn-volver">
                  Pagar cuota
                  </a>
               <% } %>
        <% } %>
		</div>
</div>




</body>
</html>