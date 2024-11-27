/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package lendle.courses.network.loginws;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
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
    int order_index=0;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter();Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/test?useUnicode=true&characterEncoding=UTF-8", "root", "")) {
            /* TODO output your page here. You may use following sample code. */
           String sql = "DELETE FROM `order`";
           PreparedStatement stmt= conn.prepareStatement(sql);
           stmt.executeUpdate();
           out.print("購物車資料已清空");
           
           sql = "insert into `order` (item, quantity, price, total_price) values (?,?,?,?)";
           stmt= conn.prepareStatement(sql);
           String cartData = request.getParameter("cart_data");
           String totalPrice = request.getParameter("total_price");
         
            if (cartData != null && !cartData.isEmpty()) {
                order_index++;
            // 使用 Gson 解析 cartData
                Gson gson = new Gson();
                List<CartItem> cartItems = gson.fromJson(cartData, new TypeToken<List<CartItem>>() {}.getType());
                for(CartItem item : cartItems)
                {
                    stmt.setString(1, item.getName());
                    stmt.setInt(2, item.getQuantity());
                    stmt.setInt(3, (int)item.getPrice());
                    stmt.setInt(4, (int)item.getPrice()*item.getQuantity());
                    stmt.addBatch();
                  }
                stmt.executeBatch(); // 執行批量插入
                out.println("購物車資料成功插入資料庫");
            }
            sql = "insert into order_list (total_price, order_index) values (?,?)";
            stmt= conn.prepareStatement(sql);
            if(totalPrice != null)
            {
                stmt.setInt(1, Integer.valueOf(totalPrice));
                stmt.setInt(2, order_index);
            }
            stmt.executeUpdate();
            out.println("訂單資訊成功插入資料庫");
            Cookie cookie=new Cookie("order_id",String.valueOf(order_index));
            response.addCookie(cookie);
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
