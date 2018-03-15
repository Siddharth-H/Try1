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
    <title>Upload Assignment</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type ="text/css" href="css1.css">
    <link rel="stylesheet" type ="text/css" href="css3.css">
    <link rel="stylesheet" type ="text/css" href="slidecss.css">
    <link rel="stylesheet" type ="text/css" href="footer2.css">
    <link rel="stylesheet" type ="text/css" href="middle.css">
    
<!--    <script>
        
        var userid = se
    </script>-->

<style>
        
    form {
        border: 3px solid #11a3ed;
        width: 400px;
        padding: 50px 10px;
        position: relative;
        padding-top: 50px;
        
    }
    form > h2 {
        background: #11a3ed;
        position: absolute;
        box-sizing: border-box;
        width: 100%;
        top: -20px;
        height: 40px;
        font-family: Sans-Serif;
        padding: 5px;
        color: #FEFEFE;
        left: 0px;
        padding-bottom: 20px;
    }

    input[type=text], input[type=password] {
        width: 300px;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline;
        border: 1px solid #ccc;
        box-sizing: border-box;

    }
    button {
        background-color: #66cc00;
        color: white;
        padding: 14px 20px;
        margin: 5px 0;
        border: none;
        cursor: pointer;
        width: 40%;
    }

/*    .cancelbtn {
        width: 10%;
        padding: 10px 15px;
        background-color: red;
    }*/

    .imgcontainer {
        text-align: center;
        margin: 25px 0 0px 0;
        width: 30%;
    }

    img.image {
        width: 40%;
        border-radius: 50%;
    }

    .container {
        padding: 50px;
    }

    .black{
        color: black;
    }
    
    </style>
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
    
<center>
    <form action="uploadFile.jsp" method="post" enctype="multipart/form-data">
        <h2> Post Assignment </h2>
        
        <div class="container" >
            <label class="black"><b>Select File:</b></label><br><br><br>
        <input type="file" name="file" size="50" />
        <br><br><br>
        
        <button type="submit">Upload File</button><br>
         </div>
        </form> 
   
    
</center>
    
    
    
<footer>
    Â© 2016 University Online Courses. All Rights Reserved<br>
    <span id="footerLinks"> 
    <a href="#">Company Information</a> 
    &nbsp;&nbsp;<a href="contactus.jsp"> Contact Us </a> 
    &nbsp;&nbsp;<a href="#">Terms & Conditions</a>
    </span>
</footer>
</body>
</html>

