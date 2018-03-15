<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type ="text/css" href="css3.css">
    <link rel="stylesheet" type ="text/css" href="css4.css">
    
    <script>
        function fieldSelected(id){
            //document.getElementById("fname").style.background = "lightblue";
            //var textFields = document.getElementsByTagName("input");
            var textFields = document.getElementById(id);
            textFields.style.backgroundColor="lightblue";
            /*for(var i=0; i < textFields.length; i++){
                if((textFields[i].type == "text" || textFields[i].type == "email" )&& textFields[i].value == "" )
                {
                    textFields[i].style.backgroundColor = "aquamarine";
                }
                else {
                    textFields[i].style.backgroundColor = "greenyellow";
                }
            }*/
        }
        function fieldUnselected(id){
            //document.getElementById("fname").style.background = "lightblue";
            var textFields = document.getElementById(id);
            textFields.style.backgroundColor="";

            /*
            for(var i=0; i < textFields.length; i++){
                if((textFields[i].type == "text" || textFields[i].type == "email" )&& textFields[i].value == "" )
                {
                    textFields[i].style.backgroundColor = "";
                }
                else {
                    textFields[i].style.backgroundColor = "";
                }
            }*/
        }
        
        function zoomIntext(id){
            document.getElementById(id).style.fontSize = "30px";
        }
        function zoomOuttext(id){
            document.getElementById(id).style.fontSize = "20px";
        }
//        function checkFields(){
//            var textFields = document.getElementsByTagName("input");
//            for (var i=0; i < textFields.length; i++) {
//                if(textFields[i].value == ""){
//
//                    Empty();
//                    return false;
//                }
//            } 
//            return true;
//        }    
        
        function verifyPassword(id){
            var x = document.getElementById(id).value;
            if(x.length < 8){
                document.getElementById("message1").innerHTML = "password is too short";
                return false;
            }
            else if(x.length >20){
                document.getElementById("message1").innerHTML = "password is too long";
                return false;
            }

                document.getElementById("message1").innerHTML= "valid Password";
                return true;
        }
        function checkPassword(){
            var x = document.getElementById("psw").value;
            var y = document.getElementById("cpsw").value;
            if(x!=y){
                document.getElementById("message2").innerHTML = "Passwords don't match";
                return false;   
            }
            document.getElementById("message2").innerHTML = "Passwords matched";
                return true;
            return false;
        }
        function Empty() {
            if(document.getElementById("fname").value ==""){
                alert("Empty Field/s! Fname");
                return false;
            }
            if(document.getElementById("lname").value =="")
            {
                alert("Empty Field/s! lname");
                return false;
            }
            if(document.getElementById("id").value ==""){
                alert("Empty Field/s! ID");
                return false;
            }
            if(document.getElementById("psw").value ==""){
                
            alert("Empty Field/s! pass");
            return false;
            }
            if(document.getElementById("cpsw").value ==""){
                
            alert("Empty Field/s! cpass");
            return false;
            }
            if(document.getElementById("phone").value ==""){
                
            alert("Empty Field/s! phone");
            return false;
            }
            if(document.getElementById("email").value ==""){
                
            alert("Empty Field/s! email");
            return false;
            }
            
            return true;
        }
        function checkname(id){
            var namepattern = /^[a-zA-Z\s]+$/;
            var z = document.getElementById(id).value;
            if (!namepattern.test(z)) {
                 document.getElementById("message3").innerHTML= "Only alphabats are allowed";
//                 z="";
                return false;
            }
             document.getElementById("message3").innerHTML= "Name valid";
            return true;
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

        function validateEmailAdd(id){

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
        
        function checkID(){
            
            var x = document.getElementById("Id").value;
            if(x=="" || x == null){
                alert("Invalid Id");
                return false;
            }
            
            return true;
        }
        
        function checkForm(){
//                document.getElementById("message5").innerHTML("Check Form");
            var x1,x2,x3,x4,x5,x6;
            
            if(checkname("fname") === false){
                alert("Invalid First Name");
                return false;
            }
            
            if(checkname("lname") === false){
                alert("Invalid Last Name");
                return false;
            }
            
            if(checkphone("phone") === false){
                alert("Invalid Phone number!");
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
                return false;
            }
            if(checkID() == false){
//                alert("Empty Field/s! ID");
                return false;
            }
            if(Empty() == false){
//                document.getElementById("message5").innerHTML("Inside Empty");
                return false
            }
            return true;
            
        }
    </script>
    <style type="text/css">
        
        button{
            box-shadow: 0px 2px 10px 1px rgba(0,0,0,0.2);
            margin:30px;
            padding: 20px;
            width: 160px;
            height: 60px;
        }
        input[type =text], input[type=email], input[type=password]{
            box-shadow: 0px 2px 10px 1px rgba(0,0,0,0.2);
            margin:20px;
            padding: 20px;
            overflow: hidden;
            min-width:300px;
            min-height: 20px; 
            align-items: center;
            
        }
    </style>
</head>
<body style="color: rgb(0,0,0);">
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

 <h1 id="heading" align="center" style="color: rgb(0,0,0); font-family:Calibri light, cursive, sans-serif;" onmouseover="zoomIntext(this.id)" ><b>Create your new account here</b></h1>

 <form action="registerUser2" onsubmit="return checkForm()">
     <p class="container">
         
     <h2 style="padding-left : 490px; font-family: Calibri light;">
    First name.: <input class="boxpaddng" type="text" placeholder="First name" name="fname" id="fname"  onfocus="fieldSelected(this.id)" onblur="fieldUnselected(this.id); checkname(this.id)" > 
    <span id = "message3"></span><br>

    Last name..: <input class="boxpadding" style="margin-left: 20px" type="text" placeholder="Last name" name="lname" id="lname" onfocus="fieldSelected(this.id)" onblur="fieldUnselected(this.id); checkname(this.id)" > <span id = "message3"></span><br>

    UserId........: <input class="boxpadding" type="text" placeholder="Enter your ID" name="Id" id="Id" onfocus="fieldSelected(this.id)" onblur="fieldUnselected(this.id)" ><br>

    Password...: <input class="boxpadding" type="password" placeholder="Enter Password" name="psw" id="psw" onfocus="fieldSelected(this.id)" onblur="fieldUnselected(this.id) ;verifyPassword('psw')" ><span id = "message1"></span><br>

    Re-enter.....: <input class="boxpadding" type="password" placeholder="Confirm Password" name="cpsw" id="cpsw" onfocus="fieldSelected(this.id)" onblur="fieldUnselected(this.id); checkPassword()" ><span id ="message2"></span><br> 

    Phone no...: <input class="boxpadding" type="text" placeholder="Enter your phone number" name="phone" id="phone" onfocus="fieldSelected(this.id)" onblur="fieldUnselected(this.id); checkphone(this.id)" ><span id = "message4"></span><br>

    Email Id.....: <input class="boxpadding" type="email" placeholder="Enter your e-mail Address" name="email" id="email" onfocus="fieldSelected(this.id)" onblur="fieldUnselected(this.id)" ><br> 
     </h2>
     <div style="padding-left: 600px">
     <input type="checkbox" required>  I agree 
    <span class="psw"><a href="#"><u>Terms and Conditions</u></a></span><br>
    <span id = message5></span>
    <button type="submit" >Register</button>
    <button type="reset">Reset</button><br>
    </p>
    </div>
  

 <!-- <div class="container" style="background-color:bl">
 <button type="button" class="cancelbtn">Cancel</button>
  </div>-->
</form>

</body>
</html>