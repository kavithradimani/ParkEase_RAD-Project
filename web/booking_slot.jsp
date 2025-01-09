<%-- 
    Document   : booking_slot
    Created on : 12-Aug-2023, 12:41:46
    Author     : Anuranga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="classes.ParkingSlot" %>
<%@ page import="classes.ParkingSlotDAO" %>
<%@ page import="classes.DBConnector" %>
<!DOCTYPE html>



<html>
<head>
    <title>Reservation Result</title>
    
    <style>
        .message-card {
            border: 1px solid #ddd;
            padding: 20px;
            background-color: #f5f5f5;
            border-radius: 5px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
            margin: 20px auto;
            max-width: 400px;
            text-align: center;
        }

        .success {
            color: #28a745;
        }

        .error {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <%
        String park_slot_id = request.getParameter("park_slot_id");
        String vehicle_number = request.getParameter("vehicle_number");
        String park_id = request.getParameter("park_id");
        String availability = "Reserved";
        String reserved_date_time = request.getParameter("reserved_date_time");

        ParkingSlot parkingslot = new ParkingSlot(park_slot_id, vehicle_number, park_id, availability, reserved_date_time);
        DBConnector connectionProvider = new DBConnector();
        ParkingSlotDAO parkingslotDAO = new ParkingSlotDAO(connectionProvider);

        boolean success = false;

        try {
            parkingslotDAO.updateParkingSlot(parkingslot);
            success = true; // Reservation was successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>

    <div>
        <div class="message-card <%= success ? "success" : "error" %>">
        <p><%= success ? "Reservation successful. Your parking slot has been reserved." : "Error occurred while reserving parking slot." %></p>
        <a href="javascript:history.back()">Go back</a>
    </div>
    </div>
</body>
</html>