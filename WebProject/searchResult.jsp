<%@ page language="java"  %>

<html>
<head>

  <style>
body{

  background-color: rgb(7, 112, 107);


}

.wrapper{

width : 400px;
padding : 1rem 3rem;
margin:  2rem 22rem auto ;
background-color: #f1e5da;
text-align: center;
box-shadow: 0 20px 30px rgba(66, 61, 61, 0.247);
border-radius: 10px;
color: rgb(4, 65, 4);
box-shadow: 0 20px 30px rgba(66, 61, 61, 0.247);
border-radius: 10px;
color: rgb(4, 65, 4);
border: solid;
border-width: 6px;

}
.wrapper2{

width :800px;
padding : 1rem 1rem;
margin:  2rem 12rem auto ;
background-color: #f1e5da;
text-align: center;
box-shadow: 0 20px 30px rgba(66, 61, 61, 0.247);
border-radius: 10px;
color: rgb(4, 65, 4);
border: solid;
border-width: 6px;
}

.wrapper3{

width :500px;
padding : 1rem 1rem;
margin:  2rem 12rem auto ;
background-color: #f1e5da;
text-align: center;
box-shadow: 0 20px 30px rgba(66, 61, 61, 0.247);
border-radius: 10px;
color: rgb(4, 65, 4);
border: solid;
border-width: 6px;
}

  </style>
  
</head>


<body>
 <%
 if(session!=null && session.getAttribute("username") != null){
 %>

    <%
   
    String artist = (String) session.getAttribute("artist");
    String title = (String) session.getAttribute("title");
    String path = (String) session.getAttribute("path");
    String description = (String) session.getAttribute("description");
  %>
  

  <div class="wrapper2">
  <h1> WEB BASED ART GALLERY <br> </h1>
  </div>
   <hr>

  <div class="wrapper">
 <% 
 
    String id = null;
    id = request.getParameter("id");
    if(id!=null){
     if(id.equals("1")){
        %>
  <p style="font-family: sans-serif;">ART WORK FOUND!</p>

  </div>
      <div style="display:inline-block; background-color:burlywood; padding:20px; text-align:center;">
        <img src="<%= path %>" alt="<%= title %>" style="width:250px; height:250px;">
        <h2 style="word-wrap:break-word; "><%= title %></h2>
        <p><%= artist %></p>
        <p style="max-width:350px; text-align:center;"> <%= description %> </p>
      </div>

      <% }

      else if(id.equals("2")){ 
        %>
        <p style="font-family: sans-serif;">ART WORK NOT FOUND!<br> Try entering a different keyword</p>
        <%
      }
    }
      else{
      
            response.sendRedirect("login.jsp");
          
      }
    }
    else{
      response.sendRedirect("login.jsp");
    }
      %>
</body>

</html>

    