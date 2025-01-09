/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Anuranga
 */
public class ParkingSlotDAO {
    
    private DBConnector connectionProvider;

    public ParkingSlotDAO(DBConnector connectionProvider) {
        this.connectionProvider = connectionProvider;
    }

    public void updateParkingSlot(ParkingSlot parkingslot) throws SQLException, Exception {
        try (Connection connection = connectionProvider.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "UPDATE parking_slot SET vehicle_number = ?, park_id = ?, availability = ?, reserved_date_time = ? WHERE park_slot_id = ?")) {
            preparedStatement.setString(1, parkingslot.getVehicleNumber());
            preparedStatement.setString(2, parkingslot.getParkId());
            preparedStatement.setString(3, parkingslot.getAvailability());
             preparedStatement.setString(4, parkingslot.getReservedDateTime());
             preparedStatement.setString(5, parkingslot.getParkSlotId());
//             preparedStatement.setInt(5, parkingslot.getPriceOfASlot());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
    
}
