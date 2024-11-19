<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entidades.Prestamo" %>
<%@ page import="entidades.Cliente" %>
<%@ page import="entidades.Cuenta" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="//cdn.datatables.net/2.1.8/css/dataTables.dataTables.min.css">
    <title>Mis Préstamos</title>
</head>
<body>
<jsp:include page="nav.jsp" />

<% 
 	// validar que no sea null
    Cliente cliente = (Cliente) request.getAttribute("cliente");
    String mensajePrestamoPendiente = (String) request.getAttribute("mensaje");
    if (mensajePrestamoPendiente != null) { 
%>
<script>
    alert("<%= mensajePrestamoPendiente %>");
</script>
<% 
    }  
%>

<div class="client-management-container">
    <h2>Listado de Préstamos</h2>
    <div class="filter-container">
        <div class="filter-option">
            <input type="checkbox" id="filterByDate" />
            <label for="filterByDate">Filtrar por rango de fechas</label>
            <div id="dateFilter" class="filter-inputs" style="display: none;">
                <label for="startDate">Desde:</label>
                <input type="date" id="startDate" />
                <label for="endDate">Hasta:</label>
                <input type="date" id="endDate" />
            </div>
        </div>

        <div class="filter-option">
            <input type="checkbox" id="filterByAmount" />
            <label for="filterByAmount">Filtrar por rango de montos</label>
            <div id="amountFilter" class="filter-inputs" style="display: none;">
                <label for="minAmount">Mínimo:</label>
                <input type="number" id="minAmount" placeholder="$0" />
                <label for="maxAmount">Máximo:</label>
                <input type="number" id="maxAmount" placeholder="$1,000,000" />
            </div>
        </div>
        
        <button id="applyFilters" class="btn-apply">Aplicar Filtros</button>
    </div>
    
    <table id="misPrestamos" class="client-table">
        <thead>
            <tr>
                <th>Fecha de solicitud</th>
                <th>Monto solicitado</th>
                <th>Monto a abonar</th>
                <th>Cuotas</th>
                <th>Estado</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
    	<% 
	    	//volver a hacer leyenda sino tiene prestamos. ver como.
	        ArrayList<Cuenta> cuentas = cliente.getCuentas(); 
	        for (int i = 0; i < cuentas.size(); i++) { 
	            Cuenta cuenta = cuentas.get(i);
	            ArrayList<Prestamo> prestamos = cuenta.getPrestamos();
	    		for(int j = 0; j < prestamos.size(); j++){
	    			Prestamo prestamo = prestamos.get(j);
           %>    
    		<tr>
	                <td>
	                 <% 
	                    if (prestamo.getFechaAltaPrestamo() != null) {
	                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	                        String fechaFormateada = sdf.format(prestamo.getFechaAltaPrestamo());
	                        out.print(fechaFormateada); // Mostrar fecha formateada
	                    } else {
	                        out.print("No disponible"); // Mostrar si la fecha es null
	                    }
	                 %>
	                </td>
	                <td>$<%= prestamo.getImporteTotal() %></td>
	                <td>$<%= prestamo.getImporteTotal() %></td>
	                <td><%= prestamo.getCantCuotas() %></td>
					<td class="estado 
				    <%= prestamo.getEstado().equals("Activo") ? "estado-aprobado" : 
				        prestamo.getEstado().equals("Pendiente") ? "estado-pendiente" : "estado-rechazado" %>">
				    <%= 
				        prestamo.getEstado().equals("Activo") ? "Aprobado" : 
				        prestamo.getEstado().equals("Pendiente") ? "Pendiente" : "Rechazado" 
				    %>
					</td>
	               <td><a href="BuscarPrestamoServlet?prestamoId=<%= prestamo.getIdPrestamo() %>&origen=MisPrestamos" class="btn-detalle">Detalle</a></td>
	                                <td>
	                    <% if (prestamo.getEstado().equals("Activo")) { %>
	                        <a href="BuscarCuotasServlet?prestamoId=<%= prestamo.getIdPrestamo() %>&origen=MisPrestamos&action=listarPendientes" class="btn-pagar">
	    					Pagar cuota
							</a>
	                    <% } %>
	                </td>
            </tr>
        <% } 
        } %>
</tbody>

    </table>
  
    <div class="solicitar-prestamo-container">
        <a href="CargarDesplegablesServlet?action=cargarCuentasCliente&idCliente=<%= cliente.getIdCliente() %>" class="btn-solicitar">Solicitar Préstamo</a>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#misPrestamos').DataTable();

        // Mostrar u ocultar filtros
        $('#filterByDate').change(function() {
            $('#dateFilter').toggle(this.checked);
        });

        $('#filterByAmount').change(function() {
            $('#amountFilter').toggle(this.checked);
        });

        // Lógica de aplicar filtros (solo front-end, sin interacción con backend)
        $('#applyFilters').click(function() {
            alert('Filtros aplicados. Esto es solo el front-end.');
        });
    });
</script>

</body>
</html>
