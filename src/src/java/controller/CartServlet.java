/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.LaptopDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Laptop;

/**
 *
 * @author dangv
 */
public class CartServlet extends HttpServlet {

    private final LaptopDAO laptopDAO = new LaptopDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String command = request.getParameter("command");
        String LaptopID = request.getParameter("LaptopID");
        Cart cart = (Cart) session.getAttribute("cart");

        try {
            Long idLaptop = Long.parseLong(LaptopID);
            Laptop laptop = laptopDAO.getLaptop(idLaptop);
            switch (command) {
                case "plus":
                    if (cart.getCartItems().containsKey(idLaptop)) {
                        cart.plusToCart(idLaptop, new Item(laptop, cart.getCartItems().get(idLaptop).getQuantity()));
                    } else {
                        cart.plusToCart(idLaptop, new Item(laptop, 1));
                    }
                    ;
                    break;
                case "remove":
                    cart.removeToCart(idLaptop);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/shop1/home.jsp");
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("/shop1/bin.jsp");
    }

}
