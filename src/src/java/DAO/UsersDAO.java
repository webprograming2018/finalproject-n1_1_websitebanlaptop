/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connect.ConnectToMSSQl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Users;
//bai7

/**
 *
 * @author dangv
 */
public class UsersDAO {

    public boolean checkEmail(String email) {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "SELECT  * FROM Users WHERE user_email= '" + email + "'";
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //phương thức thêm tài khoản
    public boolean insertUser(Users user) {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "INSERT INTO Users VALUES(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, user.getUserID());
            ps.setString(2, user.getUserEmail());
            ps.setString(3, user.getUserPass());
            ps.setBoolean(4, user.isUserRole());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // kiểm tra đăng nhập
    public Users login(String username, String password) {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "SELECT  * FROM Users WHERE user_email= '" + username + "'and user_pass= '" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                Users user = new Users();
                user.setUserID(rs.getLong("user_id"));
                user.setUserEmail(rs.getString("user_email"));
                user.setUserPass(rs.getString("user_pass"));
                user.setUserRole(rs.getBoolean("user_role"));
                connection.close();
                return user;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;

    }

      // kiểm tra Admin đăng nhập
    public Users Adminlogin(String username, String password) {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "SELECT  * FROM Users WHERE user_role='True' and user_email= '" + username + "'and user_pass= '" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                Users user = new Users();
                user.setUserID(rs.getLong("user_id"));
                user.setUserEmail(rs.getString("user_email"));
                user.setUserPass(rs.getString("user_pass"));
                user.setUserRole(rs.getBoolean("user_role"));
                connection.close();
                return user;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;

    }
    public static void main(String[] args) {
        UsersDAO us=new UsersDAO();
        System.out.println(us.Adminlogin("dangvietbacptit@gmail.com", "01062000").getUserID());
    }
}
