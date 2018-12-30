/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.UsersDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;
import tools.MD5;
import utils.MyUtils;

/**
 *
 * @author dangv
 */
//bai7
public class UsersServlet extends HttpServlet {
    
    UsersDAO usersDAO = new UsersDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String command = request.getParameter("command");
        String rememberMeStr = request.getParameter("rememberMe");
        boolean remember = "Y".equals(rememberMeStr);
        String url = "";
        HttpSession session = request.getSession();
        switch (command) {
            case "insert":
                Users users = new Users();
                users.setUserID(new java.util.Date().getTime());
                users.setUserEmail(request.getParameter("email"));
                // users.setUserPass(MD5.encryption(request.getParameter("pass")));//bai7
                users.setUserPass(request.getParameter("pass"));//bai7
                users.setUserRole(false);
                
                usersDAO.insertUser(users);
                session.setAttribute("user", users);
                url = "/home.jsp";
                break;
            case "login":
                //users = usersDAO.login(request.getParameter("email"), MD5.encryption(request.getParameter("pass")));
                users = usersDAO.login(request.getParameter("email"), request.getParameter("pass"));
                if (users != null) {
                    session.setAttribute("user", users);
                    url = "/home.jsp";
                    if (remember) {
                        MyUtils.storeUserCookie(response, users);
                    } else {
                        MyUtils.deleteUserCookie(response);
                    }
                } else {
                    
                    url = "/login.jsp";
                }
                break;
            
        }
        RequestDispatcher rs = getServletContext().getRequestDispatcher(url);//trả về RequestDispatcher có vị trí tương đối với contextPath
        rs.forward(request, response);
        
    }
    
}
