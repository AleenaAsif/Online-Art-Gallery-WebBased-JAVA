import myPack.infoBean;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;

public class signupB extends HttpServlet{
	
 public static void main(String args[]) {
	 
 }
public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
{
 //res.setContentType("text/html");


//getting field inputs from JSP page signup.jsp

 String username=req.getParameter("username");
 String password=req.getParameter("password");
  String password2=req.getParameter("password2");
 String email=req.getParameter("email");
 String phone=req.getParameter("phone");
 String type=req.getParameter("type");

 //System.out.println(password);
 //System.out.println(password2);


if(!password.equals(password2)){
   req.setAttribute("errorMsg","passwords do not match");
   RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
   rd.forward(req, res);
  
}
else{
 //server side validation

 if(username==null || password==null || email==null ||phone==null || type==null )
 {
   req.setAttribute("errorMsg","All fields are required");

   RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
   rd.forward(req, res);

 }
 else{

 String syntaxPattern = "^[A-Za-z0-9.]+@[A-Za-z0-9]+\\.[A-Za-z]{2,}$";

 if(email.matches(syntaxPattern)){
 

//setting information in infoBean class

 infoBean user=new infoBean();
 user.setUsername(username);
 user.setPassword(password);
 user.setEmail(email);
 user.setPhone(phone);
 user.setType(type);

 try{
    Class.forName("com.mysql.jdbc.Driver");
 
    String url="jdbc:mysql://127.0.0.1/galleryinfo";
   
    Connection con=DriverManager.getConnection(url,"root","root");
   
    //Statement st=con.createStatement();


    PreparedStatement ps=con.prepareStatement("SELECT * FROM info WHERE email=?");
    ps.setString(1,user.getEmail());

    ResultSet rs = ps.executeQuery();

    if(rs.next()){
    
      req.setAttribute("errorMsg","This email address is already registered");

      RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
      rd.forward(req, res);
   


    }
    else{

     ps=con.prepareStatement("INSERT INTO info(username, password, email, phone, type) VALUES (?, ? ,? , ?, ?)");


    ps.setString(1,user.getUsername());
    ps.setString(2, user.getPassword());
    ps.setString(3, user.getEmail());
    ps.setString(4, user.getPhone());
    ps.setString(5, user.getType());

    int r= ps.executeUpdate(); 
   
    if(r==1){

        HttpSession session=req.getSession(true);
        session.setAttribute("username",username);
        session.setAttribute("type",type);
        
        if(type.equals("admin"))
       { 
        res.sendRedirect("galleryPage.jsp?id=1");
     }
     else if(type.equals("user")){
       res.sendRedirect("galleryPage.jsp?id=2");
     }
    
     else{
        res.sendRedirect("signup.jsp");
     }
    
     
    
     ps.close();
    
     con.close();
    
    }
   }
}

catch(Exception e){

   System.out.println(e);
}

}

 
else{

   req.setAttribute("errorMsg", "Invalid email syntax, try again");
   RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
   rd.forward(req, res);

}
}
}
}
}
