<%-- 
    Document   : buying
    Created on : Dec 5, 2018, 8:54:20 AM
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
        <link rel="stylesheet" href="cssweb/buying.css" type="text/css" media="screen">
        <link rel="stylesheet" type="text/css" href="cssweb/search.css" />
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 


        <script type="text/javascript" src="E:/ltweb/BTL/bootstrap/ddpowerzoomer.js"></script>


        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $('#1').addpowerzoom();
            });
        </script>

        <title>Buying</title>
    </head>
    <body>
        <%

            Laptop lt = new Laptop();// lấy id laptop để hiển thị
            LaptopDAO laptopDAO = new LaptopDAO();
            String LaptopID = "";
            if (request.getParameter("LaptopID") != null) {
                LaptopID = request.getParameter("LaptopID");
                lt = laptopDAO.getLaptop(Long.parseLong(LaptopID));
            }


        %>

        <jsp:include page="header.jsp"></jsp:include>

            <!-- phần sản phẩm chi tiết -->

            <div class="productmain" >
                <div class="container-fluid">
                    <div class="row" style="padding-top: 20px">
                        <div  class="col-lg-4 col-md-6 col-sm-12 col-xs-12 move"  >
                            <div  class="productimg">
                                <a href="#">
                                    <img  src ="<%=lt.getIMG()%>" alt="<%=lt.getTenlap()%>" > <!-- trả về tên và ảnh theo id-->
                            </a>
                        </div>     
                    </div>

                    <div  class="col-lg-4 col-md-6 col-sm-12 col-xs-12 move"  >
                        <div class="productnote">
                            <ul>      
                                <li id="nameproduct"><b><%=lt.getTenlap()%> </b>   </li>
                                <li id="gia"><%=lt.getGia()%> (tr)VNĐ </li>
                                <li><b>CPU :</b> <%=lt.getTenlap()%>  </li>
                                <li><b> RAM :</b>      <%=lt.getRAM()%>  </li>
                                <li><b>Ổ cứng :</b>    <%=lt.getHDD()%> </li>
                                <li><b>Màn hình :</b>  <%=lt.getManhinh()%></li>
                                <li><b>HĐH :</b>  <%=lt.getHDH()%>   </li>

                            </ul>
                            <a href="CartServlet?command=plus&LaptopID=<%=lt.getLaptopID()%>" class="muahang">Mua Ngay </a>
                            <!--<button type="button" class="muahang">Mua Ngay</button> -->
                        </div>
                    </div>
                    <div  class="col-lg-4 col-md-0 col-sm-12 col-xs-12 move"  >
                        <div class="baohanh">
                            <h4 ><b>Ngần ngại gì mà chưa mua tại HBS</b></h4>
                            <ul>
                                <li style="list-style-image: url(imageweb/Leaves_leaf_green_natural-512.png);">Giao hàng nhanh chóng</li>
                                <li style="list-style-image: url(imageweb/Leaves_leaf_green_natural-512.png);">Thanh toán thuận tiện</li>
                                <li style="list-style-image: url(imageweb/Leaves_leaf_green_natural-512.png);">Bảo hành tại nơi sử dụng</li>
                                <li style="list-style-image: url(imageweb/Leaves_leaf_green_natural-512.png);">Chính hãng 100%</li>
                                <li style="list-style-image: url(imageweb/Leaves_leaf_green_natural-512.png);">Nhân viên thân thiện</li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!--thông số -->
        <div class="container-fluid">
            <div class="row" style="padding-top: 20px">
                <div  class="col-lg-6 col-md-6 col-sm-12 col-xs-12 move"  >
                    <div  class="thongso">
                        <h3><b>Thông Số Kĩ Thuật</b></h3>
                        <%
                            String s = lt.getMota();
                            String[] arr = s.split("_");
                        %>
                        <ul>
                            <li><b>Công nghệ CPU:</b><%=arr[0]%></li>
                            <li><b>Loại CPU:</b><%=arr[1]%></li>
                            <li><b>Tốc độ CPU:</b><%=arr[2]%></li>
                            <li><b>Tốc độ tối đa:</b><%=arr[3]%></li>
                            <li><b>Tốc độ Bus:</b><%=arr[4]%></li>
                            <li><b>RAM:</b><%=arr[5]%></li>
                            <li><b>Loại RAM:</b><%=arr[6]%></li>
                            <li><b>Tốc độ Bus RAM:</b><%=arr[7]%></li>
                            <li><b>Hỗ trợ RAM tối đa:</b><%=arr[8]%></li>
                            <li><b>Ổ cứng:HDD: </b><%=arr[9]%></li>
                            <li><b>Kích thước màn hình:</b><%=arr[10]%></li>
                            <li><b>Độ phân giải:</b><%=arr[11]%></li>
                            <li><b>Công nghệ màn hình:</b><%=arr[12]%></li>
                            <li><b>Màn hình cảm ứng:</b><%=arr[13]%></li>
                            <li><b>Card đồ họa:</b><%=arr[14]%></li>
                            <li><b>Công nghệ âm thanh:</b><%=arr[15]%></li>
                            <li><b>Cổng giao tiếp:</b><%=arr[16]%></li>
                            <li><b>Kết nối không dây:</b><%=arr[17]%></li>
                            <li><b>Khe đọc thẻ nhớ:</b><%=arr[18]%>/li>
                            <li><b>Webcam:</b><%=arr[19]%></li>
                            <li>
                        </ul>
                    </div>
                </div>

                <div  class="col-lg-6 col-md-6 col-sm-12 col-xs-12 move"  >
                    <div  class="mota">
                        <h3><b>Mô tả chi tiết</b></h3>
                        <%
                            String s2 = lt.getMota2();//lấy mô tả 2 > cắt ra các mảng
                            String[] arr2 = s2.split("_");
                        %>
                        <p> 
                            <br><img src="<%=lt.getIMG()%>" alt "hinh"><br>
                            <br>  <%=arr2[0]%><br>
                            <br><img src="<%=lt.getIMG2()%>" alt "hinh"><br>
                            <br>  <%=arr2[1]%><br>
                            <br><img src="<%=lt.getIMG3()%>" alt "hinh"><br>
                            <br>  <%=arr2[2]%><br>
                            <br><img src="<%=lt.getIMG4()%>" alt "hinh"><br>

                        </p>
                    </div>
                </div>              
            </div>
        </div> 

    </body>
</html>
