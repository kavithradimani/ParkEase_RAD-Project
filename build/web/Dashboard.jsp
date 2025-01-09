<%-- 
    
    Author     : KAVITHRA
--%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="Dash.js"></script>

<%  
     int vehicleOwnerCount = 0;
    int inChargeOperatorCount = 0;

    try {
        Connection connection = DBConnector.getConnection();

        
        PreparedStatement vehicleOwnerStmt = connection.prepareStatement("SELECT COUNT(*) FROM user WHERE user_role = 'customer'");
        ResultSet vehicleOwnerResult = vehicleOwnerStmt.executeQuery();
        if (vehicleOwnerResult.next()) {
            vehicleOwnerCount = vehicleOwnerResult.getInt(1);
        }

       
        PreparedStatement inChargeOperatorStmt = connection.prepareStatement("SELECT COUNT(*) FROM User WHERE user_role = 'in charge operator'");
        ResultSet inChargeOperatorResult = inChargeOperatorStmt.executeQuery();
        if (inChargeOperatorResult.next()) {
            inChargeOperatorCount = inChargeOperatorResult.getInt(1);
        }

        connection.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

%>

<!DOCTYPE html>

<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="Dashboard.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/b0ede3d087.js" crossorigin="anonymous"></script>



</head>
<body>

<div id="throbber" style="display:none; min-height:120px;"></div>
<div id="noty-holder"></div>
<div id="wrapper">
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            
            <div class="heading">
                <h1>PARKEASE</h1>
             </div>
        </div>
       
        
        <!-- Sidebar Menu Items -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li>
                    <a href="Dashboard.jsp" data-toggle="collapse" data-target="#submenu-1"><i class="fas fa-tachometer-alt-average"></i></i></i> DASHBOARD </a>
                    
                </li>           
                
                <li>
                    <a href="assignParking.jsp"><i class="fa fa-fw fa-user-plus"></i> IN CHARGE OPERATOR</a>
                </li>

                <li>
                  <a href="User.jsp"><i class="fa fa-fw fa-user-plus"></i> VEHICLE OWNERS</a>
              </li>
                
              <button class="btn btn-danger" type="submit" name="logout" >LOGOUT</button>
            </ul>

           
        </div>
       
    </nav>

    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="row" id="main" >
                <div class="col-sm-12 col-md-12 well" id="content">
                    <h1>Welcome to ParkEase!</h1>
                </div>
            </div>
        </div>
    </div>

    <!--vehicle owners-->
    <div class="container bootstrap snippet">
  <div class="row">
    <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="User.jsp"><div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content dark-blue">
          <div class="circle-tile-description text-faded"> Vehicle <br> Owners</div>
          <div class="circle-tile-number text-faded "><%= vehicleOwnerCount %></div>
         
        </div>
      </div>
    </div>
     
<!--incharge operators-->
    <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="assignParking.jsp"><div class="circle-tile-heading red"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content red">
          <div class="circle-tile-description text-faded"> In Charge <br> Operators </div>
          <div class="circle-tile-number text-faded "><%= inChargeOperatorCount %></div>
         
        </div>
      </div>
    </div> 
  </div>
</div>

<!--footer-->
<footer>
    <div class="footer-content">
      <p> Copyright© ParkEase | 2023. All rights reserved.</p>
    </div>
  </footer>
</body>
</html>
