<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.io.*, javax.servlet.http.*, javax.servlet.*, connection.*, java.sql.*" %>
    
<% 
    String login = "Logout";
    String login_address ="Login.jsp";
    String username = (String)session.getAttribute("uname");
    
    String signup = username;
    String signup_address = "profile.jsp";
    
    boolean isLogin = true;
    
    String cid = null;
    int j=0;
    
    if(session == null || username == null){
        login = "Login";
        login_address = "Login.jsp";    
        signup="Sign Up";
        signup_address = "register3.jsp"; 
        isLogin = false;
    }else{
        if(session.getAttribute("logintype").equals("teachers")){
            signup_address = "teacher_profile.jsp";
        }
        else if (session.getAttribute("logintype").equals("students")){
            signup_address = "profile.jsp";
        }
    }
    String[] enroll_course = new String[20];
    if(isLogin){
        Connection con2 = conn.getCon();
        String query_for_Enrolled_courses = "select C_id from enroll where S_id like ?;";
        PreparedStatement ps_ec = con2.prepareStatement(query_for_Enrolled_courses);
        ps_ec.setString(1, username);
        ResultSet rs2 = ps_ec.executeQuery();
        int i=0;
        while(rs2.next()){
            enroll_course[i] = rs2.getString("C_id");
            i++;
        }
        j =i;
        
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Course</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type ="text/css" href="css1.css">
    <link rel="stylesheet" type ="text/css" href="css3.css">
    <link rel="stylesheet" type ="text/css" href="footer2.css">
    <style type="text/css">
    	.news-block{
            display: block;
            box-shadow: 2px 1px 10px 2px rgba(0,0,0,0.58);
            /*border:solid;
            border-color: green;
            */background-color: linen;
            height: 280px;
            margin-left: 10%;
            margin-right: 10%;
            position: relative;
            max-width: 85%;
            overflow-y:scroll; 
    	}
        
        .enrollButton{
            position: absolute;
            right:    10px;
            bottom:   0;
            width: 100px;
            height: 50px;
            position: relative;
            margin-left: 80%
        }
        button{
            background-image: linear-gradient(-180deg, #83CD2B 0%, #7EC826 100%);
            box-shadow: -1px 2px 4px 0px rgba(0,0,0,0.16), inset 0px -2px 7px 0px rgba(0,0,0,0.1), inset 0px 2px 0px 0px rgba(255, 255, 255, 0.3);
            border-radius: 5px;
            background-color: #83CD2B;
            text-shadow: 0px 1px 2px rgba(0,0,0,0.24);
            border:1px solid #63A614;
            width: 80px;
            height: 30px;
            color: white;
            position: relative;
        }
        
    </style>
    <script>
        
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
    <span id="message6"></span>
    <p style="font-size: 40px;font-family: sans-serif;text-align: center; background-color: #ccc;">Computer Science Courses</p>
    
    
    
    <% 
        //out.print("value of i ="+j+"<br>");
        //out.print("value of enrolled[0] ="+enroll_course[0]+"<br>");
        //out.print("value of enrolled[1] ="+enroll_course[1]+"<br>");
        //out.print("value of i ="+j+"<br>");

        String department = request.getParameter("dept");
//        out.print(department);
        Connection con = conn.getCon();
        String query = "select C_id,C_name,C_material from courses where D_id IN(select D_id from department where D_name like ?);";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, department);
        ResultSet rs = ps.executeQuery();
        String cname,cmaterial;
        while(rs.next()){
//            int i=0;
            cid = rs.getString("C_id");
            cname = rs.getString("C_name");
            cmaterial = rs.getString("C_material");
//            String enroll_message = "Enroll";
//            while(i<j){
//                if(cid.equals(enroll_course[i])){
//                    enroll_message = "UnEnroll";
//                    break;
//                }
//                i++;
//            }
        
    %>
    
    <div class ="news-block">
        <a href="content.jsp?course=<%out.print(cname);%>&cid=<% out.print(cid); %>&same=false&enroll=false " style="text-align: center; ">
            <img src=" <% out.print("images\\"+cname.toLowerCase().replaceAll(" ","")+".jpg"); %> " width="40%" height="98%" align="left" style="margin:2px;">
    	<div ><br>
            <h1><% out.print(cname.toUpperCase()); %></h1>
            </a>	
            <i><p style="font-size: 20px;font-family: \"Open Sans\",sans-serif; margin-left: 40%"><% out.print(cmaterial); %></p></i>
    	</div>
<!--        <div class="enrollButton">
            <form>
                <button id="enrollbutton" onclick="" ><% //out.print(enroll_message); %></button>
            </form>
        </div>-->
    </div>
        
    <br><br><br>
    <%
        }
    %>
    
<!--    <div class ="news-block">
    	<a href="#" style="text-align: center; ">
        <img src="images\hcj.jpg" width="40%" height="98%" align="left" style="margin:2px;">
    	<div ><br>
    	   <h1>Web Development</h1>
           </a>
            <i><p style="font-size: 20px;font-style: sans-serif;">Web development is a broad term for the work involved in developing a web site for the Internet (World Wide Web) or an intranet (a private network)......</p></i>
        </div>		
    </div>
    <br><br><br>
    <div class ="news-block">
    	<a href="#" style="text-align: center; ">
        <img src="images\dbms.jpg" width="40%" height="98%" align="left" style="margin:2px;">
    	<div ><br>
           <h1>Database Management System</h1>
            </a>
            <i><p style="font-size: 20px;font-style: sans-serif;">A database management system (DBMS) is system software for creating and managing databases. The DBMS provides users and programmers with a systematic way to create, retrieve, update and manage data....</p></i>
        </div>
    </div>-->
<br>
<br>
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