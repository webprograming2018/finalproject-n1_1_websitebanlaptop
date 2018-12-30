<%-- 
    Document   : bin
    Created on : Dec 5, 2018, 9:38:00 AM
    Author     : dangv
--%>

<%@page import="model.Item"%>
<%@page import="java.util.Map"%>
<%@page import="model.Cart"%>
<%@page import="model.CPU"%>
<%@page import="model.Laptop"%>
<%@page import="model.Users"%>
<%@page import="DAO.LaptopDAO"%>
<%@page import="DAO.CPUDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"><!--hiển thị tùy theo độ rộng ban đâu vs mức zoom =1-->
        <link rel="stylesheet" href="cssweb/bin.css" type="text/css" media="screen">
        <link rel="stylesheet" type="text/css" href="cssweb/search.css" />
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
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

        %>

         <jsp:include page="header.jsp"></jsp:include>
         
         
        <div class="container">
            <div class="check-out">
                <%for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {%>
                <div class="imgbin" ><img src="<%=list.getValue().getLaptop().getIMG()%>"><%=list.getValue().getLaptop().getTenlap()%>
                    <a href="CartServlet?command=remove&LaptopID=<%=list.getValue().getLaptop().getLaptopID()%>" style="padding-left: 50px; color: red;">  X </a></pre </div>
                <div class="cost"><%=list.getValue().getQuantity()%> x <%=list.getValue().getLaptop().getGia()%>(triệu đồng) </div>
                <%}%>

                <div class="total">
                    Tổng tiền:

                    <%=cart.totalCart()%> triệu(VNĐ)
                </div>
                <div style="margin-top: 50px;">
                    <a href="checkout.jsp" id="payment1">Thanh Toán </a>
                    
                </div>

                <p><br>Click<a href="home.jsp"> here</a> to continue shopping</p>

            </div>
        </div>
    </body>
</html>
