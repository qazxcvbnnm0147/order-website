/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lendle.courses.network.loginws;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lendle
 */
@WebServlet(name = "LoginInfoServlet", urlPatterns = {"/login_info"})
public class LoginInfoServlet extends HttpServlet {
    static{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void getImpl1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("application/json");
        try (PrintWriter out=response.getWriter(); Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "")) {
            //select from login
            //output in id:password style
            //this time, consider the id parameter
            String id=request.getParameter("id");
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery("select * from login where id='"+id+"'");
            Map map=new HashMap();
            if(rs.next()){
                map.put("id", rs.getString("id"));
                map.put("password", rs.getString("password"));
            
            }
            Gson gson=new Gson();
            out.print(gson.toJson(map));
            
            //////////////////////////////
        }catch(Exception e){
            throw new ServletException(e);
        }
    }
    
    private void getImpl2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/plain;charset=UTF-8");
        try (PrintWriter out=response.getWriter(); Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "")) {
            //re-implement getImpl1
            //this time reponde in json-format
            //and use gson
            String id=request.getParameter("id");
            
            //////////////////////////////
        }catch(Exception e){
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
        getImpl1(request, response);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        try (PrintWriter out=response.getWriter(); 
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "")) {
            //update the corresponding user
            String id=request.getParameter("id");
            String password=request.getParameter("password");
            PreparedStatement pstmt=conn.prepareStatement(
                    "update login set password=? where id=?");
            pstmt.setString(1, password);
            pstmt.setString(2, id);
            if(pstmt.executeUpdate()==1){
                 out.println("success");
            }else{
                 out.println("fail");
            }
            //////////////////////////////
            //out.println(ret);
        }catch(Exception e){
            throw new ServletException(e);
        }
    }
    
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        try (PrintWriter out=response.getWriter(); 
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "")) {
            //delete the corresponding user
            String id=request.getParameter("id");
            Statement s=conn.createStatement();
            int ret=s.executeUpdate("delete from login where id='"+id+"'");
            if(ret==1){
                out.print("success");
            }else{
                out.print("fail");
            }
            //////////////////////////////
            //out.println(ret);
        }catch(Exception e){
            throw new ServletException(e);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        try (PrintWriter out=response.getWriter(); Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "")) {
            //insert the corresponding user
            String id=request.getParameter("id");
            String password=request.getParameter("password");
            PreparedStatement ps=conn.prepareStatement(
                    "insert into login (id, password) values (?,?)");
            ps.setString(1, id);
            ps.setString(2, password);
            //////////////////////////////
            if(ps.executeUpdate()==1){
            out.println("success");
            }else{
                out.println("fail");
            }
        }catch(Exception e){
            throw new ServletException(e);
        }
    }

}
