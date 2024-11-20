<!-- nav.jsp -->
<nav class="navbar navbar-expand-lg bg-primary text-white">
    <div class="container-fluid">
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
        <div class="ms-auto navbar-user">
            <% 
                String usuario = (String) session.getAttribute("usuario");
                if (usuario != null) { 
            %>
                <span class="me-3">Bienvenido, <%= usuario %></span>
                <!-- Redirige al servlet con la acción logout -->
                <a href="LoginServlet?action=logout" class="btn btn-sm btn-outline-light">Cerrar Sesión</a>
            <% 
                } else { 
            %>
                <span class="me-3">No hay usuario logueado</span>
            <% } %>
        </div>
    </div>
</nav>

