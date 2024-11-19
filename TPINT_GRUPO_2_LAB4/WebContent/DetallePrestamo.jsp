<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="entidades.Prestamo" %>
     <%@ page import="entidades.Cliente" %>
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
	Cliente cliente = (Cliente) session.getAttribute("Cliente");
    Prestamo prestamo = (Prestamo) request.getAttribute("prestamo");
    String origen = request.getParameter("origen");
%>


<div class="loan-detail-container">
    <h2>Detalle del Préstamo</h2>
    
    <% if (prestamo != null) { %>
        <p><strong>Cliente:</strong> <%= cliente.getNombre() + ", " + cliente.getApellido() %></p>
        <p><strong>Monto del Préstamo:</strong> $<%= prestamo.getImporteTotal() %></p>
        <p><strong>Cuotas Totales:</strong> <%= prestamo.getCantCuotas() %></p>
        <p><strong>Cuotas Pagadas:</strong> <%= request.getAttribute("cuotasPagadas") %></p>
        <p><strong>Cuotas Faltantes:</strong> <%= request.getAttribute("cuotasPendientes") %></p>
        <p><strong>Monto Adeudado:</strong> $<%= request.getAttribute("montoAdeudado") %></p>
        <p><strong>Monto Final:</strong> $<%= request.getAttribute("montoFinal") %></p>
	<% }%>
        <div class="back-button-container">
        <% if ("Gestionprestamos".equals(origen)) { %>
            <a href="GestionPrestamosServlet" class="btn-volver">Volver a Gestión de Préstamos</a>
        <% } else { %>
            <a href="ListarPrestamosServlet" class="btn-volver">Volver a Listado de Préstamos</a>
               <% if (prestamo.getEstado().equals("Activo")) { %>
                  <a href="PagoPrestamo.jsp?id=<%= prestamo.getIdPrestamo() %>" class="btn-volver">
                  Pagar cuota
                  </a>
               <% } %>
        <% } %>
		</div>
</div>




</body>
</html>