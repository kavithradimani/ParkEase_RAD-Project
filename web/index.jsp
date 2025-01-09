<%-- 
    Document   : loging
    Created on : 11-Aug-2023, 17:27:33
    Author     : Anuranga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String message = "";
    if (request.getParameter("status") != null) {
        int status = Integer.parseInt(request.getParameter("status"));
        if (status == 0) {
            message = "<h5 style='color: red;'>Your username and password are incorrect.</h5>";
        }

    }
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Login</title>
        <link rel="stylesheet" href="style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="full">
            <div class="title-text">

            </div>


            <div class="login">
                <div class="log">Login</div>
                <%=message%>
                <div class="slider-tab"></div>
                <div class="form-inner">
                    <form action="login.jsp" method="POST" class="login">
                        <div class="field">
                            <label>User Email</label>
                            <input type="text" name="useremail" placeholder="username@gmail.com" required>
                        </div>
                        <div class="field">
                            <label>Password</label>
                            <input type="password" name="password" placeholder="Password" required>
                        </div><br/> 
                        <div class="field btn">
                            <div class="btn-layer"></div>
                            <input type="submit" value="Login">
                        </div><br/>
                        <div class="clickhear">
                            Forgot Password? <a class="cli" href="">Click Here</a>
                        </div>
                        <div class="Register">
                            Don't have an account yet? <a class="reg" href="sing_up.jsp">Register</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

