<%-- 
    Document   : manager_laptop
    Created on : Dec 25, 2018, 11:01:38 AM
    Author     : dangv
--%>

<%@page import="model.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Laptop"%>
<%@page import="DAO.LaptopDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Laptop</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/cssweb/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>

        <%
// có tài khoản admin ms được truy cập
            Users users = (Users) session.getAttribute("user");
            if (users == null) {
                response.sendRedirect("/shop1/admin/loginadmin.jsp");
            }

            LaptopDAO laptopDAO = new LaptopDAO();
            ArrayList<Laptop> list = laptopDAO.getAllLaptop();
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>


                <div id="rightContent">
                    <h3>LAPTOP</h3>
                    <a href="/shop1/admin/insert_laptop.jsp"><br>Thêm Laptop</a>

                    <table class="data">
                        <tr class="data">
                            <th class="data" width="30px">STT</th>
                            <th class="data">LaptopID</th>
                            <th class="data">Tên Lap</th>
                            <th class="data">CPU</th>

                            <th class="data" width="75px">Tùy Chọn</th>
                        </tr>
                    <% int i = 0;
                        for (Laptop lt : list) {
                            i++;
                    %>
                    <tr class="data">
                        <td class="data" width="30px"><%=i%> </td>
                        <td class="data"><%=lt.getLaptopID()%> </td>
                        <td class="data"><%=lt.getTenlap()%> </td>
                        <td class="data"><%=lt.getCPU()%> </td>
                        <td class="data" width="75px">

                    <center>
                        <a href="/shop1/ManagerLaptopServlet?command=update&LaptopID=<%=lt.getLaptopID() %>">Sửa</a>&nbsp;&nbsp;&nbsp;
                        <a href="/shop1/ManagerLaptopServlet?command=delete&LaptopID=<%=lt.getLaptopID() %>">Xóa</a>
                    </center>
                    </td>
                    </tr>
                    <%}%>
                </table>
            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>

        </div>


    </body>
</html>
