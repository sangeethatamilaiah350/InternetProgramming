<%-- 
    Document   : LoginPage
    Created on : 24 May, 2022, 9:30:34 PM
    Author     : SANGEETHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .for{
                border:2px solid;
                height:300px;
                width:30%;
                margin:40px;
                top:100px;
                 background-color: #8accdb;
            }
            #btn{
                font-size: 30px;
                border-radius:50%;
                cursor:pointer;
            }
            h1{
                color:green;
            }
            body{
              background-color: #f2e6eb;
            }
             
       
        
             
        </style>
    </head>
    
    <body bg-image="download.jpg">
    <center>
        <h1 >welcome to the Book shop</h1>
        <h3 >login to purchase</h3>
        <form  class="for" action ="http://localhost:38769/lab_8/DbJsp/Authenticate.jsp" method="get" >
            </br> </br> </br>
            <div > 
            ENTER NAME: <input type="text" name="name">
            </div>
            </br> </br> </br>
            <div > 
            ENTER PASSWORD: <input type="password" name="pwd">
            </div>
            </br> </br> </br>
            <input type="submit" value="Login" id="btn">
           
        </form>
       </center> 
        
    </body>
</html>


 <!--<center><h2>Start purchasing Books</h2></center>
                    <form action= method= "get">
                    <input type='submit' value= 'view book details'>
                    </form>  -->
