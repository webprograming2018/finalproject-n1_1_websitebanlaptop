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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Laptop;

/**
 *
 * @author dangv
 */
public class LaptopDAO {

    //lấy sp theo core
    public ArrayList<Laptop> getListLaptopbyCPUID(long CPUID) throws SQLException {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "SELECT  * FROM Laptop WHERE CPUID= '" + CPUID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Laptop> list = new ArrayList();
        while (rs.next()) {
            Laptop laptop = new Laptop();
            laptop.setLaptopID(rs.getLong("LaptopID"));
            laptop.setCPUID(rs.getLong("CPUID"));
            laptop.setTenlap(rs.getString("TenLap"));
            laptop.setGia(rs.getFloat("Gia"));
            laptop.setCPU(rs.getString("CPU"));
            laptop.setRAM(rs.getString("RAM"));
            laptop.setHDD(rs.getString("HDD"));
            laptop.setManhinh(rs.getString("Manhinh"));
            laptop.setVGA(rs.getString("VGA"));
            laptop.setHDH(rs.getString("HDH"));
            laptop.setIMG(rs.getString("IMG"));
            laptop.setIMG2(rs.getString("IMG2"));
            laptop.setIMG3(rs.getString("IMG3"));
            laptop.setIMG4(rs.getString("IMG4"));
            laptop.setMota(rs.getString("Mota"));
            laptop.setMota2(rs.getString("Mota2"));
            list.add(laptop);
//            System.out.println(rs.getString(1) + "| " + rs.getString(2) + "| " + rs.getFloat(3) + "| " + rs.getString(4));
        }
        return list;
    }

    //lấy tất cả sản phẩm
    public ArrayList<Laptop> getAllLaptop() throws SQLException {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "SELECT  * FROM Laptop ";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Laptop> list = new ArrayList();
        while (rs.next()) {
            Laptop laptop = new Laptop();
            laptop.setLaptopID(rs.getLong("LaptopID"));
            laptop.setCPUID(rs.getLong("CPUID"));
            laptop.setTenlap(rs.getString("TenLap"));
            laptop.setGia(rs.getFloat("Gia"));
            laptop.setCPU(rs.getString("CPU"));
            laptop.setRAM(rs.getString("RAM"));
            laptop.setHDD(rs.getString("HDD"));
            laptop.setManhinh(rs.getString("Manhinh"));
            laptop.setVGA(rs.getString("VGA"));
            laptop.setHDH(rs.getString("HDH"));
            laptop.setIMG(rs.getString("IMG"));
            laptop.setIMG2(rs.getString("IMG2"));
            laptop.setIMG3(rs.getString("IMG3"));
            laptop.setIMG4(rs.getString("IMG4"));
            laptop.setMota(rs.getString("Mota"));
            laptop.setMota2(rs.getString("Mota2"));
            list.add(laptop);

        }
        return list;
    }

    //lấy sp để phân trang
    public ArrayList<Laptop> getListLaptopByNav(int first, int max) throws SQLException {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "SELECT  *FROM dbo.Laptop ORDER BY LaptopID OFFSET  ? ROWS FETCH NEXT ? ROWS ONLY ";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, first);
        ps.setInt(2, max);
        ResultSet rs = ps.executeQuery();
        ArrayList<Laptop> list = new ArrayList();
        while (rs.next()) {
            Laptop laptop = new Laptop();
            laptop.setLaptopID(rs.getLong("LaptopID"));
            laptop.setCPUID(rs.getLong("CPUID"));
            laptop.setTenlap(rs.getString("TenLap"));
            laptop.setGia(rs.getFloat("Gia"));
            laptop.setCPU(rs.getString("CPU"));
            laptop.setRAM(rs.getString("RAM"));
            laptop.setHDD(rs.getString("HDD"));
            laptop.setManhinh(rs.getString("Manhinh"));
            laptop.setVGA(rs.getString("VGA"));
            laptop.setHDH(rs.getString("HDH"));
            laptop.setIMG(rs.getString("IMG"));
            laptop.setIMG2(rs.getString("IMG2"));
            laptop.setIMG3(rs.getString("IMG3"));
            laptop.setIMG4(rs.getString("IMG4"));
            laptop.setMota(rs.getString("Mota"));
            laptop.setMota2(rs.getString("Mota2"));
            list.add(laptop);

        }
        return list;
    }

    //tính tổng sp
    public int countLaptop() throws SQLException {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "SELECT  COUNT(LaptopID) FROM Laptop ";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);

        }
        return count;
    }

    //lấy sản phẩm theo id
    public Laptop getLaptop(long LaptopID) throws SQLException {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "SELECT  * FROM Laptop WHERE LaptopID= '" + LaptopID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Laptop laptop = new Laptop();
        while (rs.next()) {
            laptop.setLaptopID(rs.getLong("LaptopID"));
            laptop.setCPUID(rs.getLong("CPUID"));
            laptop.setTenlap(rs.getString("TenLap"));
            laptop.setGia(rs.getFloat("Gia"));
            laptop.setCPU(rs.getString("CPU"));
            laptop.setRAM(rs.getString("RAM"));
            laptop.setHDD(rs.getString("HDD"));
            laptop.setManhinh(rs.getString("Manhinh"));
            laptop.setVGA(rs.getString("VGA"));
            laptop.setHDH(rs.getString("HDH"));
            laptop.setIMG(rs.getString("IMG"));
            laptop.setIMG2(rs.getString("IMG2"));
            laptop.setIMG3(rs.getString("IMG3"));
            laptop.setIMG4(rs.getString("IMG4"));
            laptop.setMota(rs.getString("Mota"));
            laptop.setMota2(rs.getString("Mota2"));
        }
        return laptop;
    }

