<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page import="java.sql.DriverManager  "%>



<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

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


<%
   File file ;
   int maxFileSize = 5000 * 1024 * 1024;
   int maxMemSize = 5000 * 1024 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");

   // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

        /* out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>"); */
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            
            try{
Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt","root","");

            Statement st = con.createStatement();
            
            st.executeUpdate( "insert into assign(tname, aname) values ('"+username+"', '"+fileName+"') ");

            out.println("Data is inserted"); }
            
catch(Exception e){}

            
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath + 
            fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
            file = new File( filePath + 
            fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
            
            out.println(fileName);
            
            
%>
        
    <center>
    <form action="uploadFile.jsp" method="post" enctype="multipart/form-data">
        <h2> Post Assignment </h2>
    <div class="container" >
            <label class="black"><b>Assignment posted Successfully!</b></label><br><br><br>
         </div>
        </form> 
    </center><br> <br> <br> <br> <br> <br> 

<% 
//out.println("Uploaded Filename: " + filePath + fileName + "<br>");
            }
         }
        // out.println("</body>");
        // out.println("</html>");
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }
    else
    {
    out.println("No file Uploaded");
     /* out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>"); */
      %>
        
    <center>
    <form action="uploadFile.jsp" method="post" enctype="multipart/form-data">
        <h2> Post Assignment </h2> 
      <div class="container" >
          <label class="black"><b>No File Uploaded ! <br> Please Select a File !!!</b></label><br><br><br>
         </div>
        </form> 
   </center>
   <%
  
   }


%>
<center>
    <a href="studentviewassign.jsp"><button>View Assignments</button></a><br><br><br>
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
