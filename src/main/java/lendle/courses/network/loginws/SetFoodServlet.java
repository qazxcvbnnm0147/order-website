/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package lendle.courses.network.loginws;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "SetFoodServlet", urlPatterns = {"/SetFoodServlet"})
public class SetFoodServlet extends HttpServlet {
     static{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter();Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "")) {
            /* TODO output your page here. You may use following sample code. */
           String food_main=request.getParameter("food_main");
           String food_sub=request.getParameter("food_sub");
           String drinks=request.getParameter("drinks");
           out.print(food_main);
           out.print(food_sub);
           Statement stmt=conn.createStatement();
           ResultSet rs1=stmt.executeQuery("select * from menu where food='"+food_main+"'");
           /*ResultSet rs2=stmt.executeQuery("select * from menu where food='"+food_sub+"'");
           ResultSet rs3=stmt.executeQuery("select * from menu where food='"+drinks+"'");*/
           int price1=0,price2=0,price3=0;
           if(rs1.next()){
               price1 = rs1.getInt("price");
               out.print(price1);
           }
           ResultSet rs2=stmt.executeQuery("select * from menu where food='"+food_sub+"'");
           if(rs2.next()){
               price2 = rs2.getInt("price");
               out.print(price2);
           }
           ResultSet rs3=stmt.executeQuery("select * from menu where food='"+drinks+"'");
           if(rs3.next()){
               price3 = rs3.getInt("price");
               out.print(price3);
           }
           String combo=request.getParameter("combo");
           int total=price1+price2+price3;
           out.print(total);
           Cookie cookie;
           if (combo.equals("yes"))
           {
               if(food_main.equals("none") || food_sub.equals("none") || drinks.equals("none"))
               {
                   String lie = "yes"; 
                   cookie=new Cookie("lie",lie);
                   response.addCookie(cookie);
                   out.print("you lie");
               }
               else{
                   total = (int)(((float)total)*0.85);
                   String lie = "no";
                   cookie=new Cookie("lie",lie);
                   response.addCookie(cookie);
               }
           }
           else
           {
               String lie = "no";
               cookie=new Cookie("lie",lie);
               response.addCookie(cookie);
           }
           String string_total= String.valueOf(total);
           out.print(total);
           
           cookie=new Cookie("food_main",food_main);
           response.addCookie(cookie);
           cookie=new Cookie("food_sub",food_sub);
           response.addCookie(cookie);
           cookie=new Cookie("drinks",drinks);
           response.addCookie(cookie);
           cookie=new Cookie("total",string_total);
           response.addCookie(cookie);
        ///////////////////////////////////////////////////////////////
           response.sendRedirect("checkorder.jsp");
        }
        catch(Exception e){
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
