/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package lendle.courses.network.loginws;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
@WebServlet(name = "processLogin", urlPatterns = {"/processLogin"})
public class processLogin extends HttpServlet {
 static{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
 }
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
        response.setContentType("application/json"); 
        request.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter(); Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "")) {
            /* TODO output your page here. You may use following sample code. */
          String id=request.getParameter("id");
          String password=request.getParameter("password");
          Statement stmt=conn.createStatement();
          ResultSet rs=stmt.executeQuery("select * from login where id='"+id+"'");
          Map map=new HashMap();
           if(rs.next()){
                out.print(rs.getString("password"));
                if(password.equals(rs.getString("password"))){
                    int point = rs.getInt("point");
                    Cookie cookie=new Cookie("user_id",id);
                    response.addCookie(cookie);
                    cookie=new Cookie("point",String.valueOf(point));
                    response.addCookie(cookie);
                    HttpSession session=request.getSession();
                    session.setAttribute("loggedInUser", id);
                    response.sendRedirect("admin/index.jsp");
                }
                else{
                    response.sendRedirect("error.jsp");
                    out.print("login fail");
                }
            }
          else{
                response.sendRedirect("error.jsp");
               }
           
        } catch (Exception e) {
         throw new ServletException(e);
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
