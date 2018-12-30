/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import javafx.scene.input.KeyCode;



/**
 *
 * @author dangv
 */
public class Bill {
    private long BillID;
    private long UserID;
    private float total;
    private String payment;
    private String address;
    private String name;
    private String sdt;
    private Timestamp date;

    public Bill() {
    }

    public Bill(long BillID, long UserID, float total, String payment, String address, String name, String sdt, Timestamp date) {
        this.BillID = BillID;
        this.UserID = UserID;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.name = name;
        this.sdt = sdt;
        this.date = date;
    }

    public long getBillID() {
        return BillID;
    }

    public void setBillID(long BillID) {
        this.BillID = BillID;
    }

    public long getUserID() {
        return UserID;
    }

    public void setUserID(long UserID) {
        this.UserID = UserID;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public void setAddress(KeyCode keyCode) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}

