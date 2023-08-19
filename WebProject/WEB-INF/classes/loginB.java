import myPack.infoBean;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;


public class loginB extends HttpServlet {

	 public static void main(String args[]) {
		 
	 }
  
  public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    
    PrintWriter out = res.getWriter();

    String username=req.getParameter("username");
    String password=req.getParameter("password");

    //server side validation of input
    
    if (username == null || password==null) {
      req.setAttribute("errorMessage", "all fields required");
      res.sendRedirect("login.jsp");
    }
    
    infoBean user=new infoBean();
    user.setUsername(username);
    user.setPassword(password);
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
    
        String url = "jdbc:mysql://127.0.0.1/galleryinfo";
    
        Connection con=DriverManager.getConnection(url,"root","root");
    
        Statement st=con.createStatement();
          
        PreparedStatement ps=con.prepareStatement("SELECT * FROM info where username= ? AND password=?");


        ps.setString(1,user.getUsername());
        ps.setString(2, user.getPassword());

        ResultSet rs=ps.executeQuery();

        if(rs.next()){
            String type=rs.getString("type");
    
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
          }
            else{
              req.setAttribute("errorMessage", "Invalid username or password");
                    RequestDispatcher rd= req.getRequestDispatcher("login.jsp");
              rd.forward(req,res);
            }
        
          
        
          }
          catch(Exception e){
        
              out.println(e);
            }
        
          }
        
        }