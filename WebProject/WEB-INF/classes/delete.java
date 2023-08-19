import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.swing.*;

public class delete extends HttpServlet{

    public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
  
        PrintWriter out=res.getWriter();
    
        String title= req.getParameter("title");
      
        HttpSession session=req.getSession(false);
        if(session!=null){
         
            try {
                Class.forName("com.mysql.jdbc.Driver");

                String url="jdbc:mysql://127.0.0.1/galleryinfo";
           
                Connection con=DriverManager.getConnection(url, "root","root");
           
              
                PreparedStatement ps = con.prepareStatement("DELETE FROM artworks WHERE title = ? ");
              
                ps.setString(1, title);

                int r = ps.executeUpdate();

                if (r > 0) {
                 res.sendRedirect("galleryPage.jsp?id=1");
                }
                
                else {
                    out.println("deleion failed");
                System.out.println("deletion failed");
             }

                } catch (Exception e) {
             System.out.println(e);
}
               

        }
        else{
            res.sendRedirect("login.jsp");
        }

        }

}