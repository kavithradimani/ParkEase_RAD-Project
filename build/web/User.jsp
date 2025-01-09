<%-- 
    Author     : KAVITHRA
--%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.DBConnector"%>
<%@page import="admin.classes.User" %>
<%@page import="admin.classes.UserDAO" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Assign In-Charge Operator</title>
   
   <script src="https://kit.fontawesome.com/b0ede3d087.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="allpagestyle.css">
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
        <h1>Welcome Admin!</h1>
    </div>
  </div>
    
  



    
 <div class="table-container" >
   <table class="table">
            <thead>
                <tr>
                    <th>Owner's Name</th>
                    <th>Vehicle Number</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
            <%
                UserDAO userDAO = new UserDAO();
                List<User> users = userDAO.getAllUsers();
                for (User user : users) {
            %>
            <tr>
                <td><%= user.getUserName() %></td>
                <td><%= user.getVehicleNumber() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getPhoneNumber() %></td>
                <td><button class="btn btn-secondary" onclick="openEditModal('<%= user.getUserName() %>', '<%= user.getVehicleNumber() %>', '<%= user.getEmail() %>', '<%= user.getPhoneNumber() %>')">Edit</button>  
                     <button class="btn btn-secondary" onclick="deleteUser('<%= user.getUserName() %>', '<%= user.getVehicleNumber() %>', '<%= user.getEmail() %>', '<%= user.getPhoneNumber() %>')">Delete</button></td>
               
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
 </div>

    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Edit User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div>
                    <label for="editUserName">Owner's Name:</label>
                    <input type="text"  class="form-control" id="editUserName">
                    </div>
                    <div class="form-group">
                        <label for="editVehicleNumber">Vehicle Number:</label>
                        <input type="text" class="form-control" id="editVehicleNumber">
                    </div>
                    <div class="form-group">
                        <label for="editEmail">Email:</label>
                        <input type="text" class="form-control" id="editEmail">
                    </div>
                    <div class="form-group">
                        <label for="editPhoneNumber">Phone Number:</label>
                        <input type="text" class="form-control" id="editPhoneNumber">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="saveUser()">Save</button>
                </div>
            </div>
        </div>
    </div>
    
    
    
<script>
    function openEditModal(userName, vehicleNumber, email, phoneNumber) {
        
        document.getElementById("editUserName").value = userName;
        document.getElementById("editVehicleNumber").value = vehicleNumber;
        document.getElementById("editEmail").value = email;
        document.getElementById("editPhoneNumber").value = phoneNumber;
        $("#editModal").modal("show");
    }
    
 

    function deleteUser(userName, vehicleNumber, email, phoneNumber) {
        if (confirm("Are you sure you want to delete this user?")) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "deleteUser.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        
                        location.reload();
                    } else {
                        
                        alert("An error occurred while deleting the user.");
                    }
                }
            };

           
           var data = "userName=" + encodeURIComponent(userName) +
                   "&vehicleNumber=" + encodeURIComponent(vehicleNumber) +
                   "&email=" + encodeURIComponent(email) +
                   "&phoneNumber=" + encodeURIComponent(phoneNumber);
        xhr.send(data);
        }
    }

    function saveUser() {
       
        var userName = document.getElementById("editUserName").value;
        var vehicleNumber = document.getElementById("editVehicleNumber").value;
        var email = document.getElementById("editEmail").value;
        var phoneNumber = document.getElementById("editPhoneNumber").value;

        
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "updateUser.jsp", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    
                    location.reload();
                } else {
                   
                    alert("An error occurred while updating user data.");
                }
                $("#editModal").modal("hide");
            }
        };

        var data = "userName=" + encodeURIComponent(userName) +
                   "&vehicleNumber=" + encodeURIComponent(vehicleNumber) +
                   "&email=" + encodeURIComponent(email) +
                   "&phoneNumber=" + encodeURIComponent(phoneNumber);
        xhr.send(data);
    }
    
     
</script>

<!--footer-->

  <div class="footer">
    <p>&copy; 2023 ParkEase. All rights reserved.</p>
  </div>
</body>
</html>