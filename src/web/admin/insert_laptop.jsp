<%-- 
    Document   : insert_laptop
    Created on : Dec 25, 2018, 11:10:31 AM
    Author     : dangv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Laptop</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/cssweb/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>


        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Form</h3>

                    <div class="informasi">
                        Đặng Việt Bắc
                    </div>

                    <div class="gagal">
                        Hoàng Thế Sơn
                    </div>

                    <div class="sukses">
                        Vương Minh Hiếu
                    </div>
                    <form action="/shop1/ManagerLaptopServlet" method="POST">
                        <table width="95%">
                            <tr><td width="125px"><b>LaptopID</b></td><td><input type="text" class="pendek" name="LaptopID" ></td></tr>

                            <tr><td><b>Tên Laptop</b></td><td><input type="text" class="sedang" name="Tenlap"></td></tr>
                            <tr><td width="125px"><b>Giá</b></td><td><input type="text" class="pendek" name="Gia"></td></tr>
                            <tr><td width="125px"><b>CPU</b></td><td><input type="text" class="pendek" name="CPU"></td></tr>
                            <tr><td width="125px"><b>RAM</b></td><td><input type="text" class="pendek" name="RAM"></td></tr>
                            <tr><td width="125px"><b>HDD</b></td><td><input type="text" class="pendek" name="HDD"></td></tr>
                            <tr><td width="125px"><b>ManHinh</b></td><td><input type="text" class="pendek" name="Manhinh"></td></tr>
                            <tr><td><b>VGA</b></td><td><input type="text" class="sedang" name="VGA"></td></tr>
                            <tr><td><b>Hệ điều Hành</b></td><td><input type="text" class="sedang" name="HDH"></td></tr>
                            <tr><td width="125px"><b>CPUID</b></td><td><input type="text" class="pendek" name="CPUID"></td></tr>

                            <tr><td><b>IMG</b></td><td><input type="text" class="panjang" name="IMG" placeholder="imageweb/.."></td></tr>
                            <tr><td><b>IMG2</b></td><td><input type="text" class="panjang" name="IMG2" placeholder="imageweb/.."></td></tr>
                            <tr><td><b>IMG3</b></td><td><input type="text" class="panjang" name="IMG3" placeholder="imageweb/.."></td></tr>
                            <tr><td><b>IMG4</b></td><td><input type="text" class="panjang" name="IMG4" placeholder="imageweb/.."></td></tr>

                            <tr><td><b>Mô tả 1</b></td><td><textarea name="Mota"  placeholder="ax_bx_cx"></textarea></td></tr>
                            <tr><td><b>Mô tả 2</b></td><td><textarea name="Mota2" placeholder="ax_bx_cx"></textarea></td></tr>
                            <tr><td></td><td>

                                    <input type="hidden" name="command" value="insert">
                                    <input type="submit" class="button" value="Thêm">

                                </td></tr>
                        </table>
                    </form>
                </div>
                <div class="clear"></div>


            <jsp:include page="footer.jsp"></jsp:include>

        </div>
    </body>
</html>
