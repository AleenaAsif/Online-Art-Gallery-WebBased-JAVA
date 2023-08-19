import java.nio.file.Files;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.swing.*;

@WebServlet("/update")
@MultipartConfig

public class add extends HttpServlet {
 

  
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
       
        PrintWriter out= res.getWriter();

        String title = req.getParameter("title");
        String artist = req.getParameter("artist");
        String description = req.getParameter("description");
        Part imagePart = req.getPart("image");   // gets the image part from the request

        String fileName = imagePart.getSubmittedFileName();   //retrieves the original file name 

        System.out.println("filename "+ fileName);

        InputStream imageContent = imagePart.getInputStream();      //gets the binary content of the image

        File imageFile = new File("E:/apache-tomcat-8.5.40/webapps/WebProject/images/" + fileName);

        Files.copy(imageContent, imageFile.toPath());   // copy the binary content of the image to new file
      
       out.println("<html> <body>");

       HttpSession session=req.getSession(false);

       if(session!=null){

        try{ 
          
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1/galleryinfo";
            Connection con=DriverManager.getConnection(url,"root","root");
            Statement st= con.createStatement();
        
            String query= "INSERT INTO artworks(title,artist, description, path) VALUES('"+title+"', '"+artist+"','"+description+"',  'images//" +fileName+"')";

    
             int rs= st.executeUpdate(query);
    
            if(rs==1){
                res.sendRedirect("galleryPage.jsp?id=1");
            }
    
            else{
    
                out.print("Insertion failed");
            }
        
    
            }
    
            catch (Exception e){
    
                out.print(e);
            }
            
        }

        else{
            res.sendRedirect("login.jsp");
        }
    
    
            }
        
    
    
    }
    