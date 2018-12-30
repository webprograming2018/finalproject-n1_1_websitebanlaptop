<%-- 
    Document   : login
    Created on : Dec 5, 2018, 8:59:40 AM
    Author     : dangv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="cssweb/login.css" />
    </head>
    <body>
        <div id="header">

            <a target="_blank" href="home.jsp"> <!-- click logo reset lại trang-->
                <img  src="imageweb/logo.jpg" alt="nhu qq" style="margin: 30px 50px 0px 100px;" width=100px;>   
            </a>

        </div>

        <div class="form">
            <form action="UsersServlet" method="POST">

                <div class="Login">LOGIN </div>

                <div class="UserName">
                    UserName<br>
                    <input id="user" type="text" name="email" placeholder ="Enter UserName">

                </div>

                <div class="PassWord">
                    PassWord<br>
                    <input id="pass" type="password" name="pass" placeholder="Enter PassWord">


                </div>
                Remember Me<input type="checkbox" name="rememberMe" value="Y">
                <div class="Dangnhap">
                    <input type="hidden" value="login" name="command">
                    <input id="dangnhap" type="submit" value="Đăng Nhập">

                </div>

                <div class="Dangki">
                    <a target="_parent" href="register.jsp"> Đăng Kí </a>
                </div>
            </form>
        </div>
    </body>
</html>
