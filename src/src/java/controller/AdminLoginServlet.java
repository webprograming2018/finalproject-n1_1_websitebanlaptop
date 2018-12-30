/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author dangv
 */
public class AdminLoginServlet extends HttpServlet {

    UsersDAO usersDAO = new UsersDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        String url = "";
        HttpSession session = request.getSession();
        switch (command) {

            case "login":
                Users users = new Users();
                //users = usersDAO.login(request.getParameter("email"), MD5.encryption(request.getParameter("pass")));
                users = usersDAO.Adminlogin(request.getParameter("email"), request.getParameter("pass"));
                if (users != null) {
                    session.setAttribute("user", users);
                    url = "/admin/index.jsp";
                } else {

                    url = "/admin/loginadmin.jsp";
                }
                break;

        }
        RequestDispatcher rs = getServletContext().getRequestDispatcher(url);//trả về RequestDispatcher có vị trí tương đối với contextPath
        rs.forward(request, response);

    }

}
