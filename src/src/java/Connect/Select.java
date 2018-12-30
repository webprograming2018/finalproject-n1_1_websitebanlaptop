/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dangv
 */
public class Select {
    public static void main(String[] args) {
        ConnectToMSSQl s = new ConnectToMSSQl();
        Connection con = s.getConnection();
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT  * FROM Laptop");
            while (rs.next()) {
                System.out.println(rs.getString(1)+"| "+rs.getString(2)+"| "+rs.getFloat(3)+"| "+rs.getString(4));
            }
            st.close();
            con.close();
        } catch (SQLException ex) {
            
            System.out.println("Lỗi");
        }
    }

}
