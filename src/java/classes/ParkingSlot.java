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
public class ParkingSlot {
    
    private String park_slot_id;
    private String vehicle_number;
    private String park_id;
    private String availability;
    private String reserved_date_time;
    private int price_of_a_slot;
    
    public ParkingSlot( String park_slot_id,String vehicle_number, String park_id,String availability,String reserved_date_time) {
        this.park_slot_id = park_slot_id;
        this.vehicle_number= vehicle_number;
        this.park_id = park_id;
        this.availability= availability;
        this.reserved_date_time= reserved_date_time;
//        this.price_of_a_slot= price_of_a_slot;
    }
    
      // Getter methods
    public String getParkSlotId() {
        return park_slot_id;
    }

    public String getVehicleNumber() {
        return vehicle_number;
    }

    public String getParkId() {
        return park_id;
    }

    public String getAvailability() {
        return availability;
    }

    public String getReservedDateTime() {
        return reserved_date_time;
    }

    public int getPriceOfASlot() {
        return price_of_a_slot;
    }

    // Setter methods
    public void setParkSlotId(String park_slot_id) {
        this.park_slot_id = park_slot_id;
    }

    public void setVehicleNumber(String vehicle_number) {
        this.vehicle_number = vehicle_number;
    }

    public void setParkId(String park_id) {
        this.park_id = park_id;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }

    public void setReservedDateTime(String reserved_date_time) {
        this.reserved_date_time = reserved_date_time;
    }

    public void setPriceOfASlot(int price_of_a_slot) {
        this.price_of_a_slot = price_of_a_slot;
    }
    
    
    
}
