<%-- 
    Document   : insert_laptop
    Created on : Dec 25, 2018, 11:10:31 AM
    Author     : dangv
--%>

<%@page import="model.Laptop"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Laptop</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/cssweb/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <%
            Laptop lt = null;
            if (session.getAttribute("laptop") != null) {
                lt = (Laptop) session.getAttribute("laptop");
            }
        %>

        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>UPDATE LAPTOP</h3>

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
                            <tr><td width="125px"><b>LaptopID</b></td><td><input type="text" class="pendek" name="LaptopID" value="<%=lt.getLaptopID()%>" ></td></tr>

                        <tr><td><b>Tên Laptop</b></td><td><input type="text" class="sedang" name="Tenlap" value="<%=lt.getTenlap()%>"></td></tr>
                        <tr><td width="125px"><b>Giá</b></td><td><input type="text" class="pendek" name="Gia" value="<%=lt.getGia()%>"></td></tr>
                        <tr><td width="125px"><b>CPU</b></td><td><input type="text" class="pendek" name="CPU" value="<%=lt.getCPU()%>"></td></tr>
                        <tr><td width="125px"><b>RAM</b></td><td><input type="text" class="pendek" name="RAM" value="<%=lt.getRAM()%>"></td></tr>
                        <tr><td width="125px"><b>HDD</b></td><td><input type="text" class="pendek" name="HDD" value="<%=lt.getHDD()%>"></td></tr>
                        <tr><td width="125px"><b>ManHinh</b></td><td><input type="text" class="pendek" name="Manhinh" value="<%=lt.getManhinh()%>"></td></tr>
                        <tr><td><b>VGA</b></td><td><input type="text" class="sedang" name="VGA" value="<%=lt.getVGA()%>"></td></tr>
                        <tr><td><b>Hệ điều Hành</b></td><td><input type="text" class="sedang" name="HDH" value="<%=lt.getHDH()%>"></td></tr>
                        <tr><td width="125px"><b>CPUID</b></td><td><input type="text" class="pendek" name="CPUID" value="<%=lt.getCPUID()%>"></td></tr>

                        <tr><td><b>IMG</b></td><td><input type="text" class="panjang" name="IMG"     value="<%=lt.getIMG()%>"></td></tr>
                        <tr><td><b>IMG2</b></td><td><input type="text" class="panjang" name="IMG2"   value="<%=lt.getIMG2()%>"></td></tr>
                        <tr><td><b>IMG3</b></td><td><input type="text" class="panjang" name="IMG3"   value="<%=lt.getIMG3()%>"></td></tr>
                        <tr><td><b>IMG4</b></td><td><input type="text" class="panjang" name="IMG4"   value="<%=lt.getIMG4()%>"></td></tr>

                        <tr><td><b>Mô tả 1</b></td><td><textarea name="Mota"  ><%=lt.getMota()%></textarea></td></tr>
                        <tr><td><b>Mô tả 2</b></td><td><textarea name="Mota2" ><%=lt.getMota2()%></textarea></td></tr>
                        <tr><td></td><td>

                                <input type="hidden" name="command" value="update1">
                                <input type="submit" class="button" value="Sửa">
                                <a href="/shop1/admin/manager_laptop.jsp" class="button" >Hủy</a>

                            </td></tr>
                    </table>
                </form>
            </div>
            <div class="clear"></div>


            <jsp:include page="footer.jsp"></jsp:include>

        </div>
    </body>
</html>
