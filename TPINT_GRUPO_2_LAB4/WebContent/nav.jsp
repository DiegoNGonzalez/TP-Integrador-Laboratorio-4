<!-- nav.jsp -->
<nav class="navbar">
    <div class="navbar-container">
        <div class="navbar-brand">
            <% 
                String userType = (String) session.getAttribute("userType");
                if ("Administrador".equals(userType)) { 
            %>
                <a href="DashboardAdmin.jsp">Banco XYZ - UTN</a>
            <% 
                } else if ("Cliente".equals(userType)) { 
            %>
                <a href="DashboardCliente.jsp">Banco XYZ - UTN</a>
            <% 
                } else { 
            %>
                <a href="Login.jsp">Banco XYZ - UTN</a>
            <% } %>
        </div>
        <div class="navbar-user">
            <% 
                String usuario = (String) session.getAttribute("usuario");
                if (usuario != null) { 
            %>
                <span>Bienvenido, <%= usuario %></span>
                <!-- Redirige al servlet con la acción logout -->
                <a href="LoginServlet?action=logout" class="logout-button">Cerrar Sesión</a>
            <% 
                } else { 
            %>
                <span>No hay usuario logueado</span>
            <% } %>
        </div>
    </div>
</nav>

