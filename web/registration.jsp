<%-- 
    Document   : registration
    Created on : 11-Aug-2023, 19:08:37
    Author     : Anuranga
--%>

<%@page import="classes.MD5"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.DBConnector"%>
<%@page import="classes.User"%>
<%
    String useremail = request.getParameter("useremail");
    String vehiclenumber = request.getParameter("vehiclenumber");
    String password = request.getParameter("password");
    String phonenumber = request.getParameter("phonenumber");
    String userrole = "customer";
    String hashText = MD5.getMd5(password);
    
    String full_name = request.getParameter("full_name");
    
    
    
    

    User user = new User(useremail,vehiclenumber,hashText,phonenumber,userrole,full_name);
    if (user.register(DBConnector.getConnection())) {
        response.sendRedirect("sing_up.jsp?status=1");
    } else {
        response.sendRedirect("sing_up.jsp?status=0");
    }
%>
