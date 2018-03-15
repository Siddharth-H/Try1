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
    <link rel="stylesheet" type ="text/css" href="middle.css">
    
<!--    <script>
        
        var userid = se
    </script>-->


    
<style>
 /* Top of home page above slideshow */
 
  #tophome {
  height: 200px;
  width: 100%;
  position: relative;
}
#image {
  position: absolute;
  left: 0;
  top: -50px;
}

#text {
    
  z-index: 100;
  position: absolute;
  color: white;
  font-family: Microsoft JhengHei Light;
  font-size: 35px;
  font-weight: bold;
  left: 300px;
  top: 5px;
}

#image:hover {
        opacity: 1;
}


/* Expert section */

.expert{
    position: relative;
    left: 150px;
}

ul{
    list-style: none;
    overflow: auto;

}
.expert li{
  position: relative;
    display: list-item;  
    float: left;
}


.expert span{
    
   color: white; 
   font: bold 24px/45px Helvetica, Sans-Serif; 
   letter-spacing: -1px;  
   background: rgb(0, 0, 0); /* fallback color */
   background: rgba(0, 0, 0, 0.7);
   padding: 10px; 
}



div.transbox {
  position: absolute;
  top : -40px;
  left : 30px;
    
  /*margin: 30px; 
  background-color: #ffffff; */
  
  opacity: 0.6;
  filter: alpha(opacity=60); /* For IE8 and earlier */
}

div.transbox p {
  margin: 15%;
  font-weight: bold;
  color: #000000;
}


/*expert section ends*/


/*maps*/

 #map {
        height: 400px;
        width: 100%;
       }
       
 
       
</style>
</head>

<body>
    
        <% 
        if(isSession == true){
           // out.println("Active Session");
        }else
       // out.println("Inactive Session");
        if(session==null){
          //  out.println(" Session Null");
        }else
       // out.println(" Session Not NUll<br>");
       // out.println("Username = "+username);
    %>
    
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
    <div id="tophome">
        <img id="image" src="images/blackboard-wallpaper.jpg"  style="width : 100%; height: 900px;" />
  <p id="text">
    Enjoy theory and lab at the same time, right here online!
  </p>
</div> 
         
         
    <br><br><br>
    
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="images/home1.jpg"  style="width:1000px;height:600px;">
  <div class="text">Information Technology</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="images/home2.jpeg" style="width:1000px;height:600px;">
  <div class="text">Microprocessor</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="images/home3.jpg" style="width:1000px;height:600px;">
  <div class="text">SGSITS</div>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
<div style="color:black">

</div>
<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex> slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 4000); // Change image every 2 seconds
}
</script>

<BR> <BR> 
       <center>
       <div style=" font-style: inherit; font-size: 30px; font-family : initial; color: darkslategrey;" > <b> EXPERTS' COMMENTS ! </b> </div>   <br> <br> 
       </center> 
<div class="expert">
    
    <ul>
    <li>
       
        <img src="images/chat.jpg" height="200px;" width="400px;" /><br> <br>
          <div style="float:left;">
        &nbsp;&nbsp; &nbsp; &nbsp; <img src="images/damsir.jpg" style="height: 80px; width: 80px;" />
        
        </div>
        <div class="transbox">

         <p> <strong style="font-size: 35px; "> " </strong> This is a truly excellent collection of resources and <br> highly recommended.<br> Keep up the good work!  <strong style="font-size: 35px; "> " </strong>  </p>
  </div>
    
   <h3>&nbsp;&nbsp;  Prof. D.A. Mehta </h3>
   &nbsp; &nbsp; Dept. of Computer Engineering<br> &nbsp;&nbsp;&nbsp;&nbsp;SGSITS, Indore 


    </li>
   
    <li>
       
        <img src="images/chat.jpg" height="200px;" width="400px;" /><br> <br>
          <div style="float:left;">
        &nbsp;&nbsp; &nbsp; &nbsp; <img src="images/lvsir.jpg" style="height: 80px; width: 80px;" />
        
        </div>
        
        <div class="transbox">
            <p> <strong style="font-size: 35px; "> " </strong> Students will find it accessible, relevant and easily digestible. I always prefer this for assignments.<strong style="font-size: 35px; "> " </strong>  </p>
   
  </div>
    
   <h3>&nbsp;&nbsp;  Prof. Lokendra Vishwakarma </h3>
   &nbsp; &nbsp; Dept. of Computer Engineering<br> &nbsp;&nbsp;&nbsp;&nbsp;SGSITS, Indore 


    </li>
    
    <li>
       
        <img src="images/chat.jpg" height="200px;" width="400px;" /><br> <br>
          <div style="float:left;">
        &nbsp;&nbsp; &nbsp; &nbsp; <img src="images/rksir.jpg" style="height: 80px; width: 80px;" />
        
        </div>
        
        <div class="transbox">
            <p> <strong style="font-size: 35px; "> " </strong> It's amazing to have a website of our college providing the online interaction and the Best Self-Learning content.<strong style="font-size: 35px; "> " </strong>  </p>

  </div>
    
   <h3>&nbsp;&nbsp; &nbsp; &nbsp;  Prof. Rakesh Saxena </h3>
   &nbsp;&nbsp; &nbsp; &nbsp; Director<br>   &nbsp; &nbsp; &nbsp;&nbsp; SGSITS, Indore 


    </li>
    
</ul>
</div>
   
<br> <br> <br><br> <br> <br> <br>

<center>
    <div style=" font-style: inherit; font-size: 40px; font-family : initial; color: darkslategrey;" > <b> VISIT US HERE ! </b> </div>   <br> <br> 
</center>
   
   <div id="map">
       
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdJu7k7ahOJjiQf5oZ260t8aTc68H4QZg&callback=initMap">
    </script>
   
    </div>
    <script>
      function initMap() {
        var uluru = {lat: 22.725263, lng: 75.871365};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    
    
    
    <br> <br> <br> <br> 





    <footer>
    Â© 2016 University Online Courses. All Rights Reserved<br>
    <span id="footerLinks"> 
        <a href="contactus.jsp">University Information</a> 
    &nbsp;&nbsp;<a href="sendmail.jsp"> Contact Us </a> 
    &nbsp;&nbsp;<a href="#">Terms & Conditions</a>
    </span>
</footer>
</body>
</html>
