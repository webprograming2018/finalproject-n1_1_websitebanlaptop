<%-- 
    Document   : checkout
    Created on : Dec 24, 2018, 9:33:44 AM
    Author     : dangv
--%>

<%@page import="javafx.scene.control.Alert"%>
<%@page import="model.Cart"%>
<%@page import="model.Users"%>
<%@page import="model.Users"%>
<%@page import="DAO.LaptopDAO"%>
<%@page import="DAO.CPUDAO"%>
<%@page import="model.CPU"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"><!--hiển thị tùy theo độ rộng ban đâu vs mức zoom =1-->
        <link rel="stylesheet" href="cssweb/btl.css" type="text/css" media="screen">

        <link rel="stylesheet" type="text/css" href="cssweb/search.css" />
        <link rel="stylesheet" type="text/css" href="cssweb/checkout.css" />
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
        <script type="text/javascript" src="E:/ltweb/BTL/bootstrap/ddpowerzoomer.js"></script>
        <title>CheckOut</title>

        <script type="text/javascript">
            function matchaddress() {
                var address = document.form2.address.value;
                var name = document.form2.name.value;
                var sdt = document.form2.sdt.value;
                if (address == ""||name==""||sdt=="")
                {
                    alert("Vui lòng điền đầy đủ các trường dữ liệu");
                    return false;
                }
            }
        </script>

    </head>
    <body>
        <%
            LaptopDAO laptopDAO = new LaptopDAO();

            // nếu chưa có user thì phải đăng nhập
            Users users = (Users) session.getAttribute("user");
            if (users == null) {
                response.sendRedirect("/shop1/login.jsp");
            }

            //Gio hang
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

        %>

        <jsp:include page="header.jsp"></jsp:include>

        <!-- phaanf than-->

        <form name="form2" action="CheckOutServlet" method="POST" onsubmit="return matchaddress()()">

            <div class="checkout">CheckOut </div>

            <div class="address">
                Nơi giao hàng :<span>
                    <input id="where" type="text" name="address" placeholder ="Nhập nơi giao"></span>
            </div>
             <div class="address">
                Tên Khách Hàng:<span>
                    <input id="where" type="text" name="name" placeholder ="Nhập tên khách hàng"></span>
            </div>
             <div class="address">
                SĐT :<span>
                    <input id="where" type="text" name="sdt" placeholder ="Nhập sdt"></span>
            </div>

            <div class="payment">
                Hình thức thanh toán :<span>
                    <select class="select" name="payment">
                        <option value="Tài Khoản Ngân Hàng"> Thẻ Ngân Hàng</option>
                        <option value="Tiền Mặt"> Tiền mặt</option>
                    </select></span>


            </div>
            <div class="pay">
                <input id="confirm" type="submit" value="Check out">
                <a href="bill.jsp">Bill</a>

            </div>   
        </form>
    </div>
</body>
</html>
