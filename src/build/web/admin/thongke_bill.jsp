<%-- 
    Document   : manager_laptop
    Created on : Dec 25, 2018, 11:01:38 AM
    Author     : dangv
--%>

<%@page import="DAO.ExcelDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Bill"%>
<%@page import="DAO.BillDAO"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Bill</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/cssweb/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>


        <%

            BillDAO billDAO = new BillDAO();
//            ExcelDAO exDAO =new ExcelDAO();
            
            ArrayList<Bill> list = null;
            if (session.getAttribute("list") != null) {
                list = (ArrayList<Bill>) session.getAttribute("list");
            }
//            exDAO.InsertExcel(list, "30", "1");
        %>

        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>


                <div id="rightContent">
                    <h3>Thống Kê</h3>
                    <table class="data">
                        <tr class="data">
                            <th class="data" width="30px">BillID</th>
                            <th class="data">UserID</th>
                            <th class="data">Tổng tiền</th>
                            <th class="data">Thanh Toán</th>
                            <th class="data">Nơi giao hàng</th>
                            <th class="data">Tên Khách Hàng</th>
                            <th class="data">SĐT</th>
                            <th class="data">Ngày Mua</th>
                            <th class="data" width="75px">Tùy Chọn</th>
                        </tr>

                    <%
                        float sum=0;
                        for (Bill bill : list) {
                           sum=sum+bill.getTotal();

                    %>
                    <tr class="data">
                        <td class="data" width="30px"><%=bill.getBillID()%></td>
                        <td class="data"><%=bill.getUserID()%></td>
                        <td class="data"><%=bill.getTotal()%></td>
                        <td class="data"><%=bill.getPayment()%></td>
                        <td class="data"><%=bill.getAddress()%></td>
                        <td class="data"><%=bill.getName()%></td>
                        <td class="data"><%=bill.getSdt()%></td>
                        <td class="data"><%=bill.getDate()%></td>
                        <td class="data" width="75px">
                    <center>
                        <a href="/shop1/admin/BillDetail.jsp?BillID=<%=bill.getBillID()%>"><img src="../shop1/imageweb/detail.png">Chi tiết</a>
                    </center>
                    </td>
                    </tr>
                    <%}%>
                    <tr>
                  

                    </tr>
                </table>
                    <br>
                    <h3> Tổng Thu: <%=sum %> </h3>
            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>

        </div>


    </body>
</html>
