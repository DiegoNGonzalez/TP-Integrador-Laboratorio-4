<nav class="navbar navbar-expand-lg bg-primary text-white">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <!-- Marca del banco -->
        <div class="navbar-brand text-white fw-bold">
            <% 
                String userType = (String) session.getAttribute("userType");
                if ("Administrador".equals(userType)) { 
            %>
                <a href="DashboardAdmin.jsp" class="text-white text-decoration-none">Banco XYZ - UTN</a>
            <% 
                } else if ("Cliente".equals(userType)) { 
            %>
                <a href="DashboardCliente.jsp" class="text-white text-decoration-none">Banco XYZ - UTN</a>
            <% 
                } else { 
            %>
                <a href="Login.jsp" class="text-white text-decoration-none">Banco XYZ - UTN</a>
            <% } %>
        </div>

        <!-- Mensaje centrado -->
        <div class="position-absolute start-50 translate-middle-x text-center">
            <% 
                String usuario = (String) session.getAttribute("usuario");
                if (usuario != null) { 
                    if ("Administrador".equals(userType)) { 
            %>
                <span>Bienvenido</span><br>
                <span>Administrador</span>
            <% 
                    } else { 
            %>
                <span>Bienvenido</span><br>
                <span><%= usuario %></span>
            <% 
                    } 
                } else { 
            %>
                <span>No hay usuario logueado</span>
            <% } %>
        </div>

        <!-- Botón de cerrar sesión -->
        <div>
            <% if (usuario != null) { %>
                <a href="LoginServlet?action=logout" class="btn btn-sm btn-outline-light">Cerrar Sesión</a>
            <% } %>
        </div>
    </div>
</nav>
