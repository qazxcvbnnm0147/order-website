/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package lendle.courses.network.loginws;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static lendle.courses.network.loginws.CounterListener.counter;

/**
 *
 * @author user
 */
@WebServlet(name = "number", urlPatterns = {"/number"})
public class number extends HttpServlet {
     public static int counter=0;
     public static String judge="";
     public static int counter2=0;
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        String buy=request.getParameter("buy");
        if(buy.equals("1"))
        {
            counter++;
            if(counter>100)
            {
                counter=0;
            }
            Cookie cookie=new Cookie(String.valueOf(counter),"1");
            cookie.setMaxAge(4);
            response.addCookie(cookie);
            response.sendRedirect("number.jsp");
        }
        
        
        /*Cookie [] cookies=request.getCookies();
        int temp = 0;
        String number="";
        cookies=request.getCookies();
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("number")){
                    temp = 1;
                    number=cookie.getValue();
                    if (!number.equals(judge))
                    {
                        counter++;
                    }
                    judge=number;
                    break;
                }
            }
            if(temp==0 && counter>counter2)
            {
                counter2++;
            }
            
            
            out.print(counter);
            out.print(counter2);
        */
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