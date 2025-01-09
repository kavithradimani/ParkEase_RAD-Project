<%-- 
    Author     : KAVITHRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="classes.DBConnector"%>
<%@page import="admin.classes.User" %>
<%@page import="admin.classes.UserDAO" %>


<%
    String userName = request.getParameter("userName");
    String vehicleNumber = request.getParameter("vehicleNumber");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");

    try {
        Connection connection = DBConnector.getConnection();
        PreparedStatement statement = connection.prepareStatement("UPDATE User SET vehicle_number = ?, user_email = ?, phone_number = ? WHERE full_name = ?");
        statement.setString(1, vehicleNumber);
        statement.setString(2, email);
        statement.setString(3, phoneNumber);
        statement.setString(4, userName);
        statement.executeUpdate();

        statement.close();
        connection.close();
        response.setStatus(HttpServletResponse.SC_OK); 
    } catch (SQLException e) {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
    }
%>

