<!-- nav.jsp -->
<nav class="navbar">
    <div class="navbar-container">
        <div class="navbar-brand">
        <% if (session.getAttribute("admin") != null) { %>
            <a href="DashboardAdmin.jsp">Banco XYZ - UTN</a>
        <% } else { %>
            <a href="DashboardCliente.jsp">Banco XYZ - UTN</a>
        <% } %>
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