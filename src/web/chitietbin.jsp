<%-- 
    Document   : chitietbin
    Created on : Dec 29, 2018, 12:17:12 PM
    Author     : dangv
--%>

<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.Bill"%>
<%@page import="model.Cart"%>
<%@page import="model.Users"%>
<%@page import="DAO.LaptopDAO"%>
<%@page import="DAO.CPUDAO"%>
<%@page import="model.Laptop"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="cssweb/mos-style.css"> 
        <title>Chi tiết hóa đơn</title>
    </head>
    <body>
        <%

            Laptop lt = new Laptop();// lấy id laptop để hiển thị
            CPUDAO cpuDAO = new CPUDAO();
            LaptopDAO laptopDAO = new LaptopDAO();
            Users users = null;
            if (session.getAttribute("user") != null) {
                users = (Users) session.getAttribute("user");
            }

            //Cart
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            // Billl
            Bill bill = (Bill) session.getAttribute("bill");
            if (bill == null) {
                bill = new Bill();
                session.setAttribute("bill", bill);
            }

        %>


        <h2>Hóa đơn mua hàng</h2>
        <div id="wrapper">
            <table width="95%">

                <tr><td><b>Tên Khách Hàng:</b></td><td><input type="text" class="sedang" value="<%=bill.getName()%>"></td></tr>
                <tr><td><b>Tài Khoản: </b></td><td><input type="text" class="sedang" value="<%=bill.getUserID()%>"></td></tr>
                <tr><td><b>Nơi giao hàng: </b></td><td><input type="text" class="sedang"value="<%=bill.getAddress()%>"></td></tr>
                <tr><td><b>Hình thức thanh toán: </b></td><td><input type="text" class="sedang" value="<%=bill.getPayment()%>"></td></tr>
                <tr><td><b>Ngày mua: </b></td><td><input type="text" class="sedang" value="<%=bill.getDate()%>"></td></tr>
                <tr><td><b>SĐT: </b></td><td><input type="text" class="sedang" value="<%=bill.getSdt()%>"></td></tr>



            </table>
        </div>
        <h3>Chi tiết</h3>
        <div id="wrapper">

            <table width="95%">

                <tr><td><b>BillID:</b></td><td><input type="text" class="sedang" value="<%=bill.getBillID()%>"></td></tr>

                <%for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {%>
                <tr><td><b>Sản Phẩm: </b></td><td><input type="text" class="sedang" value="<%=list.getValue().getLaptop().getTenlap()%>"></td></tr>
<!--                <div class="imgbin" ><img src="<%=list.getValue().getLaptop().getIMG()%>"></div>-->
                <tr><td><b>Giá: </b></td><td><input type="text" class="sedang" value="<%=list.getValue().getLaptop().getGia()%>"></td></tr>
                <tr><td><b>Số Lượng: </b></td><td><input type="text" class="sedang" value="<%=list.getValue().getQuantity()%>"></td></tr>
                        <%}%>
                <tr><td><b>Tổng Tiền: </b></td><td><input type="text" class="sedang" value="<%=cart.totalCart()%> triệu(VNĐ)"></td></tr>



                <tr><td></td><td>
                        <%  Cart cart1 = new Cart();
                            session.setAttribute("cart", cart1);
                            Bill bill1 = new Bill();
                            session.setAttribute("bill", bill1);
                        %>
                        <a href="/shop1/home.jsp" class="button" >OK </a>
                        <a href="bill.jsp" class="button">Bill</a>
                    </td></tr>
            </table>
        </div>
        <div class="clear"></div>
    </div>
</body>
</html>
