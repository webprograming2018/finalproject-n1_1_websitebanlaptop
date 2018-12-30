<%-- 
    Document   : manager_category
    Created on : Dec 25, 2018, 10:51:28 AM
    Author     : dangv
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.BillDetail"%>
<%@page import="DAO.BillDetailDAO"%>
<%@page import="DAO.LaptopDAO"%>
<%@page import="model.Laptop"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Bill Detail</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/cssweb/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <%

            LaptopDAO laptopDAO = new LaptopDAO();
            BillDetailDAO bd = new BillDetailDAO();
            String BillID = "";
            if (request.getParameter("BillID") != null) {
                BillID = request.getParameter("BillID");
            }
            ArrayList<BillDetail> list = bd.getBillDetail(Long.parseLong(BillID));
        %>

        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>


                <div id="rightContent">
                    <h3>Bill Detail</h3>
                    <table class="data" style="text-align: center;">
                        <tr class="data">
                            <th class="data" width="60px">BillDetailID</th>
                            <th class="data">Bill ID</th>
                            <th class="data">Laptop</th>
                            <th class="data">price</th>
                            <th class="data">Số lượng</th>

                        </tr>

                    <%
                        for (BillDetail billdetail : list) {
                            Laptop lt = new Laptop();
                            lt = laptopDAO.getLaptop(billdetail.getLaptopID());
                            String s = lt.getTenlap();

                    %>
                    <tr class="data">
                        <td class="data" width="30px"><%=billdetail.getBillDetailID()%></td>
                        <td class="data"><%=billdetail.getBillID()%></td>
                        <td class="data"><%=s%></td>
                        <td class="data"><%=billdetail.getPrice()%></td>
                        <td class="data"><%=billdetail.getQuantity()%></td>

                    </tr>
                    <%}%>
                    <tr><td>
                            <br>
                            <a href="/shop1/admin/manager_bill.jsp" class="button" >OK</a>

                        </td></tr>
                </table>
            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>

        </div>

    </body>
</html>
