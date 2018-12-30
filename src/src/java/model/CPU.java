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
public class CPU {
    private long CPUID;
    private String CPU;

    public CPU() {
    }

    public CPU(long CPUID, String CPU) {
        this.CPUID = CPUID;
        this.CPU = CPU;
    }

    public long getCPUID() {
        return CPUID;
    }

    public void setCPUID(long CPUID) {
        this.CPUID = CPUID;
    }

    public String getCPU() {
        return CPU;
    }

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    
}
