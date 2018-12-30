<%-- 
    Document   : index
    Created on : Dec 25, 2018, 10:14:18 AM
    Author     : dangv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/cssweb/mos-style.css" rel='stylesheet' type='text/css' />
        <title>Quản trị</title>
    </head>

    <body>

        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">

                    <div class="informasi">
                        Đặng Việt Bắc
                    </div>

                    <div class="gagal">
                        Hoàng Thế Sơn
                    </div>

                    <div class="sukses">
                        Vương Minh Hiếu
                    </div>
                <%--<jsp:include page="content.jsp"></jsp:include>--%>

            </div>
                <jsp:include page="footer.jsp"></jsp:include>

            </div>
    </body>
</html>
