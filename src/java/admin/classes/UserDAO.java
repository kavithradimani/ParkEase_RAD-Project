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
public class UserDAO {
    public List<User> getAllUsers() throws ClassNotFoundException, Exception {
        List<User> users = new ArrayList<>();

        try {
            Connection connection = DBConnector.getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT full_name, vehicle_number,user_email,phone_number FROM user");
            ResultSet resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                String username = resultSet.getString("full_name");
                String vehiclename = resultSet.getString("vehicle_number");
                 String email = resultSet.getString("user_email");
                String phonenumber = resultSet.getString("phone_number");
                users.add(new User(username, vehiclename,email,phonenumber));
            }
            
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
   

   
  public void updateUser(String userName, String vehicleNumber, String email, String phoneNumber) throws ClassNotFoundException, Exception {
        try {
            Connection connection = DBConnector.getConnection();
            PreparedStatement statement = connection.prepareStatement("UPDATE User SET vehicle_number = ?, user_email = ?, phone_number = ? WHERE full_name = ?");
            statement.setString(1, vehicleNumber);
            statement.setString(2, email);
            statement.setString(3, phoneNumber);
            statement.setString(4, userName);
            statement.executeUpdate();
            
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    
    public void deleteUser(String userName, String vehicleNumber, String email, String phoneNumber) throws ClassNotFoundException, Exception {
        try {
            Connection connection = DBConnector.getConnection();
            PreparedStatement statement = connection.prepareStatement("DELETE FROM user WHERE full_name = ? AND vehicle_number = ? AND user_email = ? AND phone_number = ?");
            statement.setString(1, userName);
            statement.setString(2, vehicleNumber);
            statement.setString(3, email);
            statement.setString(4, phoneNumber);
            statement.executeUpdate();
            
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
}

