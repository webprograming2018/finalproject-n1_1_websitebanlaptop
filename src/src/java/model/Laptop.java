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
public class Laptop {
    private long LaptopID;
    private long CPUID;
    private String Tenlap;
    private float Gia;
    private String CPU;
    private String RAM;
    private String HDD;
    private String Manhinh;
    private String VGA;
    private String HDH;
    private String IMG;
    private String IMG2;
    private String IMG3;
    private String IMG4;
    private String Mota;
    private String Mota2;

    public Laptop() {
    }

    public Laptop(long LaptopID, long CPUID, String Tenlap, float Gia, String CPU, String RAM, String HDD, String Manhinh, String VGA, String HDH, String IMG, String IMG2, String IMG3, String IMG4, String Mota, String Mota2) {
        this.LaptopID = LaptopID;
        this.CPUID = CPUID;
        this.Tenlap = Tenlap;
        this.Gia = Gia;
        this.CPU = CPU;
        this.RAM = RAM;
        this.HDD = HDD;
        this.Manhinh = Manhinh;
        this.VGA = VGA;
        this.HDH = HDH;
        this.IMG = IMG;
        this.IMG2 = IMG2;
        this.IMG3 = IMG3;
        this.IMG4 = IMG4;
        this.Mota = Mota;
        this.Mota2 = Mota2;
    }

    public long getLaptopID() {
        return LaptopID;
    }

    public void setLaptopID(long LaptopID) {
        this.LaptopID = LaptopID;
    }

    public long getCPUID() {
        return CPUID;
    }

    public void setCPUID(long CPUID) {
        this.CPUID = CPUID;
    }

    public String getTenlap() {
        return Tenlap;
    }

    public void setTenlap(String Tenlap) {
        this.Tenlap = Tenlap;
    }

    public float getGia() {
        return Gia;
    }

    public void setGia(float Gia) {
        this.Gia = Gia;
    }

    public String getCPU() {
        return CPU;
    }

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    public String getRAM() {
        return RAM;
    }

    public void setRAM(String RAM) {
        this.RAM = RAM;
    }

    public String getHDD() {
        return HDD;
    }

    public void setHDD(String HDD) {
        this.HDD = HDD;
    }

    public String getManhinh() {
        return Manhinh;
    }

    public void setManhinh(String Manhinh) {
        this.Manhinh = Manhinh;
    }

    public String getVGA() {
        return VGA;
    }

    public void setVGA(String VGA) {
        this.VGA = VGA;
    }

    public String getHDH() {
        return HDH;
    }

    public void setHDH(String HDH) {
        this.HDH = HDH;
    }

    public String getIMG() {
        return IMG;
    }

    public void setIMG(String IMG) {
        this.IMG = IMG;
    }

    public String getIMG2() {
        return IMG2;
    }

    public void setIMG2(String IMG2) {
        this.IMG2 = IMG2;
    }

    public String getIMG3() {
        return IMG3;
    }

    public void setIMG3(String IMG3) {
        this.IMG3 = IMG3;
    }

    public String getIMG4() {
        return IMG4;
    }

    public void setIMG4(String IMG4) {
        this.IMG4 = IMG4;
    }

    public String getMota() {
        return Mota;
    }

    public void setMota(String Mota) {
        this.Mota = Mota;
    }

    public String getMota2() {
        return Mota2;
    }

    public void setMota2(String Mota2) {
        this.Mota2 = Mota2;
    }

 
}