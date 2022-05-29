<%-- 
    Document   : Authenticate
    Created on : 24 May, 2022, 9:38:05 PM
    Author     : SANGEETHA
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            h1{
                font-size: x-large;
            }
        </style>
    </head>
    <body>
         <%  String name=request.getParameter("name");
            String password=request.getParameter("pwd");
            Connection con ;
            Statement stm;
            con=DriverManager.getConnection("jdbc:derby://localhost:1527/quiz","sangeetha","password");
            stm=con.createStatement();
            ResultSet rs=stm.executeQuery("select * from Customer");
            
            while(rs.next()){
                if(name.equals(rs.getString(1)) && password.equals(rs.getString(2))){ 
                      
                    out.println("<center><h1>welcome !!"+request.getParameter("name")+" </h1></center>");
                    session.setAttribute("name",name);
                    response.sendRedirect("http://localhost:38769/lab_8/DbJsp/BookDetails.jsp");
                    break;
                }
                if(name.equals(rs.getString(1))){
                 response.sendRedirect("http://localhost:38769/lab_8/DbJsp/LoginPage.jsp");
                 break;
                }
                       
            }
            
            out.println("<center><h1>oops !!"+request.getParameter("name")+" pls create an account </h1></center>");
        %>
    </body>
</html>
