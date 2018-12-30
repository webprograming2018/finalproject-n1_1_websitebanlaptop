/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author dangv
 */
public class BillDetail {
    private long BillDetailID;
    private long BillID;
    private long LaptopID;
    private float price;
    private int quantity;

    public BillDetail() {
    }

    public BillDetail(long BillID, long LaptopID, float price, int quantity) {
        this.BillID = BillID;
        this.LaptopID = LaptopID;
        this.price = price;
        this.quantity = quantity;
    }

    public BillDetail(long BillDetailID, long BillID, long LaptopID, float price, int quantity) {
        this.BillDetailID = BillDetailID;
        this.BillID = BillID;
        this.LaptopID = LaptopID;
        this.price = price;
        this.quantity = quantity;
    }

    public long getBillDetailID() {
        return BillDetailID;
    }

    public void setBillDetailID(long BillDetailID) {
        this.BillDetailID = BillDetailID;
    }

    public long getBillID() {
        return BillID;
    }

    public void setBillID(long BillID) {
        this.BillID = BillID;
    }

    public long getLaptopID() {
        return LaptopID;
    }

    public void setLaptopID(long LaptopID) {
        this.LaptopID = LaptopID;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    
    
}
