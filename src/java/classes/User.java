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

/**
 *
 * @author Anuranga
 */
public class User {

    private String user_email;
    private String vehicle_number;
    private String password;
    private String phone_number;
    private String user_role;
    private String full_name;
    
    
    public User(String user_email, String password) {
        this.user_email = user_email;
        this.password = password;
    }
    
    public User(String user_email, String vehicle_number, String password, String phone_number, String user_role,String full_name) {
        this.user_email = user_email;
        this.vehicle_number = vehicle_number;
        this.password = password;
        this.phone_number = phone_number;
        this.user_role = user_role;
        this.full_name = full_name;
        
    }

    public String getUserEmail() {
        return user_email;
    }
    public String getVehicleNumberl() {
        return vehicle_number;
    }
    public String getPassword() {
        return password;
    }
    public String getPhoneNumber() {
        return phone_number;
    }
    public String UserRole() {
        return user_role;
    }
    public String getFullName() {
        return full_name;
    }
    
    
    public boolean register(Connection con) throws SQLException {
        String query = "INSERT INTO user(user_email,vehicle_number,password,phone_number,user_role,full_name) VALUES(?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, user_email);
        pstmt.setString(2, vehicle_number);
        pstmt.setString(3, password);
        pstmt.setString(4, phone_number);
        pstmt.setString(5, user_role);
        pstmt.setString(6, full_name);
        
        int a = pstmt.executeUpdate();

        return (a > 0);
    }
    
    public boolean authenticate(Connection con) throws SQLException {
        String query = "SELECT * FROM user WHERE user_email = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, user_email);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            String db_password = rs.getString("password");
            if (password.equals(db_password)) {
                
                vehicle_number = rs.getString("vehicle_number");
                phone_number = rs.getString("phone_number");
                user_role = rs.getString("user_role");
                
                
                full_name = rs.getString("full_name");
                
                
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }

    }
    
    public boolean update(Connection con) {
        return true;
    }
}
