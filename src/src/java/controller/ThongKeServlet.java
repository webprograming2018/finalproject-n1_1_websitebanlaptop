/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.BillDAO;
import DAO.ExcelDAO;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
public class ThongKeServlet extends HttpServlet {

    BillDAO billDAO = new BillDAO();
    ExcelDAO exDAO = new ExcelDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //excel
        
        
        //
        String command = request.getParameter("command");
        String daystart = request.getParameter("daystart");
        String dayend = request.getParameter("dayend");
        HttpSession session = request.getSession();
          if (dayend == "") {
            dayend = "2100-12-28";
        }
        else  if (daystart == "") {
            daystart = "1900-12-28";
        }
        String url = "";
        try {

            switch (command) {
                case "thongke":
                    ArrayList<Bill> list = new ArrayList<>();
                    list = billDAO.getListBillByDay(daystart, dayend);
                    exDAO.InsertExcel(list, daystart, dayend);
                    session.setAttribute("list", list);
                    url = "/admin/thongke_bill.jsp";
                    break;

            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerLaptopServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        RequestDispatcher rs = getServletContext().getRequestDispatcher(url);
        rs.forward(request, response);

    }

}
