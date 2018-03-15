<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, javax.servlet.http.*, javax.servlet.*, connection.*" %>
<% 
    String login = "Logout";
    String login_address ="Login.jsp";
    String username = (String)session.getAttribute("uname");
    
    String signup = username;
    String signup_address = "profile.jsp";
    
    boolean isSession = true;
    
    if(session == null || username == null){
        login = "Login";
        login_address = "Login.jsp";    
        signup="Sign Up";
        signup_address = "register3.jsp"; 
        isSession = false;
    }
    else{
        
    }
    
        
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
<head>
    <title>Home</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type ="text/css" href="css1.css">
    <link rel="stylesheet" type ="text/css" href="css3.css">
    <link rel="stylesheet" type ="text/css" href="slidecss.css">
    <link rel="stylesheet" type ="text/css" href="footer2.css">
    <link rel="stylesheet" type ="text/css" href="footer2.css">
    <link rel="stylesheet" type ="text/css" href="middle.css">
    
<!--    <script>
        
        var userid = se
    </script>-->
<style>
    footer{
        bottom: 0;
        position: fixed;
        
    }
</style>
</head>

<body>
    <header>
    <div id = "header" class="header-v2">
        <div class ="header-row">
            <a class="header-logo" href = "index.jsp" title="Home">
                <span class="header-logo-wrapper">
                    <span class="header-logo-img"></span>
                    <span class="header-logo-text"></span>
                </span>
            </a>
            <ul class = "header-nav right">
                <li class = "header-nav-item is-active">
                    <a href="department2.jsp" class="nav-item-btn">
                        <span class = "nav-item-btn-text">Department</span>
                    </a>
                </li>
                <li class="header-nav-item" id="det_login">
                    <a href="<% out.print(login_address); %>" class="nav-item-btn">
                        <span class="nav-item-btn-text"><% out.print(login); %></span>
                    </a>
                </li>

                <li class="header-nav-item header-nav-signup green-bg colored">
                    <a href="<% out.print(signup_address); %> " class="nav-item-btn wider">
                        <span class="nav-item-btn-text"><% out.print(signup); %></span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="header-fake"></div>
    </header>

    <br><br><br><br>
    
    
    <%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt", "root", "");
statement=connection.createStatement();
String sql ="SELECT * FROM assign";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
    
String aname= resultSet.getString("aname");

%>


<center> <h2> <a href="tempview.jsp?ass=<%out.print(aname);%>" style="text-align: center; "> <%=resultSet.getString("aname") %> </center> </h2>
<% } %>
    
    
    <footer>
        
<!--    <div class="copyright-wrap"> 
    <div class="copyright">
        <div class="content">
                    Â© 2016 University Online Courses. All Rights Reserved
            <div class="bottomright">
               <li> <a href="#">Company Information    </a> </li>
               <li> <a href="contactus.jsp"> Contact us </a> </li>
               <li> <a href="#">Terms and conditions</a></li>
            </div>
    </div>
    </div>
    </div>    -->
<footer>
    Â© 2016 University Online Courses. All Rights Reserved<br>
    <span id="footerLinks"> 
    <a href="#">Company Information</a> 
    &nbsp;&nbsp;<a href="contactus.jsp"> Contact Us </a> 
    &nbsp;&nbsp;<a href="#">Terms & Conditions</a>
    </span>
</footer>
<% 


} catch (Exception e) {
e.printStackTrace();
}
%>