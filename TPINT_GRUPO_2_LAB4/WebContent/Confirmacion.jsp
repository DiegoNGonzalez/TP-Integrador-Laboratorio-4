<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>CONFIRMACION</title>
</head>
<body>
<%-- Incluir el menú de navegación desde nav.jsp --%>
<jsp:include page="nav.jsp" />
    <%
        // Obtengo el mensaje de confirmacion desde la sesión.
        String ConfMsj = (String) session.getAttribute("ConfMsj");
        if (ConfMsj != null) {
    %>
        <div class="error-box">
            <p><%= ConfMsj %></p>
        </div>
    <%
        session.removeAttribute("ConfMsj");
        } else {
        	ConfMsj = "Nada que confirmar.";
        }
    %>
    	<div class="error-box">
            <p><%= ConfMsj %></p>
        </div>
</body>
</html>