/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author Anuranga
 */
public class ParkingArea {
    
     private String park_id;

    private String park_name;
    private String contact_number;
    private int available_slot;
    private double price_of_a_slot;

    public ParkingArea(String park_id,String park_name, String contact_number, int available_slot, double price_of_a_slot) {
        this.park_id = park_id;
        this.park_name = park_name;
        this.contact_number = contact_number;
        this.available_slot = available_slot;
        this.price_of_a_slot = price_of_a_slot;
    }
    public String getParkId() {
        return park_id;
    }

    public String getParkingName() {
        return park_name;
    }

    public String getContactNumber() {
        return contact_number;
    }

    public int getParkingSlot() {
        return available_slot;
    }

    public double getPrice() {
        return price_of_a_slot;
    }

    
}
