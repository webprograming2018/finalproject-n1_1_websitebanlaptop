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
import java.util.ArrayList;
import model.CPU;

/**
 *
 * @author dangv
 */
public class CPUDAO {

    public ArrayList<CPU> getListCPU() throws SQLException {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "SELECT  * FROM CPU";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<CPU> list = new ArrayList();
        while (rs.next()) {
            CPU cpu = new CPU();
            cpu.setCPUID(rs.getLong("CPUID"));
            cpu.setCPU(rs.getString("CPU"));
            list.add(cpu);
//            System.out.println(rs.getString(1) + "| " + rs.getString(2) + "| " + rs.getFloat(3) + "| " + rs.getString(4));
        }
        return list;
    }
}
