<%-- 
    Document   : purchase
    Created on : 27 May, 2022, 9:51:29 PM
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
             body{
                align-items: center;
                background-color: #9fcfbf;
            }
            h1{
                color:green;
            }
            .invoice{
                border:2px solid;
                width:50%;
            }
        </style>
    </head>
    <body>
        
        <center>
        <h1>well done there are nice stuff in your cart</h1>
        <br/><br/></br>
        <div class="invoice">
        <h1>Invoice</h1>
        <table border="2px">
            
            <td>BookName</td>
            <td>Quantity</td>
            <td>Price</td>
            <td>total</td>
            </th>
            <tr>
        
        
        <%
            Connection con ;
            Statement stm;
            con=DriverManager.getConnection("jdbc:derby://localhost:1527/quiz","sangeetha","password");
            stm=con.createStatement();
            String books="";
            
            ResultSet rs=stm.executeQuery("select * from Book");
            long total=0;
            
             rs.next();
             
             if( Integer.parseInt(request.getParameter("first"))!=0){
             
             long num=Integer.parseInt(rs.getString(4))* Integer.parseInt(request.getParameter("first"));
             books+=rs.getString(1) +" ";
             %>
             <td><%out.print(rs.getString(1)); %></td>
             <td><% out.print(Integer.parseInt(request.getParameter("first"))) ;%></td>
             <td><% out.println(Integer.parseInt(rs.getString(4)));%></td>
             <td><% out.println(num) ;%></td>
        </tr>
             <%
             total+=num;
             int updated=Integer.parseInt(rs.getString(3)) -  Integer.parseInt(request.getParameter("first")) ;
             
             
             Statement sm=con.createStatement();
             int result=sm.executeUpdate("UPDATE BOOK SET quantity="+updated+" WHERE BOOKNAME='"+rs.getString(1)+"'");
            }
            
            rs.next();
             
             if( Integer.parseInt(request.getParameter("second"))!=0){
             long num=Integer.parseInt(rs.getString(4))* Integer.parseInt(request.getParameter("second"));
             
             total+=num;
             int updated=Integer.parseInt(rs.getString(3)) -  Integer.parseInt(request.getParameter("first")) ;
             Statement sm=con.createStatement();
             int result=sm.executeUpdate("UPDATE BOOK SET quantity="+updated+" WHERE BOOKNAME='"+rs.getString(1)+"'");
               books+=rs.getString(1)  +" ";
              %>
              
              <tr>
                <td><%out.print(rs.getString(1)); %></td>
             <td><% out.print(Integer.parseInt(request.getParameter("second"))) ;%></td>
             <td><% out.println(Integer.parseInt(rs.getString(4)));%></td>
             <td><% out.println(num) ;%></td>  
              </tr>
              <%
            }
            
            rs.next();
             
             if( Integer.parseInt(request.getParameter("third"))!=0){
             long num=Integer.parseInt(rs.getString(4))* Integer.parseInt(request.getParameter("third"));
             
             total+=num;
              books+=rs.getString(1)  +" ";
             int updated=Integer.parseInt(rs.getString(3)) -  Integer.parseInt(request.getParameter("first")) ;
             Statement sm=con.createStatement();
             int result=sm.executeUpdate("UPDATE BOOK SET quantity="+updated+" WHERE BOOKNAME='"+rs.getString(1)+"'");
             
  %>
  
  <tr>
      <td><%out.print(rs.getString(1)); %></td>
             <td><% out.print(Integer.parseInt(request.getParameter("third"))) ;%></td>
             <td><% out.println(Integer.parseInt(rs.getString(4)));%></td>
             <td><% out.println(num) ;%></td>  
  </tr>
  <%
            }
            
           Statement sm=con.createStatement();
           ResultSet result=sm.executeQuery("SELECT purchased FROM CUSTOMER WHERE NAME='"+session.getAttribute("name")+"'");
           result.next();
           Statement update=con.createStatement();
           books += result.getString(1);
           int res=update.executeUpdate("UPDATE CUSTOMER SET PURCHASED='"+books+"' WHERE NAME='"+session.getAttribute("name")+"'");
            

%>
            
            
            
            
            </table>
</br></br></br>
             Total Amount:<h1> <% out.println(total); %></h1>
            </div>
    </center> 
    
    </body>
</html>
