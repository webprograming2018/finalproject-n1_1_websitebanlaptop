<%-- 
    Document   : home
    Created on : Dec 5, 2018, 8:46:58 AM
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
        <title>Product</title>
    </head>
    <body>
        <%
            LaptopDAO laptopDAO = new LaptopDAO();
            //CPU
            String CPUID = "1";
            if (request.getParameter("cpu") != null) {
                CPUID = request.getParameter("cpu");
            }

        %>


        <jsp:include page="header.jsp"></jsp:include>



            <!-- phần sản phẩm-->
            <div class="productmain" >
                <div class="container-fluid">
                    <div class="row" style="padding-top: 20px">

                    <%                        
                    for (Laptop lt : laptopDAO.getListLaptopbyCPUID(Long.parseLong(CPUID))) {
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
                                    <li id="gia"><%=lt.getGia()%>  (tr)VNĐ </li>
                                    <li><b>CPU :</b><%=lt.getCPU()%>  </li>
                                    <li><b> RAM :</b><%=lt.getRAM()%>  </li>
                                    <li><b>Ổ cứng :</b><%=lt.getHDD()%>  </li>
                                    <li><b>VGA :</b><%=lt.getVGA()%></li>
                                    <li><b>Màn hình :</b><%=lt.getManhinh()%></li>
                                    <li><b>HĐH :</b> <%=lt.getHDH()%>   </li>

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

        <div>
            <ul class="start">

                <li ><a class="previous2" href="#"><img  src="imageweb/previous.jpg"></a></li>
                <li><span>1</span></li>
                <li class="arrow"><a href="#">2</a></li>
                <li class="arrow"><a href="#">3</a></li>
                <li class="arrow"><a href="#">4</a></li>
                <li class="arrow"><a href="#">5</a></li>
                <li ><a class="next2" href="#"><img src="imageweb/next.jpg"></a></li>
            </ul>

        </div>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
