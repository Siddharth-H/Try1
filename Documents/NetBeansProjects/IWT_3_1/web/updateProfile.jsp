<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, javax.servlet.http.*, javax.servlet.*, connection.*, java.sql.*" %>
<% 
    String login = "Logout";
    String login_address ="Login.jsp";
    String username = (String)session.getAttribute("uname");
    String logintype = (String)session.getAttribute("logintype");
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
<%  
    String sid = (String)session.getAttribute("uname");
    Connection con = conn.getCon();
    String query_for_select=null ;
    if(logintype.equals("students"))
    query_for_select = "select pwd, phone, email from students where S_id like ?;";
    else if(logintype.equals("teachers"))
    query_for_select = "select pwd, phone, email from teachers where T_id like ?;";
    PreparedStatement ps = con.prepareStatement(query_for_select);
    ps.setString(1,sid);
    ResultSet rs = ps.executeQuery();
    String present_pwd ="",present_phone="",present_email="";
    while(rs.next()){
        
       present_pwd = rs.getString("pwd");
       present_phone = rs.getString("phone");
       present_email = rs.getString("email");
       
    }
    
%>
<html>
<head>
    <title> Update information </title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" type ="text/css" href="css1.css">
    <link rel="stylesheet" type ="text/css" href="footer2.css"> 
    <link rel="stylesheet" type ="text/css" href="css4.css">
    <link rel="stylesheet" type ="text/css" href="css3.css">
    <link rel="stylesheet" type ="text/css" href="css1.css">
    
    <style>
        
        form{
           
         border: 3px solid #11a3ed;
        width: 700px;
        padding: 10px;
        position: relative;
        padding-top: 50px;
        }
        
        input[type=text], input[type=password],input[type=email] {
    width: 40%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline;
    border: 2px solid #ccc;
    box-sizing: border-box;
    
}

span.psw {
   
    padding-top: 16px;
}
        </style>
    
    
    
    
    
    
<script>
    function validateEmailAdd(id)
    {
            var emailvalue= document.getElementById(id).value;
            var at_symbol = emailvalue.lastIndexOf("@");
            var dot_symbol = emailvalue.lastIndexOf(".");
            var space_symbol = emailvalue.lastIndexOf(" ");

            if((at_symbol!=-1) && (at_symbol!=0) && (dot_symbol !=-1)  && (dot_symbol!=0) && (dot_symbol>at_symbol+1) && (emailvalue.length>dot_symbol+1) && (space_symbol.length==-1))
                {
                    return true;
                }
            else
                alert("Please enter correct email Address");
                return false;
    }
    function verifyPassword(id)
    {
        var x = document.getElementById(id).value;
        if(x.length < 8)
        {
            document.getElementById("message1").innerHTML = "password is too short";
            return false;
        }
        else if(x.length >20)
        {
            document.getElementById("message1").innerHTML = "password is too long";
            return false;
        }
            document.getElementById("message1").innerHTML= "valid Password";
            return true;
        }
    function checkPassword()
    {
        var x = document.getElementById("psw").value;
        var y = document.getElementById("cpsw").value;
        if(x!=y)
        {
            document.getElementById("message2").innerHTML = "Passwords don't match";
            return false;   
        }
        document.getElementById("message2").innerHTML = "Passwords matched";
        return true;
        return false;
    }
    function checkphone(id){
            var numbers=/^[0-9]+$/;
            var p = document.getElementById(id).value;
            if(!numbers.test(p)){
                p="";
                document.getElementById("message4").innerHTML="Numbers only";
                return false;
            }
            if(!(p.length==10))
            {
                document.getElementById("message4").innerHTML="Must be of 10 digits";
                return false;

            
            }
             document.getElementById("message4").innerHTML= "valid";
            return true;
        }
    function editenable(id)
    {
        document.getElementById(id).disabled=false;
    }
     function checkForm(){
//                document.getElementById("message5").innerHTML("Check Form");
            var x1,x2,x3,x4,x5,x6;
            
            
            
            if(checkphone("phone") === false){
                alert("Invalid Phone number!");
                if(document.getElementById("phone").value ===""){
                    return true;
                }
                return false;
            }
//            x4 = validateEmailAdd("email");
//            if(!x4){
////                alert("Invalid Email!");
//                return false;
//            }
            x5 = checkPassword();
            if(!x5){
                alert("Passwords dont match");
                return false;
            }
            x6 = verifyPassword("psw");
            if(!x6){
                alert("Password is not in the provided range");
//                if()
                return false;
            }
            
            return true;
            
        }
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
<center>
    <br> <br> <br>      
    <H2> UPDATE USER </H2>
    
    <form action="updateUser" onsubmit="return checkForm()" align="center">
        <p class="container"><br><br><br><br><br><br>
        Password &nbsp;
        <input type="password" name="psw" id="psw" placeholder="**********************" onblur="verifyPassword('psw')" > &nbsp;&nbsp;&nbsp 
        <!--<button  onclick="editenable('psw')"><span class="editbutton">edit</span></button>-->
        <span id = "message1"></span><br>
        
        <label>Confirm Password</label>&nbsp
        <input type="password" name="cpsw" id="cpsw" placeholder="**********************" onblur="checkPassword()" >
        <!--<button onclick="editenable('cpsw')"><span class="editbutton">edit</span></button>-->
        <span id ="message2"></span><br> 
        
        <label>Phone Number</label>&nbsp
        <input type="text" name="phone" id="phone" placeholder="<% out.print(present_phone); %>" onblur="checkphone(this.id)" >
        <!--<button onclick="editenable('phone')"><span class="editbutton">edit</span></button>-->
        <span id = "message4"></span><br>
        
        <label>Email ID</label>&nbsp
        <!--<input type="email" name="email" id="email" onblur="validateEmailAdd(this.id)">-->
        <input type="email" name="email" id="email" placeholder="<% out.print(present_email); %>" onblur="">
        <!--<button type="reset" onclick="editenable('email')"><span class="editbutton">edit</span></button><br><br><br>--> 
        <!--<button type="reset" onclick=""><span class="editbutton">edit</span></button><br><br><br>--> 
        <br><br>
<!--        <input type="checkbox" required> I agree
        <span class="psw"><a href="#"><u>Terms and Conditions</u></a></span><br>
        <span id = message5></span>-->
        <button type="submit" >Update</button>
        </p>
        </form>
        
</center><script>
//            document.getElementById("psw").disabled = f;
//            document.getElementById("cpsw").disabled = true;
//            document.getElementById("phone").disabled = true;
            document.getElementById("email").disabled = true;
        </script>
        
        
        
        <br> <br> <br> <br> <br> <br> <br> <br> <br> 
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