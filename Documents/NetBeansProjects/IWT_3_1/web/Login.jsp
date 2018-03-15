<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%
    String message=" ";
    String username=null;
    if(session!=null || username !=null){
        session.invalidate();
        session=null;
        message = "You are logged out.";
        //username = (String)session.getAttribute("uname");
        //message = message +username;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>    
    <meta charset = "UTF-8">
    <link rel="stylesheet" type="text/css" href="css3.css">
        <link rel="stylesheet" type ="text/css" href="css1.css">
    <link rel="stylesheet" type ="text/css" href="footer2.css"> 
    <link rel="stylesheet" type="text/css" href="css4.css">
    
<!--    <script>
        function isLogin(){
            
        }
    </script>-->
    
    <style>
    @media (max-width:640px)
    {
        form
        {
            margin-top: 80px;
        }
    }
    @media (max-width:450px)
    {
        form
        {
            max-width: 270px;
        }
        input[type=text], input[type=password]
        {
            max-width: 200px;
        }
    }
    form {
        border: 3px solid #11a3ed;
        width: 400px;
        padding: 10px;
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
    button{
        border-style: none;
        border-radius: 20px;
        width: 150px;
        height: 40px;
        position: relative;
        font-style: italic;            
        }
    button:hover{
        box-shadow: 0px 2px 10px 1px #83CD2B;
        background-color: #83CD2B;

    }
    .imgcontainer {
        text-align: center;
        margin: 25px 0px 0px 0;
        width: 30%;
    }

    img.image {
        width: 40%;
        border-radius: 50%;
    }

    .container {
        padding: 50px;
    }

    span.psw {
        float: right;
        padding-top: 16px;
    }
    .black{
        color: black;
    }
    @media (max-width:450px)
    {
        .option
        {
            max-width: 290px;
            
        }
    }
 .option{
  background: #222222;
  display: block;
  position: absolute;
  margin-top: 37px;
  height: 60px;
  width: 420px;
  bottom: 0; left:0; right: 0; top:0;
  padding: 0;
}
.option ul li{
    float : left;
    font-size: 24px;
    list-style: none;
    margin-left: 0px;
}
ul li input[type=radio]{
}
ul li label{
 padding-left : 9px;
    z-index: 9;
  cursor: pointer;
  -webkit-transition: all 0.25s linear;
}
ul li:hover label{
	color: #11a3ed; 
}

ul li .check{
  display: block;
  position: absolute;
  border: 4px solid #AAAAAA;
  border-radius: 100%;
  height: 17px;
  width: 17px;
  top: 16px;
  left: 0px;
	z-index: 5;
	transition: border .25s linear;
	-webkit-transition: border .25s linear;
}
ul li:hover .check {
  border: 4px solid #11a3ed;
}

ul li .check::before {
  display: block;
  position: absolute;
	content: '';
  border-radius: 100%;
  height: 5px;
  width: 5px;
  top: 5px;
	left: 5px;
  margin: auto;
	transition: background 0.25s linear;
	-webkit-transition: background 0.25s linear;
}

input[type=radio]:checked ~ .check {
  border: 4px solid #0DFF92;
}

input[type=radio]:checked ~ .check::before{
  background: #0DFF92;
}

input[type=radio]:checked ~ label{
  color: #0DFF92;
}
</style>
    <script>
        
    
            function checkuname(id){
//                var lt = document.getElementById("logintype").value;
//                
//                if(lt == "students"){
//                    
                var t = document.getElementById("teacher");
                if(!t.checked) {
                    var pattern = /^[0-9]{4}[a-zA-z]{2}[0-9]{6}$/;
                    var x = document.getElementById(id).value;
                    if(!pattern.test(x)){
                        document.getElementById("message1").innerHTML="Incorrect ID";
                        return false;
                    }
                    else
                        document.getElementById("message1").innerHTML=" "
                        return true;
                    }

                }   
                
//                }
//                else
//                    return true;
//            function focus_on_teacher(){
//                document.getElementById("login_header").style.background = "red";
////                document.getElementById("form_id").style. = "red";
//                document.getElementById("header").style.background = "red";
//                alert("Working");
//            }
//            function focus_on_student(){
//                document.getElementById("login_header").style.background = "blue";
//                document.getElementById("form_id").style.border-color = "blue";
//                alert("Working Student");
//            }
    </script>
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
                <li class="header-nav-item header-nav-signup green-bg colored">
                    <a href="register3.jsp" class="nav-item-btn">
                        <span class="nav-item-btn-text">Sign Up</span>
                    </a> 
                </li>
            </ul>
        </div>
    </div>
    <div class="header-fake"></div>
    </header>
    <h3 style="color:red"><% out.println(message); %></h3><br>
<center>
    

<form action="userLogin" method="post" id="form_id">
    <h2  id="login_heading">Login</h2><br> <br> <br>
  <div class="imgcontainer">
    <img  src="images/login.png" alt="User" class="image">
  </div>

    
    <div class="option">
        <ul>
         
            <li> <input type="radio" name="logintype" id="student" value="students" onfocus="focus_on_student(); checklogintype(this.id);" onclick="setFlag()" required> <label for="student">  STUDENT </label>
             <div style="left : 38px;" class="check"></div>
  </li>
  
  <li>
      &nbsp; &nbsp; &nbsp; &nbsp;
      <input type="radio" name="logintype" id="teacher" value="teachers" checked="true" onselect="focus_on_teacher(); checklogintype(this.id);"> <label for="teacher">  TEACHER </label>
      
        <div style="left : 239px;" class="check"><div class="inside"></div></div>
  </li>
    </div>
    
    
  <div class="container" >
    <label class="black"><b>Username:</b></label><br>
    <input type="text" placeholder="Enter Username" name="uname" id="uname" onblur="checkuname(this.id);" required>
    <span style="color:black" id="message1"></span><br>

    <label class="black"><b>Password:</b></label><br>
    <input type="password" placeholder="Enter Password" name="psw" id="psw" required><br>
        
    <button type="submit">Login</button><br>
    <!--<input type="checkbox" checked="checked"> Remember me-->
  </div>
    <span class="psw" ><a href="#">Forgot password?</a></span>

<!--  <div class="container " style="background-color:bl">
    <button type="button" class="cancelbtn">Cancel</button>
  </div>-->
</form>
    <br><br><br><br><br>
<footer>
    Â© 2016 University Online Courses. All Rights Reserved<br>
    <span id="footerLinks"> 
    <a href="#">Company Information</a> 
    &nbsp;&nbsp;<a href="contactus.jsp"> Contact Us </a> 
    &nbsp;&nbsp;<a href="#">Terms & Conditions</a>
    </span>
</footer>
</body>

<script>
    
    
</script>

</html>