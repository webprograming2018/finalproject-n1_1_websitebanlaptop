/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Bill;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author dangv
 */
public class ExcelDAO {

    public static boolean InsertExcel(ArrayList<Bill> list, String daystart,String dayend) throws IOException {
        int i = 0;
        FileOutputStream file2 = new FileOutputStream("E:/netbean hoc code/shop1/ghifile_"+daystart+"_"+dayend+".xlsx");
        XSSFWorkbook wb2 = new XSSFWorkbook();
        XSSFSheet sheet = wb2.createSheet("ProHome");
        Cell cell1;
        Row row1;
        row1 = sheet.createRow(0);
        cell1 = row1.createCell(0, CellType.NUMERIC);
        cell1.setCellValue("BillID");
        cell1 = row1.createCell(1, CellType.NUMERIC);
        cell1.setCellValue("UserID");
        cell1 = row1.createCell(2, CellType.NUMERIC);
        cell1.setCellValue("Tổng tiền");
        cell1 = row1.createCell(3, CellType.STRING);
        cell1.setCellValue("Thanh Toán");
        cell1 = row1.createCell(4, CellType.STRING);
        cell1.setCellValue("Nơi giao hàng");
        cell1 = row1.createCell(5, CellType.STRING);
        cell1.setCellValue("Tên Khách Hàng");
        cell1 = row1.createCell(6, CellType.STRING);
        cell1.setCellValue("SĐT");
        cell1 = row1.createCell(7, CellType.STRING);
        cell1.setCellValue("Ngày mua");
        cell1 = row1.createCell(8, CellType.NUMERIC);
        cell1.setCellValue("Tổng Doanh thu:");
        XSSFRow row = null;
        XSSFCell cellA;
        XSSFCell cellB;
        XSSFCell cellC;
        XSSFCell cellD;
        XSSFCell cellE;
        XSSFCell cellF;
        XSSFCell cellG;
        XSSFCell cellH;
        for (Bill bill : list) {
            i++;
            row = sheet.createRow((short) i);
            cellA = row.createCell((short) 0);
            cellA.setCellValue(bill.getBillID());
            cellB = row.createCell((short) 1);
            cellB.setCellValue(bill.getUserID());
            cellC = row.createCell((short) 2);
            cellC.setCellValue(bill.getTotal());
            cellD = row.createCell((short) 3);
            cellD.setCellValue(bill.getPayment());
            cellE = row.createCell((short) 4);
            cellE.setCellValue(bill.getAddress());
            cellF = row.createCell((short) 5);
            cellF.setCellValue(bill.getName());
            cellG = row.createCell((short) 6);
            cellG.setCellValue(bill.getSdt());
            cellH = row.createCell((short) 7);
            cellH.setCellValue(bill.getDate());
        }

        // Sét công thức.
        XSSFCell cellI;
        cellI = row.createCell(8, CellType.FORMULA);

        cellI.setCellFormula("SUM(C2:C40)");

        wb2.write(file2);
        wb2.close();
        file2.close();

        return true;
    }

    public static void main(String[] args) throws IOException, SQLException {
        ExcelDAO ex = new ExcelDAO();
        BillDAO billDAO = new BillDAO();
        int i = 0;
        ArrayList<Bill> list = billDAO.getListBillByDay("2018-12-28", "2018-12-29");
        System.out.println(ex.InsertExcel(list,"28","29"));

    }

}
