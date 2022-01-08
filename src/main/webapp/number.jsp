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
            String lie="";
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
            out.print(ini_min);
            out.print(ini_max);
                   
              
            
        %>
    </body>
</html>
