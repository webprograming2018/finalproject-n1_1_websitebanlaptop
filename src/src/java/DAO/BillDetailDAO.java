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
import model.BillDetail;

/**
 *
 * @author dangv
 */
public class BillDetailDAO {

    public void insertBillDetail(BillDetail bd) throws SQLException {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "INSERT INTO Bill_Detail VALUES(?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);

//do csdl có billdetailid tự tăng
        ps.setLong(1, bd.getBillID());
        ps.setLong(2, bd.getLaptopID());
        ps.setFloat(3, bd.getPrice());
        ps.setInt(4, bd.getQuantity());
        ps.executeUpdate();

    }

    //lay ds theo billID
    public ArrayList<BillDetail> getBillDetail(long BillID) throws SQLException {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "SELECT  * FROM Bill_Detail WHERE Bill_ID = '" + BillID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<BillDetail> list = new ArrayList<>();

        while (rs.next()) {
            BillDetail bd = new BillDetail();
            bd.setBillDetailID(rs.getLong("Bill_Detail_ID"));
            bd.setBillID(rs.getLong("Bill_ID"));
            bd.setLaptopID(rs.getLong("LaptopID"));
            bd.setPrice(rs.getFloat("price"));
            bd.setQuantity(rs.getInt("quantity"));
            list.add(bd);
        }
        return list;
    }

    public static void main(String[] args) throws SQLException {
        BillDetailDAO bdao = new BillDetailDAO();
        ArrayList<BillDetail> list = bdao.getBillDetail(1545877018728l);
        for (BillDetail bill : list) {
            System.out.println(bill.getPrice());
        }
    }
}
