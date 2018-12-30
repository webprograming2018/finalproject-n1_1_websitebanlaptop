<%-- 
    Document   : Login
    Created on : Dec 25, 2018, 11:07:17 AM
    Author     : dangv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    <c:set var="root" value="${pageContext.request.contextPath}"/>
    <link href="${root}/cssweb/mos-style.css" rel='stylesheet' type='text/css' />
</head>
<body>

    <div id="header">
        <div class="inHeaderLogin"></div>
    </div>

    <div id="loginForm">
        <div class="headLoginForm">
            Login Administrator
        </div>
        <div class="fieldLogin">
            <form method="POST" action="/shop1/AdminLoginServlet">
                <label>Username</label><br>
                <input type="text" name="email" class="login"><br>
                <label>Password</label><br>
                <input type="password" name="pass" class="login"><br>
                <input type="hidden" value="login" name="command">
                <input type="submit" class="button" value="Login">
            </form>
        </div>
    </div>
</body>
</html>
