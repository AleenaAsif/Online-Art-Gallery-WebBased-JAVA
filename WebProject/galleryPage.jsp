<%@ page language="java" import="java.sql.*" %>
<html>
<head>

  <style>
body{

  background-color: rgb(2, 117, 111);


}

.wrapper{

width : 800px;
padding: 1rem 1rem;
margin:  2rem 12rem auto ;
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

width :600px;
padding: 1rem 8rem;
margin:  1rem 11rem auto ;
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

margin:  2rem 2rem auto ;
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

  <button style="background-color: #995858;border-radius: 20%;font-family: Optima;font-size: 20px;float: right; width: 10%;height: 50px; "><a style="color: white;text-decoration: none;"href="logout">Log Out</a></button>


  <%
    if (session != null) {
      String username = (String) session.getAttribute("username");
      if (username != null) {

        
        String id = request.getParameter("id");
        String type= (String)session.getAttribute("type");
    
        if(id!=null)
    {    
        if(id.equals("1")){

          if(type.equals("admin")){


  
  %>

  <h1 style="color: antiquewhite;">ADMIN PROFILE</h1>

   <div class="wrapper2">
   <h1> WEB BASED ART GALLERY <br> </h1>
   <p style="font-family: sans-serif;">Welcome to our web-based art gallery, where you can discover and experience the beauty of art from the comfort of your own home. Our gallery features a diverse collection of pieces from talented artists around the world, showcasing a range of styles and mediums. So, take a moment to explore, and let the beauty of art into your life.</p>
   </div>
    <hr>


   <hr>
  <br> 
  <div class="wrapper3">
    <form action="searchArt" method ="post">
      <h1 style="text-align: center;"> SEARCH </h1>
   <strong> Enter title to search an ArtWork </strong> <input type ="text" name="searchName" >
     <input type="submit" value="Search">
    

 
    </form>
 
   </div>

   <div class="wrapper3">

   <form action="add" method="post" enctype="multipart/form-data">
    <h1> <strong>Add art works</strong></h1>
   
      <strong>Enter Title: </strong><input type="text" id="title" name="title"> <br>
      <strong>Enter Artist Name:</strong> <input type="text" id="artist" name="artist"> <br>
     <strong> Enter description: </strong><textarea id="description" name="description"></textarea> <br>
     <strong>Upload image file:</strong> <input type="file" id="image" name="image"> <br>

      <button type="submit">Add Artwork</button>
  
  </form>
</div>

<div class="wrapper3">

  <form action="update2" method="post">
   <h1> <strong>Update art works</strong></h1>
  
   <strong>Enter Current Title: </strong><input type="text" id="oldTitle" name="oldTitle"> <br>
     <strong>Enter new Title: </strong><input type="text" id="newtitle" name="newtitle"> <br>
     <strong>Enter Artist Name:</strong> <input type="text" id="artist" name="artist"> <br>
    <strong> Enter description: </strong><textarea id="description" name="description"></textarea> <br>
  

     <button type="submit"  value="update">Update Artwork</button>
 
 </form>
</div>



<div class="wrapper3">
  <form action="delete" method ="post">
    <h1 style="text-align: center;"> DELETE </h1>
 <strong> Enter title to delete an ArtWork </strong> <input type ="text" name="title" >
   <input type="submit" value="delete">
  


  </form>

 </div>


<%
  try{

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://127.0.0.1/galleryinfo";

    Connection con=DriverManager.getConnection(url, "root", "root");

    Statement st=con.createStatement();

    String query="Select * from artworks";

    ResultSet rs = st.executeQuery( query );
    
    while (rs.next()) {
      String title = rs.getString("title");
      String artist = rs.getString("artist");
      String image = rs.getString("path");
      String description=rs.getString("description");

      %>
    
      <div style="display:inline-block; background-color: burlywood; padding:20px; text-align:center;">
        <img src="<%= image %>" alt="<%= title %>" style="width:250px; height:250px;">
        <h2 style="word-wrap: break-word; "><%= title %></h2>
        <p><strong><%= artist %> </strong></p>
        <p style="max-width: 350px; text-align:center;"> <%= description %> </p>

      </div>
<%

    }
    
    
    st.close();

 con.close(); 

} catch (Exception e) {
    e.printStackTrace();
  }
  
 }
  else{
    response.sendRedirect("galleryPage.jsp?id=2");
  }

}
else if(id.equals("2")){

  

  if(type.equals("user")){

  %>

  <h1 style="color: antiquewhite;">VIEWER PROFILE</h1>



  <div class="wrapper2">
  <h1> WEB BASED ART GALLERY <br> </h1>
  <p style="font-family: sans-serif;">Welcome to our web-based art gallery, where you can discover and experience the beauty of art from the comfort of your own home. Our gallery features a diverse collection of pieces from talented artists around the world, showcasing a range of styles and mediums. So, take a moment to explore, and let the beauty of art into your life.</p>
  </div>
   <hr>
  <br> 
  <div class="wrapper3">
    <form action="searchArt" method ="post">
      <h1 style="text-align: center;"> SEARCH </h1>
   <strong> Enter title to search an ArtWork </strong> <input type ="text" name="searchName" >
     <input type="submit" value="Search">
    

 
    </form>
 
   </div>
   <br> <br>

  <%
  try{

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://127.0.0.1/galleryinfo";

    Connection con=DriverManager.getConnection(url, "root", "root");

    Statement st=con.createStatement();

    String query="Select * from artworks";

    ResultSet rs = st.executeQuery( query );
    
    while (rs.next()) {
      String title = rs.getString("title");
      String artist = rs.getString("artist");
      String image = rs.getString("path");
      String description=rs.getString("description");

      %>

      <div style="display:inline-block; background-color: burlywood; padding:20px; text-align:center;">
        <img src="<%= image %>" alt="<%= title %>" style="width:250px; height:250px;">
        <h2 style="word-wrap: break-word; "> <%= title %> </h2>
        <p><strong><%= artist %> </strong></p>
        <p style="max-width: 350px; text-align:center;"> <%= description %> </p>

      </div>
<%

    }
    
    
    st.close();

 con.close(); } catch (Exception e) {
    e.printStackTrace();}
 }
    else{
      response.sendRedirect("galleryPage.jsp?id=1");
    }
  
   
} 


}


else{
    return;
}

      } else {
        response.sendRedirect("login.jsp");
      }
    } else {
      response.sendRedirect("login.jsp");
    }
  
 %>
</body>







</html>