import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.swing.*;

public class update2 extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        
        String old_title= req.getParameter("oldTitle");
         String newtitle = req.getParameter("newtitle");
        String artist = req.getParameter("artist");
        String description = req.getParameter("description");
        

       // System.out.println(old_title);

        HttpSession session=req.getSession(false);

        if(session!=null){
         
         //   System.out.println("hello from session");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://127.0.0.1/galleryinfo";
                Connection con=DriverManager.getConnection(url,"root","root");
                Statement st= con.createStatement();

                String query= "UPDATE artworks SET title= '"+newtitle+"', artist= '"+artist+"', description= '"+description+"' WHERE title = '"+old_title+"'";
             
                int rs= st.executeUpdate(query);
               
                if(rs>0){
                    System.out.println("done");
                    res.sendRedirect("galleryPage.jsp?id=1");
                }
                else{
                    System.out.print("Insertion failed");
                }
            } catch (ClassNotFoundException e) {
                System.out.println(e);

            } 
            catch (SQLException e) {
                System.out.println(e);
            }

        } 
        else{
            res.sendRedirect("login.jsp");
        }
    }
}
