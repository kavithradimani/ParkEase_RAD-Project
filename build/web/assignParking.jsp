<%-- 
    Author     : KAVITHRA
--%>

<%@page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.DBConnector"%>
<%@page import="admin.classes.ParkingSlot" %>
<%@page import="admin.classes.ParkingSlotDAO" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
<head>
    <title>Assign In-Charge Operator</title>
    
 <link rel="stylesheet" type="text/css" href="allpagestyle.css">   
<script src="https://kit.fontawesome.com/b0ede3d087.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</head>
<body>
  <div class="header">
    <h1>ParkEase</h1> <a style="text-align:right;"    href="Dashboard.jsp">Dashboard</a>
  </div>
  
  <div class="container">
    <div class="col-sm-12 col-md-12 well" id="content" style="text-align: center;">
        <h1>Welcome In-Charge Operator!</h1>
    </div>
  </div>
 <div class="table-container" >
   <table class="table">
            <thead>
                <tr>
                    <th>SlotID</th>
                    <th>Vehicle Type</th>
                    <th>Availability</th>
                    <th>Assigned vehicle</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
               <% 
    ParkingSlotDAO parkingSlotDAO = new ParkingSlotDAO();
    List<ParkingSlot> parkingSlots = parkingSlotDAO.getAllParkingSlots();
    for (ParkingSlot parkingSlot : parkingSlots) {
%>
<tr>
    <td><%= parkingSlot.getSlotID() %></td>
    <td><%= parkingSlot.getVehicleType() %></td>
    <td><%= parkingSlot.getAvailability() %></td>
    <td><%= parkingSlot.getReservedData() %></td>
    <td><button class="btn btn-secondary" onclick="openEditModal('<%= parkingSlot.getSlotID() %>', '<%= parkingSlot.getVehicleType() %>', '<%= parkingSlot.getAvailability() %>','<%= parkingSlot.getReservedData() %>')">Edit</button></td>
</tr>
<%
    }
%>

            </tbody>
        </table>
        </div>

   <!-- Edit Modal for Assigning Vehicles to Parking Slots -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit Parking Slot</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="editSlotID">
                <div class="form-group">
                    <label for="vehicleTypeInput">Vehicle Type:</label>
                    <select class="form-control" id="vehicleTypeInput">
                        <option value="small">Small</option>
                        <option value="medium">Medium</option>
                        <option value="large">Large</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="availabilityInput">Availability:</label>
                    <select class="form-control" id="availabilityInput">
                        <option value="available">Available</option>
                        <option value="reserved">Reserved</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="editAssignedVehicleNumber">Assigned Vehicle Number:</label>
                    <input type="text" class="form-control" id="editAssignedVehicleNumber">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="saveParkingSlot()">Save</button>
            </div>
        </div>
    </div>
</div>


<script>
    function openEditModal(slotID, vehicleType, availability ,reservedData) {
        document.getElementById("editSlotID").value = slotID;
        document.getElementById("vehicleTypeInput").value = vehicleType;
        document.getElementById("availabilityInput").value = availability;
        document.getElementById("editAssignedVehicleNumber").value = reservedData;


        $("#editModal").modal("show");
    }

    function saveParkingSlot() {
    var slotID = document.getElementById("editSlotID").value;
    var vehicleType = document.getElementById("vehicleTypeInput").value;
    var availability = document.getElementById("availabilityInput").value;
    var reservedData = document.getElementById("editAssignedVehicleNumber").value;

   
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "updateParkingSlot.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            
            location.reload();
        }
    };
    var data = "slotID=" + encodeURIComponent(slotID) +
               "&vehicleType=" + encodeURIComponent(vehicleType) +
               "&availability=" + encodeURIComponent(availability)+
               "&reservedData=" + encodeURIComponent(reservedData);

    xhr.send(data);

    $("#editModal").modal("hide");
}

</script>

<!--footer-->

  <div class="footer">
    <p>&copy; 2023 ParkEase. All rights reserved.</p>
  </div>
</body>
</html>



