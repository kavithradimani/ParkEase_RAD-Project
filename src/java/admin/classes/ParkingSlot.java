/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.classes;

/**
 *
 * @author Anuranga
 */
public class ParkingSlot {
    private String slotID;
    private String vehicleType;
    private String availability;
    private String reservedData;
    
    
     public ParkingSlot(String slotID, String availability, String vehicleType, String reservedData) {
        this.slotID = slotID;
        this.availability = availability;
        this.vehicleType = vehicleType;
        this.reservedData= reservedData;
       
    }

    public String getSlotID() {
        return slotID;
    }

    public void setSlotID(String slotID) {
        this.slotID = slotID;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public String getAvailability() {
        return availability;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }

   public String getReservedData(){
       return reservedData;
   }
   
   public void setReservedData(String reservedData){
       this.reservedData= reservedData;
   }
}
