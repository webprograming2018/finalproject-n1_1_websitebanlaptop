<%-- 
    Document   : header
    Created on : Dec 25, 2018, 10:14:41 AM
    Author     : dangv
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
    </head>
    <body>
        <%
            Users users = null;
            if (session.getAttribute("user") != null) {
                users = (Users) session.getAttribute("user");
            }
        %>
        <div id="header">
            <div class="inHeader">
                <div class="mosAdmin">
                    <% if (users == null) { %>
                    Hallo, Administrator<br>
                    <a href="/shop1/admin/loginadmin.jsp">Login</a>
                    <% } %>

                    <% if (users != null) {%>
                    Hallo,<%=users.getUserEmail()%>
                    <%}%>
                </div>
                <div class="clear"></div>
            </div>
        </div>

    </body>
</html>
