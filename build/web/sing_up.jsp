<%-- 
    Document   : registration
    Created on : 11-Aug-2023, 18:58:40
    Author     : Anuranga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String message = "";
    if (request.getParameter("status") != null) {
        int status = Integer.parseInt(request.getParameter("status"));
        if (status == 1) {
            message = "<h5 style='color: lightgreen;'>You have successfully registered </h5>";
        } else {
            message = "<h5 style='color: red;'>An error occurred. Please register again.</h5>";
        }
    }
%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration Form</title>
        <!-- Link Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Link your custom CSS -->
        <link rel="stylesheet" href="css/registration.css">
    </head>
    <body>
        <div class="container mt-5">
            <div class="registration-form">
                <h2>Register</h2>
                <%=message%>
                <form action="registration.jsp" method="POST">
                    <div class="form-group">
                        <label for="firstName">Full Name</label>
                        <input type="text" class="form-control" id="firstName" name="full_name" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">User Email</label>
                        <input type="email" class="form-control" id="email" name="useremail" required>
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber">Phone Number</label>
                        <input type="tel" class="form-control" id="phoneNumber" name="phonenumber" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="form-group">
                        <label for="vehicleNumber">Vehicle Number</label>
                        <input type="text" class="form-control" id="vehicleNumber" name="vehiclenumber" required>
                    </div>



                    <button type="submit" class="btn btn-primary btn-block">Register</button>
                </form>
                 <p>Already have an account? <a href="index.jsp">Sign In</a></p>
            </div>
        </div>
    </body>
</html>
