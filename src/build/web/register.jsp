<%-- 
    Document   : register
    Created on : Dec 5, 2018, 9:02:20 AM
    Author     : dangv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> <!--bai7-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng kí</title>
        <link rel="stylesheet" type="text/css" href="cssweb/register.css" />

        <script type="text/javascript">
            function matchpass() {
                var firstpassword = document.form1.pass.value;
                var secondpassword = document.form1.repass.value;
                if(firstpassword==""||secondpassword=="")
                {
                    alert("Vui lòng điền user và pass");
                   
                    return false;
                }
                if (firstpassword == secondpassword) {
                    return true;
                } else {
                    alert("Mật khẩu phải trùng nhau");
                    document.form1.pass.value = "";
                    document.form1.repass.value = "";
                    return false;
                }
                
            }
        </script>
        <!--   phan dang ki tai khoan-->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var x_timer;
                $("#email").keyup(function (e) {//nhả phím nhấn
                    clearTimeout(x_timer);//delay time
                    var user_name = $(this).val();
                    x_timer = setTimeout(function () {
                        check_username_ajax(user_name);
                    }, 1000);
                });

                function check_username_ajax(username) {
                    $("#user-result").html('<img src="img/ajax-loader.gif" />');
                    $.post('CheckEmailServlet', {'username': username}, function (data) {
                        $("#user-result").html(data);
                    });
                }
            });
        </script>

    </head>
    <body>
        <div id="header">

            <a target="_blank" href="home.jsp"> <!-- click logo reset lại trang-->
                <img  src="imageweb/logo.jpg" alt="nhu qq" style="margin: 20px 50px 0px 100px;" width=100px;>   
            </a>

        </div>

        <div class="form" action="" onsubmit="return matchpass()">
            <form name="form1" action="UsersServlet" method="POST">//

                <div class="Register">REGISTRATION </div>

                <div class="Gmail">
                    Email*<br>
                    <input id="email" type="text" name="email" placeholder="Enter Your Email">
                    <span id="user-result"></span>
                </div>
                <div class="PassWord">
                    PassWord*<br>
                    <input id="pass" type="password" name="pass" placeholder="Enter PassWord">
                    <span></span>
                </div>
                <div class="RePass">
                    RePass*<br>
                    <input id="repass" type="password" name="repass" placeholder="Enter PassWord Again">
                </div>

                <div class="Dangki">
                    <input type="hidden" value="insert" name="command">
                    <input id="dangnhap" type="submit" value="Đăng Kí">
                </div>

                <!-- 	</div>
                        <div class="Return">
                    <input id="return" type="button" onclick=<a target="_blank" href="flex.htm>"  value="Trở về">
                        </div> -->


            </form>
        </div>
    </body>
</html>
