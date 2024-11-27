/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package lendle.courses.network.loginws;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author qazxc
 */
@WebServlet(name = "processForgetpassword", urlPatterns = {"/processForgetpassword"})
public class processForgetpassword extends HttpServlet {

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
          String id = request.getParameter("id");
          out.print(id);
         String password = "";
          PreparedStatement stmt = conn.prepareStatement("select password from login where id = ?");
            // 設置查詢條件 id = 1
            stmt.setString(1,  id);
            try (ResultSet rs1 = stmt.executeQuery()) {
                if (rs1.next()) {
                    // 提取 totalprice 資料
                       password = rs1.getString("password");
                       Cookie cookie=new Cookie("password",password);
                       response.addCookie(cookie);
                       response.sendRedirect("getpassword.jsp");
                    } else {
                        System.out.println("No data found");
                    }
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
