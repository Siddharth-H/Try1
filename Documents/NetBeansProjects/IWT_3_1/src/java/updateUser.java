/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import connection.*;
import static connection.conn.con;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author Siddharth
 */
public class updateUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        try{
        PrintWriter out = res.getWriter();
//        String firstname = req.getParameter("fname");
//        String lastname = req.getParameter("lname");
//        String id = req.getParameter("Id");
        HttpSession session  = req.getSession();
        String sid = session.getAttribute("uname").toString();
        String psw = req.getParameter("psw");
        String phone = req.getParameter("phone");
        String logintype = session.getAttribute("logintype").toString();
        String IdString =null;
        if(logintype.equals("students")){
            IdString = "S_id";
        }
        else if(logintype.equals("teachers")){
            IdString = "T_id";
        }
//        String email = req.getParameter("email");
//        String name = firstname +" "+ lastname;
//        String path = req.getContextPath();
//        String ip = req.getRemoteAddr();
//        out.print("<html>" +
//        "<title>Hello</title>" +
//                "Hello World"+ "<br>" +
//        "Your ip is: " + ip + "<br>" +
//        "Your path is: " + path + "<br>"
//        );
        out.println("ID = " + sid + "<br>");
//        out.println("First Name = " + firstname + "<br>");
//        out.println("Last Name = " + lastname + "<br>");
        out.println("Password = " + psw + "<br>");
        out.println("Phone = " + phone + "<br>");
//        out.println("Email = " + email + "<br>");
//        Class.forName("com.mysql.jdbc.Driver");
//        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt?zeroDateTimeBehavior=convertToNull","root","");
        Connection con = conn.getCon();
        out.println("Connection Established <br>");
        String query = "";
        if(psw.equals("")){
            if(phone.equals("")){
                res.sendRedirect("profile.jsp");
            }
            else{
                query = "update students set phone = '"+phone+"' where "+IdString+" like '"+sid+"';";
            }
        }
        else{
            if(phone.equals("")){
                query = "update students set pwd = '"+psw+"' where "+IdString+" like '"+sid+"';";
            }
            else{
                query = "update students set pwd = '"+psw+"', phone = '"+phone+"' where "+IdString+" like '"+sid+"';";
            }
        }
            
        out.println("String Written <br>");
        PreparedStatement ps = con.prepareStatement(query);
        out.println("PREPARED STATEMENT<br>");
        out.println("Set String Done <br>");
        int x = ps.executeUpdate();
//            Statement st = con.createStatement();
//            out.println("Create Statement <br>");
//            int x = st.executeUpdate(query);
            out.println("Execute Update <br>");
        if(x>0){
            out.println("Data SAved <br>");
//            res.sendRedirect("regSuc.jsp");
        }
        else{
            out.println("DAta not saved <br>");
//               res.sendRedirect("regUnSuc.jsp");
        }
        out.println("</html>");
        res.sendRedirect("profile.jsp");
        }catch(Exception e){
//            RequestDispatcher rd = 
                    res.sendRedirect("error.jsp");
        }   
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
