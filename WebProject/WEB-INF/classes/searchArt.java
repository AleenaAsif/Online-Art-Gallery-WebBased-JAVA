import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.swing.*;

public class searchArt extends HttpServlet{

 public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
  
    //PrintWriter out=res.getWriter();

    String name=req.getParameter("searchName");
    HttpSession session=req.getSession(false);
    
    if(session!=null){


    try{

     Class.forName("com.mysql.jdbc.Driver");

     String url="jdbc:mysql://127.0.0.1/galleryinfo";

     Connection con=DriverManager.getConnection(url, "root","root");

     Statement st=con.createStatement();

     String query="select * from artworks where title='"+name+"'";

     ResultSet rs=st.executeQuery(query);
    
     if(rs.next()){ 

       
         String artist = rs.getString("artist");
        String title = rs.getString("title");
        String path = rs.getString("path");
        String description = rs.getString("description");

        session.setAttribute("artist", artist);
        session.setAttribute("title", title);
        session.setAttribute("path", path);
        session.setAttribute("description", description);
        
        res.sendRedirect("searchResult.jsp?id=1");
     }
     else{
        res.sendRedirect("searchResult.jsp?id=2");
     }
    


    }
    catch(Exception ex)
    {
       System.out.println(ex);
    }
    }


 }
}









