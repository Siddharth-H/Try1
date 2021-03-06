<%-- 
    Document   : profile.jsp
    Created on : Apr 3, 2017, 8:42:23 AM
    Author     : Siddharth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, javax.servlet.http.*, javax.servlet.*, connection.*, java.sql.*" %>
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
<html>
<head>
    <title>Profile</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type ="text/css" href="css1.css">
    <link rel="stylesheet" type ="text/css" href="footer2.css">
    <link rel="stylesheet" type ="text/css" href="css3.css">
    <link rel="stylesheet" type ="text/css" href="css4.css">
    
    <style>
        table{
            position: relative;
        /*}*/
/*        table, th, td {*/
            background-color: #FEFEFE;
            border: 2px solid #11A3ED;
            border-collapse: inherit;
            border-left-width: 10px;
            border-right-width: 10px;
            border-radius: 40px;
            height: 200px;
            /*width: 100px;*/
            text-align: center;
            font-size: large;
            border-spacing: 20px;
        }
        table:hover{
            border-color: #83CD2B;
        }
/*        th, td {
            padding: 5px;
            text-align: left;
            margin: 10px;
        }*/
        body{
            font-family: "Open Sans", sans-serif;
            
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
        div > h1{
            color: black;
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
    <%
       String u_id = session.getAttribute("uname").toString();
       String u_name = null;
       String u_phone =null;
       String u_email = null;
       Connection con = conn.getCon();
       String query = "select * from students where S_id = ?";
       try{
       PreparedStatement ps = con.prepareStatement(query);
       ps.setString(1, u_id);
       ResultSet rs = ps.executeQuery();
       
       if(rs.next()){
           u_name = rs.getString("S_name");
           u_phone = rs.getString("phone");
           u_email = rs.getString("email");
       }
       }catch(Exception e){
           out.println("Exception =>"+e );
       }
       
    %>    
    <center>
        <div class="box">
        <h1><strong>USER DATA</strong></h1><br>
        <table style="width:100%">
            <tr>
                <th>User ID</th>
                <td><% out.print(u_id); %></td>
            </tr>
            <tr>
                <th>User Name</th>
                <td><% out.print(u_name); %></td>
            </tr>
            <tr>
                <th>Phone No.</th>
                <td><% out.print(u_phone); %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><% out.print(u_email); %></td>
            </tr>

        </table>
            <a href="updateProfile.jsp"><button id="update"><strong>Update Profile</strong></button></a>
        </div>
    </center>
    <br>
    <br>
    <%!
       public String getCourseName(String x) throws SQLException{
        String course = null;
        
        Connection con = conn.getCon();
        
        String query = "select C_name from courses where C_id=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, x);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            course = rs.getString("C_name");
        }
        else{
            course = null;
        }
        return course;
        }
    %>
    <% 
        String query2="select C_id from enroll where S_id = ?";
        PreparedStatement ps = con.prepareStatement(query2);
        ps.setString(1, u_id);
        ResultSet rs2 = ps.executeQuery();
        String[] enrolledCourseId = new String[20];
        int i=0;
        while(rs2.next()){
           enrolledCourseId[i] = rs2.getString("C_id");
            i++;
//            out.println("Course "+i+" = "+enrolledCourseId[i] + "<=>"+rs2.getString("C_id"));
        }
        int j=i;
//        if(j==0){
//            out.println("Empty");
//        }
    %>
    
    <center>
        <div class="box">
        <h1><strong>Enrolled Courses</strong></h1><br>
        <table style="width:100%">
            <%
                i=0;
                while(i<j){
               
            %>   
            <tr>
                <th><% 
                    String k=enrolledCourseId[i];
                    out.print(k.toUpperCase()); 
                    
                    %></th>
                <!--<th><% // out.print("AB"+i); %></th>-->
                <!--<td><% // out.print(getCourseName(rs2.getString("C_id"))); %></td>-->
                <td><% out.print(getCourseName(k).toUpperCase()); %></td>
            </tr>
            <%
                i++;
                }
                
            %>
        </table>
        <a href="studentviewassign.jsp"><button id="update" style="height: 60px"><strong>View Assignments</strong></button></a>
        </div>
    </center>
            <br> <br> <br> <br> <br> <br> <br> <br> <br>
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