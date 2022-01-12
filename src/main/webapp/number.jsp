<%-- 
    Document   : number
    Created on : 2022/1/8, 下午 08:14:36
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int ini_min=1;
            int ini_max=1;
            int min=1;
            int max=1;
            String nock="";
            Cookie [] cookies=request.getCookies();
            for(Cookie cookie : cookies)
            {
                int num=1;
                while(num<100)
                {
                    String num_str=String.valueOf(num);
                    
                    if(cookie.getName().equals(num_str))
                    {
                        ini_min=num;
                        ini_max=num;
                        break;
                    }
                
                    num++;
                }
            }
            for(Cookie cookie : cookies)
            {
                int num=1;
                while(num<100)
                {
                    String num_str=String.valueOf(num);
                    
                    if(cookie.getName().equals(num_str))
                    {
                        if(num<=ini_min)
                        {
                            ini_min=num;
                        }
                        break;
                    }
                    num++;
                }
                num=1;
                 while(num<100)
                {
                    String num_str=String.valueOf(num);
                    if(cookie.getName().equals(num_str))
                    {
                        if(num>=ini_max)
                        {
                            ini_max=num;
                        }
                        
                        break;
                    }
                    num++;
                }
                    
            }   
      
        
            
        %>
        您的取餐號碼為:<%=ini_max%><br>
        目前取餐號碼為:<%=ini_min%><br>
        <% 
            if(ini_max==1)
            {
                out.print("您的餐點好了!");
            }
        %>
        <br>
        <a href="index.jsp">back to order</a>
    </body>
</html>
