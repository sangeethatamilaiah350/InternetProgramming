<%-- 
    Document   : BookDetails
    Created on : 24 May, 2022, 10:52:38 PM
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
            .container{
                margin:2px;
                top:15px;
                align-items: center;
                display:flex;
                border:2px solid;
                flex-direction: column;
                height:500px;
                width:600px;
                
            }
            .box{
                display:flex;
                flex-direction:row;
                gap:100px;
                margin:100px;
                left:200px;
                 
            }
            .in{
               display:flex;
                flex-direction:column; 
                justify-content: space-between;
            }
            h1{
            color:green;
            }
           
             #btns{
                font-size: 30px;
                border-radius:50%;
                cursor:pointer;
            }
            .button{
                border-radius:10px;
            }
        </style>
    </head>
    <body>
    <center></center>
        <h1>welcome <% out.println(session.getAttribute("name")); %>purchase now !</h1>
        
        
       
        <div class="box">
        
        <% 
            Connection con ;
            Statement stm;
            con=DriverManager.getConnection("jdbc:derby://localhost:1527/quiz","sangeetha","password");
            stm=con.createStatement();
            ResultSet rs=stm.executeQuery("select * from Book");
            int a;
            int id=0;
            out.println("<div class=\"books\">");
           
            while(rs.next()){
              
               out.println("<div class=\"container\"> <img src=\"../images/"+rs.getString(5)+"\"  height=\"200px\" width=\"200px\">" );
               
               out.println("<p>BookName :"+rs.getString(1)+"</p>");
               
               out.println("<p >Book_id :"+rs.getString(2)+"</p>");
               a=Integer.parseInt(rs.getString(3));
        %>
             Quantity  :<p id="qun<%= id++ %>"><%= a%></p>
               <%
               out.println("<p>Price :"+rs.getString(4)+"</p>");
               out.println("</div>");
            };
            out.println("</div>");
                   
                %>
        
               
        <div class="in">
        Number of copies: <input type="number" id="book1" placeholder="0">
        <button class="button" onclick="myFunction_1()" >+</button>
        <button class="button" onclick="myFunction1()" >-</button>
        
        Number of copies: <input type="number" id="book2" placeholder="0">
        <button class="button" onclick="myFunction_2()" >+</button>
        <button class="button" onclick="myFunction2()" >-</button>
        
        Number of copies: <input type="number" id="book3" placeholder="0">
        <button class="button" onclick="myFunction_3()" >+</button>
        <button class="button" onclick="myFunction3()" >-</button>
        </div>
    </div>
               
        <form action="http://localhost:38769/lab_8/DbJsp/purchase.jsp" >
            <input type="hidden" id="one"value="" name="first">
            <input type="hidden" id="two" value="" name="second">
            <input type="hidden" id="three"value="" name="third">
            <center>
            <input type="submit" value="confirmorder" onclick="setvalue()"  id="btns">
            </center>
        </form>
        
     </center>   
<script>
function setvalue(){
    document.getElementById("one").value=document.getElementById("book1").value;
    document.getElementById("two").value=document.getElementById("book2").value;
    document.getElementById("three").value=document.getElementById("book3").value;
    console.log(document.getElementById("three").value);
}
function myFunction_1() {
    console.log(parseInt(document.getElementById("qun0").innerHTML));
  if( document.getElementById("book1").value < parseInt(document.getElementById("qun0").innerHTML) ){
      
  document.getElementById("book1").stepUp(1);
  }
}
function myFunction_2() {
  if(document.getElementById("book2").value <parseInt(document.getElementById("qun1").innerHTML)){
  document.getElementById("book2").stepUp(1);
  }
}
function myFunction_3() {
  if(document.getElementById("book3").value <parseInt(document.getElementById("qun2").innerHTML)){
  document.getElementById("book3").stepUp(1);
  }
}
function myFunction1() {
  if(document.getElementById("book1").value >0){
  document.getElementById("book1").stepDown(1);
  }
}
function myFunction2() {
  if(document.getElementById("book2").value >0){
  document.getElementById("book2").stepDown(1);
  }
}
function myFunction3() {
    var s="hi";
  if(document.getElementById("book3").value >0){
  document.getElementById("book3").stepDown(1);
  }
}

        
       </script>
    </body>
</html>
