<%-- 
    Document   : header
    Created on : Dec 25, 2018, 9:10:55 PM
    Author     : dangv
--%>

<%@page import="model.CPU"%>
<%@page import="model.Users"%>
<%@page import="model.Users"%>
<%@page import="DAO.LaptopDAO"%>
<%@page import="DAO.CPUDAO"%>
<%@page import="model.Cart"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>header</title>
    </head>
    <body>
        <%

            CPUDAO cpuDAO = new CPUDAO();
            LaptopDAO laptopDAO = new LaptopDAO();
            Users users = null;
            if (session.getAttribute("user") != null) {
                users = (Users) session.getAttribute("user");
            }
            //Gio hang
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>

        <div class="logo">
            <div class="container-fluid"> 
                <div class="row">
                    <div class="col-lg-1 col-md-1 col-sm-2 col-xs-0 ">


                    </div>

                    <div class="col-lg-8 col-md-8 col-sm-7 col-xs-10 ">
                        <div class="logo-1">
                            <a target="_blank" href="home.jsp"> <!-- click logo reset lại trang-->
                                <img  src="imageweb/logo.jpg" alt="nhu qq" style="margin: 10px;width:100px;float: left;">   
                            </a>

                        </div>                  
                        <div class="container-1">

                            <input type="search" id="search" placeholder="Search..." />


                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-2">

                    </div>

                </div>
            </div>


            <!----phần menu---->
            <nav class="navbar navbar-inverse menu">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle " data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>                        
                        </button>

                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="home.jsp">Home</a></li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">CPU<span class="caret"></span></a>
                                <ul class="dropdown-menu">

                                    <!--loại CPU-->
                                    <% for (CPU cpu : cpuDAO.getListCPU()) {
                                    %>
                                    <li><a href="product.jsp?cpu=<%=cpu.getCPUID()%>"><%=cpu.getCPU()%></a></li>


                                    <%
                                        }
                                    %>
                                </ul>
                            </li>


                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Hãng<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Dell</a></li>
                                    <li><a href="#">Asus</a></li>
                                    <li><a href="#">Acer</a></li>
                                    <li><a href="#">Lenovo</a></li>
                                </ul>
                            </li>


                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Giá<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Dưới 10tr</a></li>
                                    <li><a href="#">10 -> 15tr</a></li>
                                    <li><a href="#">15 -> 20tr</a></li>
                                    <li><a href="#">>20tr</a></li>
                                </ul>
                            </li>

                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <!--User-->
                            <% if (users != null) {%>
                            <li style="margin: 15px 60px;"> <%=users.getUserEmail()%></li>
                            <li><a target="_blank" href="Logout" ><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>

                            <% } %>


                            <% if (users == null) {%>
                            <li><a target="_blank" href="register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                            <li><a target="_blank" href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                                <%}%>
                            <li><a target="_blank" href="bin.jsp"><span class="glyphicon glyphicon-shopping-cart"><span><%=cart.countItem()%></span> Cart</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </body>
</html>
