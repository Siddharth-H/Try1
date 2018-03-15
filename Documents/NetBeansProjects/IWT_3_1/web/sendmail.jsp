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
    <title>Send a message</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type ="text/css" href="css1.css">
    <link rel="stylesheet" type ="text/css" href="css3.css">
    <link rel="stylesheet" type ="text/css" href="footer.css">
    
        
        <style>
            
            
            
/*-------------------------------------------------
CONTENT CLASSES
-------------------------------------------------*/
.page-content{ width:580px; margin-left: 500px;overflow:hidden; padding-bottom:30px; padding-top:30px;}
.page-content .content h3{ padding-bottom:20px;font-family: 'Droid Serif', serif; font-weight:normal; color:#fff; font-size:16px;}
.page-content .content p{ padding-bottom:15px;}
            
 

/*-------------------------------------------------
CONTACT FORM CLASSS
-------------------------------------------------*/

.contact-form { background:#0d3d78; padding:30px; width:440px; float:left;}
.contact-form label {display: block; padding:10px 0 10px 0;}
.contact-form label span {display: block; color:#fff;font-size:20px; float:left; width:80px; text-align:left; padding:5px 20px 0 0; font-family: 'Droid Serif', serif;}
.contact-form .input_text {padding:10px 10px;width:318px;background:#07366b; border:none; color:#fff; outline:none;}

.contact-form .message{padding:10px 10px;width:318px; background:#07366b; border:none; overflow:hidden; height:150px; color:#fff; font-size:14px; outline:none;}
.contact-form .button{padding:8px;background:#1491c1; color:#ffffff; text-transform:uppercase; font-family:'Oswald', sans-serif;border:0px solid;margin-left: t50px;margin-top:20px;}

.address { float:left;width:250px; margin-left:30px; margin-top:50px;}
.address .panel { border:none; color:#1491c1;}
.address .panel .title h1 {  color:#1491c1; padding-bottom:10px;}
.address .panel .content p { color:#1491c1; font-size: 16px;}
.address .panel .content p .number{ font-size:15px;}




.rightcol{ float:left; width:100%; overflow:hidden;}
.rightcol .title{ margin-bottom:25px;}
.rightcol .button{ margin-top:0px;}
.rightcol img{ float:left; margin-right:40px;}
.rightcol .content p{ padding-bottom:30px;}
.button2 a{text-decoration:none; display:block; width:70px; height:30px; background:#1491c1; color:#ffffff; font-family:Arial, Helvetica, sans-serif; line-height:30px; text-align:center; float:left;}
.button2 a:hover{ background:#0e5295;}

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
                    <br> <br> 
       
                    
        <div class="rightcol">
	<div class="page-content">
		<div class="panel mar-bottom">
			<div class="title">
                             <div style=" font-style: inherit; font-size: 30px; font-family : initial; color: darkslategrey; margin-left: 70px;" > <b> CONTACT US DIRECTLY ! </b> </div>   <br> <br>
            </div>
      <div class="panel">
      <div class="title">
      </div>
      <div class="content">
        <form action="mailto:siddhantkhanna96@gamil.com" method="post" enctype="text/plain">
          <div class="contact-form mar-top30">
<!--            <label> <span>Name</span>
            <input type="text" class="input_text" name="name" id="name"/>
            </label>-->
            <label> <span>Email</span>
            <input type="text" class="input_text" name="person_mail" id="person_mail"/>
            </label>
            <label> <span>Subject</span>
            <input type="text" class="input_text" name="subject" id="subject"/>
            </label>
            <label> <span>Message</span>
            <!--<input type="text" class="message" name="feedback" id="feedback"/> -->
                
            <textarea class="message" name="detail" id="detail"></textarea>
            <br> <br> <br> 
            <center> <input type="submit" class="button" value="Submit" /> </center> 
            </label>
          </div>
        </form>
        <div class="address">
          <div class="panel">
            <div class="title">
              <h1>Address : </h1>
            </div>
            <div class="content">
              <p>Dept. of Computer Science, SGSITS, Indore, MP</p>
              <p><span>Phone :</span> +91 7777777777</p>
            </div>
          </div>
        </div>
        <div class="address">
        	<div class="panel marginTop">
            <div class="title">
              <h1>Or Email Us At</h1>
            </div>
            <div class="content">
                <p> <a href="mailto:info@companyname.com"> purvi.pahadiya.7@gmail.com </a><br><br> 
                    <a href="mailto:info@companyname.com">siddharthhatkar@gmail.com  </a> <br><br>
                    <a href="mailto:info@companyname.com">skhanna@gmail.com  </a> <br><br> 
                    <a href="mailto:info@companyname.com">shrutiasati@gmail.com  </a> </p>
              
            </div>
          </div>
         </div>
      </div>
    </div>   
 </div>
        </div>
        </div>
            
            
            
            
        </div>
    </body>
</html>
