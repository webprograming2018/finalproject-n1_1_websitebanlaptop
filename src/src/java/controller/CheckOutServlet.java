/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.BillDAO;
import DAO.BillDetailDAO;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bill;
import model.BillDetail;
import model.Cart;
import model.Item;
import model.Users;

/**
 *
 * @author dangv
 */
public class CheckOutServlet extends HttpServlet {
 
    private final BillDAO billDAO = new BillDAO();
    private final BillDetailDAO billDetailDAO = new BillDetailDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");// tiếng việt
        request.setCharacterEncoding("UTF-8");
        String payment = request.getParameter("payment");
        String address = request.getParameter("address");
        String name = request.getParameter("name");
        String sdt = request.getParameter("sdt");
        if(address==""||name==""||sdt=="")
        {
            response.sendRedirect("/shop1/checkout.jsp");
        }
        else
        {
     
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Users user=(Users) session.getAttribute("user");

        try {
            long ID = new Date().getTime();
            Bill bill = new Bill();
            bill.setBillID(ID);
            bill.setAddress(address);
            bill.setPayment(payment);
            bill.setName(name);
            bill.setSdt(sdt);
            bill.setUserID(user.getUserID());
            bill.setDate(new Timestamp(new Date().getTime()));
            bill.setTotal((float)cart.totalCart());
            billDAO.insertBill(bill);
            //
           session.setAttribute("bill", bill);
            
            for(Map.Entry<Long, Item>list:cart.getCartItems().entrySet()){
                billDetailDAO.insertBillDetail(new BillDetail(ID,
                        list.getValue().getLaptop().getLaptopID(),
                        list.getValue().getLaptop().getGia(),
                        list.getValue().getQuantity()));
            }
//            cart=new Cart();
//            session.setAttribute("cart", cart);
            
        } catch (Exception e) {
        }
        response.sendRedirect("/shop1/chitietbin.jsp");
    }
    }
}
