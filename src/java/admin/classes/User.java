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
public class User {
    
    private String userName;
    private String vehicleNumber;
    private String email;
    private String phoneNumber;

  
    public User(String userName, String vehicleNumber, String email, String phoneNumber) {
        this.userName = userName;
        this.vehicleNumber = vehicleNumber;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
