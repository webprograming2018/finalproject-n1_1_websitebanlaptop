<%-- 
    Document   : home.jsp
    Created on : Dec 6, 2018, 10:01:07 AM
    Author     : dangv
--%>
<%@page import="model.Cart"%>
<%@page import="model.Users"%>
<%@page import="model.Laptop"%>
<%@page import="DAO.LaptopDAO"%>
<%@page import="model.CPU"%>
<%@page import="DAO.CPUDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"><!--hiển thị tùy theo độ rộng ban đâu vs mức zoom =1-->
        <link rel="stylesheet" href="cssweb/btl.css" type="text/css" media="screen">
        <link rel="stylesheet" type="text/css" href="cssweb/search.css" />
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
        <script type="text/javascript" src="E:/ltweb/BTL/bootstrap/ddpowerzoomer.js"></script>
        <title>Home</title>
    </head>
    <body>

        <%
            //phân trang
            LaptopDAO laptopDAO = new LaptopDAO();
            int pages = 1;
            int tongpages;
            int first = 0;
            int tonglt = laptopDAO.countLaptop();//tinhs toong laptop co

            if (tonglt % 8 == 0) {
                tongpages = tonglt / 8;//tinh so trang 
            } else {
                tongpages = tonglt / 8 + 1;
            };

            if (request.getParameter("pages") != null) {
                pages = (int) Integer.parseInt(request.getParameter("pages"));
            }
            first = (pages - 1) * 8;
        %>


        <!-- đầu trang --> 

        <jsp:include page="header.jsp"></jsp:include>


            <!-- phần sản phẩm -->
            <div class="productmain" >
                <div class="container-fluid">
                    <div class="row" style="padding-top: 20px">
                    <%
                        for (Laptop lt : laptopDAO.getListLaptopByNav(first, 8)) {
                    %>
                    <div  class="col-lg-3 col-md-4 col-sm-6 col-xs-12 move"  >                 
                        <div class="product" >
                            <div  class="productimg">
                                <a href="buying.jsp?LaptopID=<%=lt.getLaptopID()%>">
                                    <img src ="<%=lt.getIMG()%>" alt="<%=lt.getTenlap()%>" > 
                                </a>
                            </div>
                            <div class="productnote">
                                <ul>      
                                    <li><b><big><%=lt.getTenlap()%> </big></b>   </li>
                                    <li id="gia"><%=lt.getGia()%>  (tr)VNĐ</li>
                                    <li><b>CPU :</b>    <%=lt.getCPU()%>  </li>
                                    <li><b> RAM :</b>   <%=lt.getRAM()%> </li>
                                    <li><b>VGA :</b>     <%=lt.getVGA()%></li>
                                    <li><b>Ổ cứng :</b>    <%=lt.getHDD()%>  </li>
                                    <li><b>Màn hình :</b>  <%=lt.getManhinh()%></li>
                                    <li><b>HĐH :</b>     <%=lt.getHDH()%>     </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>

                </div> 
            </div>
        </div>



        <!-- chọn trang -->
        <div>
            <ul class="start">
                <% if (pages > 1) {%>
                <li ><a class="previous2" href="home.jsp?pages=<%=pages - 1%>"><img  src="imageweb/previous.jpg"></a></li>
                        <% } %>

                <% for (int i = 1; i <= tongpages; i++) {%>
                <li class="arrow"><a href="home.jsp?pages=<%=i%>"><%=i%></a></li>
                    <%}%>

                <% if (pages < tongpages) {%>
                <li ><a class="next2" href="home.jsp?pages=<%=pages + 1%>"><img src="imageweb/next.jpg"></a></li>
                        <% }%>
            </ul>

        </div>


        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
