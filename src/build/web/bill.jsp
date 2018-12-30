<%-- 
    Document   : bill
    Created on : Dec 29, 2018, 10:56:14 PM
    Author     : vuonghieu
--%>

<%@page import="model.Users"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="model.Item"%>
<%@page import="java.util.Map"%>
<%@page import="model.Bill"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="model.Cart"%>
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
            //Cart
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            Users users = null;
            if (session.getAttribute("user") != null) {
                users = (Users) session.getAttribute("user");
            }

            response.setContentType("application/pdf");
            Document document = new Document();
            PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            Font fList = new Font();
            fList.setStyle(Font.BOLDITALIC);
            fList.setSize(18);
            fList.setColor(BaseColor.GRAY);
            int total = cart.getCartItems().size();

            document.add(new Paragraph("Customer: " + users.getUserEmail() + " \n" + "List Items: " + "\n" + "Total Items: " + total, fList));
            Font f = new Font();
            f.setStyle(Font.BOLD);
            f.setSize(18);

            Paragraph paragraph;
            for (Map.Entry<Long, Item> item : cart.getCartItems().entrySet()) {
                paragraph = new Paragraph();
                paragraph.setAlignment(Element.ALIGN_CENTER);
                paragraph.add(item.getValue().getLaptop().getTenlap() + " - " + item.getValue().getLaptop().getGia() + "00.000 VNĐ : " + item.getValue().getQuantity());
                document.add(paragraph);
            }
            document.add(new Paragraph("Total price: " + cart.totalCart() + "00.000 VNĐ", f));
            document.close();

        %>
    </body>
</html>
