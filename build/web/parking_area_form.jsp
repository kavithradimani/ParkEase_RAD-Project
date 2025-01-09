<%-- 
    Document   : parking_area_form
    Created on : 12-Aug-2023, 10:06:16
    Author     : Anuranga
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="classes.DBConnector" %>

<%@ page import="classes.ParkingArea" %>
<%@ page import="classes.ParkingAreaDAO" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reserved Parking Slot</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/parking_area_form.css">

    </head>

    <%
        String parkingId = request.getParameter("park_id");

        Connection connection = DBConnector.getConnection();
        ParkingAreaDAO parkingareaDAO = new ParkingAreaDAO(connection);
        ParkingArea parkingarea = parkingareaDAO.getParkingAreaById(parkingId);


    %>
    <body>
        <div class="header">
        <h1>Reserved Your Parking Slot</h1>
    </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="section">
                        <h2 class="section-title">Reserved Parking Slot</h2>
                        <p>
                            <label class="highlight-label">Display Parking ID:</label><span class="highlight-value">    <%=   parkingarea.getParkId()%></span><br>
                            <label class="highlight-label">Parking Name:</label><span class="highlight-value">      <%= parkingarea.getParkingName()%></span><br>
                            <label class="highlight-label">Available Parking Slot:</label><span class="highlight-value">     <%= parkingarea.getParkingSlot()%></span><br>
                            <label class="highlight-label">Price of a Slot:</label><span class="highlight-value">     <%= parkingarea.getPrice()%></span>
                        </p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="section">
                        <h2 class="section-title">Reserve a Parking Slot</h2>
                        <form action="booking_slot.jsp" method="POST">
                            <div class="form-group">
                                <label for="parkingSlot">Select Parking Slot</label>
                                <input type="hidden" id="park_id" name="park_id" value="<%= parkingarea.getParkId()%>">
                                <select class="form-control " id="parkingSlot" name="park_slot_id">

                                    <%
                                        Connection con = null;
                                        Statement stmt = null;
                                        ResultSet rs = null;

                                        con = DBConnector.getConnection();
                                        stmt = con.createStatement();

                                        String query = "SELECT park_slot_id FROM parking_slot WHERE park_id = '" + parkingarea.getParkId() + "'AND availability = 'Available'";
                                        rs = stmt.executeQuery(query);

                                        while (rs.next()) {
                                            String optionName = rs.getString("park_slot_id");
                                    %>

                                    <option value="<%= optionName%>"><%= optionName%></option>

                                    <%
                                        }
                                    %>
                                    <!-- Add more options as needed -->
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="vehicleNumber">Enter Vehicle Number</label>
                                <input type="text" class="form-control" id="vehicleNumber" name="vehicle_number">
                            </div>
                            <div class="form-group">
                                <label for="reservedDateTime">Enter Reserved Date and Time</label>
                                <input type="datetime-local" class="form-control" id="reservedDateTime" name="reserved_date_time">
                            </div>

                              

                            <button type="submit" class="btn btn-primary">Reserve</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                                    <div class="footer">
        <p>&copy; 2023 ParkEase. All rights reserved.</p>
    </div>
    </body>
</html>

