<%-- 
  
    Author     : KAVITHRA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="classes.DBConnector"%>
<%@page import="admin.classes.UserDAO" %>

<%
    String userName = request.getParameter("userName");
    String vehicleNumber = request.getParameter("vehicleNumber");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");
    
    UserDAO userDAO = new UserDAO();
    userDAO.deleteUser(userName, vehicleNumber, email, phoneNumber);
%>


