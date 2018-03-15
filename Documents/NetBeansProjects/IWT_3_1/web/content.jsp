<%@page import="javax.websocket.SendResult"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.io.*, javax.servlet.http.*, javax.servlet.*, connection.*, java.sql.*" %>
<% 
    
    String login = "Logout";
    String login_address ="Login.jsp";
    String username = (String)session.getAttribute("uname");
    String logintype = (String)session.getAttribute("logintype");
    String signup = username;
    String signup_address = "profile.jsp";
    
    boolean isLogin = true;
    
    if(session == null || username == null){
        login = "Login";
        login_address = "Login.jsp";    
        signup="Sign Up";
        signup_address = "register3.jsp"; 
        isLogin = false;
        
        
    }
    else{
        if(session.getAttribute("logintype").equals("teachers")){
            signup_address = "teacher_profile.jsp";
        }
        else if (session.getAttribute("logintype").equals("students")){
            signup_address = "profile.jsp";
        }
    }
    int i=0,j;
    String course_name= request.getParameter("course");
    String isLogin_enroll_message = "";
    String course_id = request.getParameter("cid");
    String again = request.getParameter("same");
    String isEnroll = "false";
    if(isLogin){
        
    String[] enroll_course = new String[20];
//    if(again.equals("true") && isLogin){
//        String enroll = request.getParameter("enroll");
//        if(enroll.equals("true")){
//            Connection con = conn.getCon();
//            String query = "delete from enroll where C_id=? and S_id = ?;";
//            PreparedStatement ps = con.prepareStatement(query);
//            ps.setString(1, course_id);
//            ps.setString(2, username);
//            int x = ps.executeUpdate();
//        
//        }
//        else{
//            Connection con = conn.getCon();
//            String query = "insert into enroll values(?,?)";
//            PreparedStatement ps = con.prepareStatement(query);
//            ps.setString(1, username);
//            ps.setString(2, course_id);
//            int x = ps.executeUpdate();
//            
//        }
//    }
    
    
    if(again.equals("true") && !isLogin){
        isLogin_enroll_message = "Please Login to Enroll";
    }
    }
    String enroll_message ="Enroll";
    if(isLogin && logintype.equals("students")){
        Connection con2 = conn.getCon();
        String query_for_Enrolled_courses = "select * from enroll where S_id like ? and C_id like ?;";
        PreparedStatement ps_ec = con2.prepareStatement(query_for_Enrolled_courses);
        ps_ec.setString(1, username);
        ps_ec.setString(2, course_id);
        ResultSet rs2 = ps_ec.executeQuery();
        if(rs2.next()){
//            enroll_message = "Enroll";
            if(again.equals("true")){
                
                isEnroll = "true";
                String query_for_delete = "delete from enroll where S_id like ? and C_id like ?;";
                PreparedStatement ps_de = con2.prepareStatement(query_for_delete);
                ps_de.setString(1, username);
                ps_de.setString(2, course_id);
                int x = ps_de.executeUpdate();
            }
            
        }
        else if(isEnroll.equals("false")){
//            enroll_message ="UnEnroll";
            if(again.equals("true")){
                
                isEnroll="false";
                String query_for_insert = "insert into enroll values(?,?);";
                PreparedStatement ps_in = con2.prepareStatement(query_for_insert);
                ps_in.setString(1, username);
                ps_in.setString(2, course_id);
                int x = ps_in.executeUpdate();
            }
            
        }
        String query_for_select = "select * from enroll where S_id like ? and C_id like ?;";
        PreparedStatement ps_se = con2.prepareStatement(query_for_select);
        ps_se.setString(1, username);
        ps_se.setString(2, course_id);
        ResultSet rs1 = ps_se.executeQuery();
        if(rs1.next()){
            enroll_message="UnEnroll";
        }
        else{
            enroll_message = "Enroll";
        }
    }
    else{
        isLogin_enroll_message = "Please Login To Enroll";
        if(logintype.equals("teachers")){
            isLogin_enroll_message = "A teacher is not allowed to Enroll";
        }
    }
    
    
%>

<%  
    
    if(session == null){
        response.sendRedirect("register3.jsp");
    }
//    i=0;
//    String error_message="Enroll";
//    boolean isEnroll = false ;
//    while(i<j){
//        if(enroll_course[i].equals(course_id)){
//            error_message="UnEnroll";
//            isEnroll = true;
//            break;
//        }
//    }
%>
<html>
<head>
    <title> <% out.print(""+course_name); %> </title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type ="text/css" href="css1.css">
    <link rel="stylesheet" type ="text/css" href="css3.css">
    <link rel="stylesheet" type ="text/css" href="footer2.css">
    <style type="text/css">
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
    <div>
    <p></p>
    COURSE::
    <% 
        out.print(course_name); 
        out.println(course_id); 
        out.println(username); 
        i =0;
        %><center>
    &nbsp;&nbsp;&nbsp;
    <h2> <a href="content.jsp?course=<%out.print(course_name);%>&cid=<% out.print(course_id); %>&same=true&enroll=<% out.print(isEnroll); %>"><button><% out.print(enroll_message); %></button></a>&nbsp;<% out.print(isLogin_enroll_message); %>    
    
    </h2> <iframe src="<% out.print("pdf\\"+course_name.toLowerCase().replaceAll(" ","")+".pdf"); %>" width="100%" height="700px"></iframe> </center>
    </div> 
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
