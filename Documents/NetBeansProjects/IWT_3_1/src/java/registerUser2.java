//import com.mysql.fabric.Response;
//import com.sun.xml.internal.messaging.saaj.packaging.mime.internet
//.ContentType;
import java.io.*;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
//import java.sql.ResultSet;
import java.sql.PreparedStatement;
import connection.*;
//import static connection.conn.con;
import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.Statement;
//import javax.servlet.annotation.WebServlet;

//@WebServlet("/registerUser2")
public class registerUser2 extends HttpServlet{
    public void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException{
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        try{
        String firstname = req.getParameter("fname");
        String lastname = req.getParameter("lname");
        String id = req.getParameter("Id");
        String psw = req.getParameter("psw");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String name = firstname +" "+ lastname;
//        String path = req.getContextPath();
//        String ip = req.getRemoteAddr();
//        out.print("<html>" +
//        "<title>Hello</title>" +
//                "Hello World"+ "<br>" +
//        "Your ip is: " + ip + "<br>" +
//        "Your path is: " + path + "<br>"
//        );
        out.println("ID = " + id + "<br>");
        out.println("First Name = " + firstname + "<br>");
        out.println("Last Name = " + lastname + "<br>");
        out.println("Password = " + psw + "<br>");
        out.println("Phone = " + phone + "<br>");
        out.println("Email = " + email + "<br>");
//        Class.forName("com.mysql.jdbc.Driver");
//Connection con = DriverManager.getConnection
//("jdbc:mysql://localhost:3306/iwt?zeroDateTimeBehavior=convertToNull","","");
        Connection con = conn.getCon();
        out.println("Connection Established <br>");
        String query = "insert into students values(?,?,?,?,?)";
        out.println("String Written <br>");
        PreparedStatement ps = con.prepareStatement(query);
        out.println("PREPARED STATEMENT<br>");
        
        ps.setString(1, id);
        ps.setString(2,name);
        ps.setString(3, psw);
        ps.setString(4, phone);
        ps.setString(5, email);
        out.println("Set String Done <br>");
        int x = ps.executeUpdate();
//            Statement st = con.createStatement();
//            out.println("Create Statement <br>");
//            int x = st.executeUpdate(query);
            out.println("Execute Update <br>");
        if(x>0){
            out.println("Data SAved <br>");
            res.sendRedirect("regSuc.jsp");
        }
        else{
            out.println("DAta not saved <br>");
               res.sendRedirect("regUnSuc.jsp?message=");
        }
        out.println("</html>");
        
        }
        catch(Exception e){
//            RequestDispatcher rd =   
                    res.sendRedirect("errorSQL.jsp?message="+e+"");
                    out.println("xecwiocnl "+e);
                    
                   // res.sendRedirect("error.jsp");
        }   
    }
public void doPost(HttpServletRequest req, HttpServletResponse res) throws
        ServletException, IOException{
        processRequest(req, res);
    }
public void doGet(HttpServletRequest req, HttpServletResponse res) throws
        ServletException, IOException{
        processRequest(req, res);
    }
}