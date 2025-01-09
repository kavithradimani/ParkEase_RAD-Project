<%-- 
    Document   : parking_area
    Created on : 11-Aug-2023, 23:31:27
    Author     : Anuranga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.List" %>
<%@ page import="classes.DBConnector" %>

<%@ page import="classes.ParkingArea" %>
<%@ page import="classes.ParkingAreaDAO" %>
<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Parking Table</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/parking_area.css">
        
    </head>
    <body>
        
        
       
        <div class="container">
            <div class="container-fluid py-3" style="background-color: #17a2b8;">
        <h1 class="text-center text-white">Select Your Parking Area</h1>
    </div>

            <div class="search-container">
                <form method="post" action="parking_area.jsp">
                    <h2 class="mb-3">Search the Location You Need</h2>
        <div class="search-container">
            <form method="post" action="parking_area.jsp">
                <div class="search-container">
                    <input type="text" class="form-control search-input" id="town" placeholder="Search by Parking Name or Town" name="town">
                    <button class="btn btn-primary search-btn" id="searchBtn" type="submit">Search</button>
                </div>
            </form>
        </div>
                </form>
            </div>
            <table class="table table-bordered">
                <thead class="table-primary">
                    <tr>
                        <th>Parking ID</th>
                        <th>Parking Name</th>
                        <th>Contact Number</th>
                        <th>Available Parking Slot</th>
                        <th>Price of a Parking Slot</th>
                        <th>Action</th>
                    </tr>

                </thead>
                <tbody>
                    <%
                        String town = request.getParameter("town");

                        if (town != null && !town.isEmpty()) {
                            Connection connection = DBConnector.getConnection();
                            ParkingAreaDAO parkingareaDAO = new ParkingAreaDAO(connection);
                            List<ParkingArea> parkingareas = parkingareaDAO.getParkingAreasByTown(town);

                            for (ParkingArea parkingarea : parkingareas) {
                    %>

                    <tr>
                        <td><%= parkingarea.getParkId()%></td>
                        <td><%= parkingarea.getParkingName()%></td>
                        <td><%= parkingarea.getContactNumber()%></td>
                        <td><%= parkingarea.getParkingSlot()%></td>
                        <td><%= parkingarea.getPrice()%></td>


                        <td><a href="parking_area_form.jsp?park_id=<%= parkingarea.getParkId()%>">Select</a></td>
                    </tr>
                    <%
                            }
                        }
                    %>

                    <!-- Add more rows here with example data -->
                </tbody>
            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
