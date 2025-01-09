<%-- 
    Document   : login
    Created on : 11-Aug-2023, 19:08:10
    Author     : Anuranga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.DBConnector"%>
<%@page import="classes.User"%>
<%@page session="true" %>
<%
//    String useremail = request.getParameter("useremail");
//    String password = request.getParameter("password");
//
//    User user = new User(useremail, password);
//    if (user.authenticate(DBConnector.getConnection())) {
//        session.setAttribute("user", user);
//        response.sendRedirect("home.jsp");
//    } else {
//        response.sendRedirect("index.jsp?status=0");
//    }

    String useremail = request.getParameter("useremail");
    String password = request.getParameter("password");

    User user = new User(useremail, password); // Corrected parameter names
    if (user.authenticate(DBConnector.getConnection())) {
        session.setAttribute("user", user);
        response.sendRedirect("home.jsp");
    } else {
        String redirectURL = "index.jsp?status=0";
        System.out.println("Redirect URL: " + redirectURL); // Print the URL for debugging
        response.sendRedirect(redirectURL);
    }
%>
