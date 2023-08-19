<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>
            login JSP 
        </title>

        <script language="JavaScript" type="text/javaScript">

            function validate()
           {
                       if ( document.login.username.value == "" )
                       {
                           alert("Please enter a Username!");			
                           return false;
                       }
                   
                       if ( document.login.password.value == "" )
                       {
                           alert("Please enter a Password!");			
                           return false;
                       }
                       return true;
            }

           
           </script>
           <title> Welcome </title>
           <link rel="login.html">
           
           <style>
           
           *{
               font-family: sans-serif;
           }
           
           body{
            
               background:#dfe9f5;
               background-image: url("bg.jpeg");
               background-size: cover;
           
               background-repeat: no-repeat;
           }
           
           .wrapper{
           
               width : 330px;
               padding : 4rem 4rem;
               margin:  2rem 25rem auto ;
               background-color: #DAA06D;
               text-align: center;
               box-shadow: 0 20px 30px rgba(66, 61, 61, 0.247);
               border-radius: 10px;
           }
           button{
               font-size:medium;
               padding:10px 10px;
           }
           
           .inp{
           
               color: white;
               font-weight: bold;
           border-radius: 10px;
           
           }
           
           h1,h2{
           
               
           
           color: white;
           font-weight: bold;
           
           }
           
           .button{
             
               background: #e27272a4;
               color: white;
               border-style: outset;
               border-color: #ca6060;
               height: 50px;
               width: 100px;
               font: bold15px arial,sans-serif;
               text-shadow: none;
               border-radius: 10px;
           
           }
           
           </style>
    </head>

    <body>
      <% 
      String type = (String) session.getAttribute("type");
        if(session!=null && type!=null){
        
            if (type.equals("admin")) {
                response.sendRedirect("galleryPage.jsp?id=1");
            } else if (type.equals("user")) {
                response.sendRedirect("galleryPage.jsp?id=2");
            }
            


        }
        else{

         %>

        <div class="wrapper">
            <h1> <strong>Art Gallery </strong> </h1>
            <h2> <strong>Login</strong> </h2>
            <form action="loginB" class="inp" name="login" method="post" onsubmit="return validate()">
               Enter User Name: <input type = "text" placeholder="username" name="username" style="border-radius: 5px;"> <br> <br>
               Enter Password: <input  type = "password" placeholder="*****" name="password" style="border-radius: 5px;" > <br> <br>
               <div >
                <input class ="button"type="submit" value="Login"> <br>
               </div> 
        
               <div >
                <br>New member? <a href="signup.jsp"> Signup Here</a>
               </div>
        
            </form>
            
          </div>

          <%

          String errorMessage = (String) request.getAttribute("errorMessage");
          if (errorMessage != null) {

         %>
      <center> <p style="color:red; border-width:3px; border-style:solid; border-color:#ffffff; background:white">
        
        <%= errorMessage %>
        
        </p> 
    
        </center>
         
      <%
          }
        }
      %>
     

    </body>
</html>