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
import java.util.Date;
import model.Bill;

/**
 *
 * @author dangv
 */
public class BillDAO {

    public void insertBill(Bill bill) throws SQLException {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "INSERT INTO Bill VALUES(?,?,?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, bill.getBillID());
        ps.setLong(2, bill.getUserID());
        ps.setFloat(3, bill.getTotal());
        ps.setString(4, bill.getPayment());
        ps.setString(5, bill.getAddress());
        ps.setString(6, bill.getName());
        ps.setString(7, bill.getSdt());
        ps.setTimestamp(8, bill.getDate());
        ps.executeUpdate();

    }

    // laays danh sacsh hoa don
    public ArrayList<Bill> getListBill() throws SQLException {

        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "SELECT * FROM Bill";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Bill> list = new ArrayList<>();
        while (rs.next()) {
            Bill bill = new Bill();
            bill.setBillID(rs.getLong("BillID"));
            bill.setUserID(rs.getLong("UserID"));
            bill.setTotal(rs.getFloat("total"));
            bill.setPayment(rs.getString("payment"));
            bill.setAddress(rs.getString("address"));
            bill.setName(rs.getString("name"));
            bill.setSdt(rs.getString("sdt"));
            bill.setDate(rs.getTimestamp("date"));
            list.add(bill);
        }
        return list;
    }

    // laays danh sacsh hoa don theo ngay
    public ArrayList<Bill> getListBillByDay(String daystart, String dayend) throws SQLException {

        Connection connection = ConnectToMSSQl.getConnection();
       // String sql = "SELECT * FROM Bill WHERE date >= ? and date <=?";
        String sql = "SELECT * FROM Bill WHERE date >=? and date <=(SELECT DATEADD(day,1,?))";
 
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setString(1, daystart);
        ps.setString(2, dayend);
        ResultSet rs = ps.executeQuery();
        ArrayList<Bill> list = new ArrayList<>();
        while (rs.next()) {
            Bill bill = new Bill();
            bill.setBillID(rs.getLong("BillID"));
            bill.setUserID(rs.getLong("UserID"));
            bill.setTotal(rs.getFloat("total"));
            bill.setPayment(rs.getString("payment"));
            bill.setAddress(rs.getString("address"));
            bill.setName(rs.getString("name"));
            bill.setSdt(rs.getString("sdt"));
            bill.setDate(rs.getTimestamp("date"));
            list.add(bill);
        }
        return list;
    }

    public static void main(String[] args) throws SQLException {
        BillDAO billDAO = new BillDAO();
        ArrayList<Bill> list = billDAO.getListBillByDay("2018-12-28","2018-12-28");
        for (Bill bill : list) {
            System.out.println(bill.getBillID());
        }
    }
}
