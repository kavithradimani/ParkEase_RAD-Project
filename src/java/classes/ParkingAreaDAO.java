/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anuranga
 */
public class ParkingAreaDAO {
    
    private Connection connection;
    private String town;
    
    public ParkingAreaDAO(Connection connection) {
        this.connection = connection;
    }
    public List<ParkingArea> getParkingAreasByTown(String town) {
        List<ParkingArea> parkingareas = new ArrayList<>();
        String query = "SELECT * FROM parking_area WHERE town = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, town);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String park_id = resultSet.getString("park_id");
                String park_name = resultSet.getString("park_name");
                String contact_number = resultSet.getString("contact_number");
                int available_slot = resultSet.getInt("available_slot");
                double price_of_a_slot = resultSet.getDouble("price_of_a_slot");
                
                
                parkingareas.add(new ParkingArea(park_id,park_name, contact_number, available_slot,price_of_a_slot));
            }
        } catch (SQLException e) {
        }

        return parkingareas;
    }
    
    public ParkingArea getParkingAreaById(String park_id) {
        String query = "SELECT * FROM parking_area WHERE park_id = ?";
        ParkingArea parkingarea = null;

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, park_id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                
                String park_name = resultSet.getString("park_name");
                String contact_number = resultSet.getString("contact_number");
                int available_slot = resultSet.getInt("available_slot");
                double price_of_a_slot = resultSet.getDouble("price_of_a_slot");
                
                
                parkingarea = new ParkingArea(park_id,park_name, contact_number, available_slot,price_of_a_slot);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return parkingarea;
    }
    
    
}
