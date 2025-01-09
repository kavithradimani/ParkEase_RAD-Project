/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.classes;
import classes.DBConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author KAVITHRA
 */
public class ParkingSlotDAO {
   
       public List<ParkingSlot> getAllParkingSlots() throws ClassNotFoundException, Exception {
        List<ParkingSlot> parkingSlots = new ArrayList<>();

        try {
            Connection connection = DBConnector.getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT park_slot_id,availability, vehicle_type,vehicle_number FROM Parking_Slot");
            ResultSet resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                String slotID = resultSet.getString("park_slot_id");
                String availability = resultSet.getString("availability");
                String vehicleType = resultSet.getString("vehicle_type");
                String reservedData = resultSet.getString("vehicle_number");
                parkingSlots.add(new ParkingSlot(slotID, availability, vehicleType,reservedData));
            }
            
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return parkingSlots;
    }
    
    public void updateParkingSlot(ParkingSlot parkingSlot) throws ClassNotFoundException, Exception {
        try {
        Connection connection = DBConnector.getConnection();
        PreparedStatement statement = connection.prepareStatement("UPDATE Parking_Slot SET vehicle_type = ?, availability = ? , vehicle_number=? WHERE park_slot_id = ?");
        statement.setString(1, parkingSlot.getVehicleType());
        statement.setString(2, parkingSlot.getAvailability());
        statement.setString(3, parkingSlot.getReservedData());
        statement.setString(4, parkingSlot.getSlotID());
        
        statement.executeUpdate();
        
        statement.close();
        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    }
}
