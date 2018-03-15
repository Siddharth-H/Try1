<%-- 
    Document   : errorPage
    Created on : Apr 2, 2017, 3:53:58 PM
    Author     : Siddharth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type =text/css href="css3.css">
        <link rel="stylesheet" type="text/css" href="css4.css">
        <link rel="stylesheet" type="text/css" href="footer2.css">
        
        <title>Error</title>
        <style>
            .middle{
               width: 800px;
               height: 500px;
               color: black;
               background-color: white;
               border-style: groove;
               border-color: #3399ff;
               position: absolute;
               top:0;
               bottom: 0;
               left: 0;
               right: 0;
               margin: auto;
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
                        <li class="header-nav-item">
                            <a href="Login.jsp" class="nav-item-btn">
                            <span class="nav-item-btn-text">Login</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="header-fake"></div>
        </header>
        <div class="middle">
            <img src="images/error.jpg" style="width:800px; height: 500px ">
        
            <center><h2><a href="index.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="department2.jsp">Department</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="sendmail.jsp">Contact Us</a></h2></center>
        </div>
        <br><br><br>

    </body>
</html>
