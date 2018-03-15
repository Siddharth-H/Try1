<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
        if(session.getAttribute("logintype").equals("teachers")){
            signup_address = "teacher_profile.jsp";
        }
        else if (session.getAttribute("logintype").equals("students")){
            signup_address = "profile.jsp";
        }
    }
    
        
%>
<html>
<head>
    <title>Department</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type ="text/css" href="css1.css">
    <link rel="stylesheet" type ="text/css" href="css3.css">
    <link rel="stylesheet" type ="text/css" href="footer2.css">
    
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
    <!--<form method="get" onsubmit="course.jsp" >-->            
    <div style = "margin-left: 10%;">
    <p></p>
    <ul class="caption-style-1">
    <!--
        <span class="small-container" style="margin-left: 0px; margin-top: 0px; background-image: url('bio.jpg');background-size: cover">

    </span>
        <span class="small-container" style="background-image: url('chemistry.jpg');background-size: cover">

    </span>
    <span class="small-container" style="background-image: url('physics.jpg');background-size: cover" >

    </span>
    <span class="small-container" style="background-image: url('maths.jpg');background-size: cover">

    </span>
    <span class="small-container" style="background-image: url('cs.png');background-size: cover">

    </span>
    <span class="small-container" style="background-image: url('ec.jpeg');background-size: cover">

    </span>
    -->
    <li>
            <img src ="images/physics.jpg" alt>
            <div class = "caption">
                <div class = "blur"></div>
                <div class = "caption-text">
                    <h1>Applied Physics</h1>
                     <p class="quote-size"><q style="font-style: oblique">Live your life as an Exclamation rather than an Explanation
                        </q><br><strong>Issac Newton</strong></p>
            </div>

    </li>

    <li>
        <img src ="images/chemistry.jpg" alt>
        <div class = "caption">
            <div class = "blur"></div>
            <div class = "caption-text">
                <h1>Engineering Chemistry</h1>
                 <p class="quote-size"><q style="font-style: oblique">Chemistry is the study of Transformation
                        </q><br><strong></strong></p>
        </div>

    </li>
    <li>
        <img src ="images/maths.jpg" alt>
        <div class = "caption">
            <div class = "blur"></div>
            <div class = "caption-text">
                <h1>Mathematics</h1>
                <p class="quote-size"><q style="font-style: oblique">Pure mathematics is, in its way, the poetry of logical ideas
                        </q><br><strong>Albert Einstein</strong></p>
        </div>

    </li>

    <li>
        <a href="course.jsp?dept=Computer Engineering">
        <img src ="images/cs2.png" >
        <div class = "caption">
            <div class = "blur"></div>
            <div class = "caption-text">
                <h1>Computer Science</h1>
                 <p class="quote-size"><q style="font-style: oblique">Computer science is no more about computers than astronomy is about telescopes
                        </q><br><strong>Edsger Dijkstra</strong></p>
        </div>
        </a>
 
    </li>
    <li>
        <img src ="images/ec.jpeg" alt>
        <div class = "caption">
            <div class = "blur"></div>
            <div class = "caption-text">
                <h1>Electrical Engineering</h1>
                 <p class="quote-size"><q style="font-style: oblique">
                        </q><br><strong></strong></p>
        </div>

    </li>
    <li>
        <img src ="images/me.jpg" alt>
        <div class = "caption">
            <div class = "blur"></div>
            <div class = "caption-text">
                <h1>Mechanical Engineering</h1>
                 <p class="quote-size"><q style="font-style: oblique">
                        </q><br><strong></strong></p>
        </div>

    </li>
    <li>
        <img src ="images/it.jpg" alt>
        <div class = "caption">
            <div class = "blur"></div>
            <div class = "caption-text">
                <h1>Information Technology</h1>
                 <p class="quote-size"><q style="font-style: oblique">
                        </q><br><strong></strong></p>
        </div>

    </li>
    <li>
        <img src ="images/bt.jpg" alt>
        <div class = "caption">
            <div class = "blur"></div>
            <div class = "caption-text">
                <h1>Biotechnology</h1>
                 <p class="quote-size"><q style="font-style: oblique">
                        </q><br><strong></strong></p>
        </div>

    </li>
    <li>
        <img src ="images/chalkboard-wallpaper-2.jpg" alt>
        <div class = "caption">
            <div class = "blur"></div>
            <div class = "caption-text">
                <h1>More Courses</h1>
                <p class="quote-size"></p>
        </div>

    </li>
    </ul>
    </div>
        <br><br><br>
    <!--</form>-->  
<footer>
    © 2016 University Online Courses. All Rights Reserved<br>
    <span id="footerLinks"> 
    <a href="#">Company Information</a> 
    &nbsp;&nbsp;<a href="contactus.jsp"> Contact Us </a> 
    &nbsp;&nbsp;<a href="#">Terms & Conditions</a>
    </span>
</footer>
</body>
</html>