//thêm mới laptop
    public boolean InsertLaptop(Laptop laptop) {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "INSERT INTO Laptop VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
        try {
            PreparedStatement ps;
            ps = connection.prepareCall(sql);
            ps.setLong(1, laptop.getLaptopID());
            ps.setString(2, laptop.getTenlap());
            ps.setFloat(3, laptop.getGia());
            ps.setString(4, laptop.getCPU());
            ps.setString(5, laptop.getRAM());
            ps.setString(6, laptop.getHDD());
            ps.setString(7, laptop.getManhinh());
            ps.setString(8, laptop.getVGA());
            ps.setString(9, laptop.getHDH());
            ps.setString(10, laptop.getMota());
            ps.setString(11, laptop.getIMG());
            ps.setLong(12, laptop.getCPUID());
            ps.setString(13, laptop.getMota2());
            ps.setString(14, laptop.getIMG2());
            ps.setString(15, laptop.getIMG3());
            ps.setString(16, laptop.getIMG4());
            int tacdong = ps.executeUpdate();
            if (tacdong > 0) {
                System.out.println("Insert thành công");
            } else {
                System.out.println("Insert thất bại");
            }

        } catch (SQLException ex) {
            Logger.getLogger(LaptopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    //update Laptop
     public boolean UpdateLaptop(Laptop laptop) {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "UPDATE Laptop SET Tenlap=?,Gia=?,CPU=?,RAM=?,HDD=?,ManHinh=?,VGA=?,HDH=?,Mota=?,IMG=?,CPUID=?,Mota2=?,IMG2=?,IMG3=?,IMG4=?  WHERE LaptopID=?";
        try {
            PreparedStatement ps;
            ps = connection.prepareCall(sql);
           
            ps.setString(1, laptop.getTenlap());
            ps.setFloat(2, laptop.getGia());
            ps.setString(3, laptop.getCPU());
            ps.setString(4, laptop.getRAM());
            ps.setString(5, laptop.getHDD());
            ps.setString(6, laptop.getManhinh());
            ps.setString(7, laptop.getVGA());
            ps.setString(8, laptop.getHDH());
            ps.setString(9, laptop.getMota());
            ps.setString(10, laptop.getIMG());
            ps.setLong(11, laptop.getCPUID());
            ps.setString(12, laptop.getMota2());
            ps.setString(13, laptop.getIMG2());
            ps.setString(14, laptop.getIMG3());
            ps.setString(15, laptop.getIMG4());
             ps.setLong(16, laptop.getLaptopID());
            int tacdong = ps.executeUpdate();
            if (tacdong > 0) {
                System.out.println("Update thành công");
            } else {
                System.out.println("Update thất bại");
            }

        } catch (SQLException ex) {
            Logger.getLogger(LaptopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
     
     //xoa laptop
      public boolean DeleteLaptop(Long LaptopID) {
        Connection connection = ConnectToMSSQl.getConnection();
        String sql = "DELETE FROM Laptop WHERE LaptopID=?";
        try {
            PreparedStatement ps;
            ps = connection.prepareCall(sql);
            ps.setLong(1, LaptopID);
            int tacdong = ps.executeUpdate();
            if (tacdong > 0) {
                System.out.println("Xoas thành công");
            } else {
                System.out.println("Xoa thất bại");
            }

        } catch (SQLException ex) {
            Logger.getLogger(LaptopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    

    public static void main(String[] args) throws SQLException {
        LaptopDAO dao = new LaptopDAO();
//        for (Laptop ds : dao.getListLaptopbyCPUID(3)) {
//            System.out.println(ds.getLaptopID() + " " + ds.getTenlap() + " " + ds.getCPU());
//        }

//        ArrayList<Laptop> lt = dao.getListLaptopByNav(3, 2);
//        for (Laptop lap : lt) {
//            System.out.println(lap.getLaptopID());
//        }

//Laptop lap=new Laptop(13,2,"22",33,"core","1gb","corei7","core","core","core","core","vb","core","cores","core","core");
////    dao.InsertLaptop(lap);
//dao.UpdateLaptop(lap);

//
//        dao.DeleteLaptop(13l);

        System.out.println(dao.getLaptop(4).getMota());
    }
}
