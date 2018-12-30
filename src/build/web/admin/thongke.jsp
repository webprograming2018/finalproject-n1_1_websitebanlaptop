<%-- 
    Document   : insert_laptop
    Created on : Dec 25, 2018, 11:10:31 AM
    Author     : dangv
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống Kê</title>
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
        %>

        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Thống Kê  </h3>
                    <form action="/shop1/ThongKeServlet" method="POST">
                        <table width="95%">

                            <tr><td><b>Nhập Ngày Bắt Đầu</b></td><td><input type="text" class="sedang" name="daystart" placeholder="yyyy-dd-mm"></td></tr>
                            <tr><td><b>Nhập Ngày Kết Thúc</b></td><td><input type="text" class="sedang" name="dayend" placeholder="yyyy-dd-mm"></td></tr>

                            <tr><td></td><td>
                                    <input type="hidden" name="command" value="thongke">
                                    <input type="submit" class="button" value="Thống Kê">

                                </td></tr>
                        </table>
                    </form>
                </div>
                <div class="clear"></div>


            <jsp:include page="footer.jsp"></jsp:include>

        </div>
    </body>
</html>
