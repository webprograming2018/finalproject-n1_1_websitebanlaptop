/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.LaptopDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Laptop;

/**
 *
 * @author dangv
 */
public class ManagerLaptopServlet extends HttpServlet {

    LaptopDAO laptopDAO = new LaptopDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");// tiếng việt
        request.setCharacterEncoding("UTF-8");
        String command = request.getParameter("command");
        Long LaptopID = Long.parseLong(request.getParameter("LaptopID"));
        HttpSession session = request.getSession();
        String url = "";
        try {

            switch (command) {
                case "update":   //trả về đối tượng laptop đã chọn cho trang update chứ chưa sửa
                    Laptop lap2=new Laptop();
                    lap2 = laptopDAO.getLaptop(LaptopID);
                    session.setAttribute("laptop", lap2);
                    url = "/admin/update_laptop.jsp";
                    break;
                case "delete":
                    laptopDAO.DeleteLaptop(LaptopID);
                    url = "/admin/manager_laptop.jsp";
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerLaptopServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        RequestDispatcher rs = getServletContext().getRequestDispatcher(url);
        rs.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");// tiếng việt
        request.setCharacterEncoding("UTF-8");
        String command = request.getParameter("command");
        Long LaptopID = Long.parseLong(request.getParameter("LaptopID"));
        String Tenlap = request.getParameter("Tenlap");
        Float Gia = Float.parseFloat(request.getParameter("Gia"));
        String CPU = request.getParameter("CPU");
        String RAM = request.getParameter("RAM");
        String HDD = request.getParameter("HDD");
        String Manhinh = request.getParameter("Manhinh");
        String VGA = request.getParameter("VGA");
        String HDH = request.getParameter("HDH");
        Long CPUID = Long.parseLong(request.getParameter("CPUID"));
        String IMG = request.getParameter("IMG");
        String IMG2 = request.getParameter("IMG2");
        String IMG3 = request.getParameter("IMG3");
        String IMG4 = request.getParameter("IMG4");
        String Mota = request.getParameter("Mota");
        String Mota2 = request.getParameter("Mota2");
        String url = "";
        
        Laptop lt = new Laptop(LaptopID, CPUID, Tenlap, Gia, CPU, RAM, HDD, Manhinh, VGA, HDH, IMG, IMG2, IMG3, IMG4, Mota, Mota2);
        switch (command) {
            case "insert":
                laptopDAO.InsertLaptop(lt);
                url = "/admin/manager_laptop.jsp";
                break;
            case "update1"://thực hiện cập nhật đối tượng từ trang update
                laptopDAO.UpdateLaptop(lt);
                url = "/admin/manager_laptop.jsp";
                break;
        }
        RequestDispatcher rs = getServletContext().getRequestDispatcher(url);
        rs.forward(request, response);
    }

}
