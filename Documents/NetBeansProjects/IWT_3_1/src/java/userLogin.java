/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.ContentType;
import java.io.*;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
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
public class userLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
          // Create cookies for first and last names.      

      // Set expiry date after 24 Hrs for both the cookies.

      // Add both the cookies in the response header.

      // Set response content type
      response.setContentType("text/html");
      PrintWriter out = response.getWriter();
      try {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet userLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet userLogin at " + request.getContextPath() + "</h1>");
            
            /* TODO output your page here. You may use following sample code. */
            
            String uname = request.getParameter("uname");
            String psw  = request.getParameter("psw");
            String logintype = request.getParameter("logintype");
            out.print("Type = "+logintype);
            
            Connection con = conn.getCon();
            out.println("Connection Established <br>");
            ResultSet rs = null;
            if(logintype.equals("students")){
                
            String query = "select pwd from students where S_id = ? ";
            out.println("String Written <br>");
            PreparedStatement ps = con.prepareStatement(query);
            out.println("PREPARED STATEMENT<br>");
            ps.setString(1, uname);
//            int x = ps.executeUpdate(); 
            rs= ps.executeQuery();
            }
            else if(logintype.equals("teachers")){
            String query = "select pwd from teachers where T_id = ? ";
            out.println("String Written <br>");
            PreparedStatement ps = con.prepareStatement(query);
            out.println("PREPARED STATEMENT<br>");
            ps.setString(1, uname);
//            int x = ps.executeUpdate(); 
            rs= ps.executeQuery();
                
            }
//            boolean b = ps.execute();
//            out.println("Result Set[1] = "+rs.getString(1)+"<br>");
//            out.println("x = "+x+"<br>");
            
            HttpSession session = request.getSession();
            session.setAttribute("uname",uname);
            session.setAttribute("logintype", logintype);
//            if(logintype.equals("teachers")){
//                session.setAttribute("tid", uname);
//            }
            Cookie usernameC = new Cookie("user_name",uname);
            Cookie passwordC = new Cookie("password",psw);
            response.addCookie( usernameC );
            response.addCookie( passwordC );
            usernameC.setMaxAge(60*60*24); 
            passwordC.setMaxAge(60*60*24); 
            if(rs.next()){
                String password = rs.getString(1);
                out.println("Password::"+password);
                out.println("psw::"+psw);
                if(password.equals(psw)){
                    out.println("UserName and Password MAtched!! <br>");
                    
                }
                else{
                    out.println("<h1 style=\"color:black;\">Incorrect Password! <h1>");
//                    out.close();
                        session.invalidate();
//                        request.getRequestDispatcher("Login.jsp").include(request, response);
                        response.sendRedirect("Login.jsp");
                }
            }
            else{
                out.println("Incorrect Username! <br>");
                        session.invalidate();
                        response.sendRedirect("Login.jsp");
//                request.getRequestDispatcher("Login.jsp").include(request, response);
                        
                
            }
            out.println("<a href=\"index.jsp\">Home</a><br>");
            if(session.getId().equals(null)){
                out.println("Session not established =>"+session.getId());
            }else{
                out.println("Session established =>"+session.getId());
                response.sendRedirect("index.jsp");
                
            }
            out.println("</body>");
            out.println("</html>");
            out.close();
        }catch(Exception e){
            response.getWriter().println("Error:: "+e);
        }
//        response.getWriter().println("</body>");
//        response.getWriter().println("</html>");
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
