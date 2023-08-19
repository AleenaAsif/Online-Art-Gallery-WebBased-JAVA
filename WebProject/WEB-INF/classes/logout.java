import java.io.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;

public class logout extends HttpServlet{

public void doGet (HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {        
   

   HttpSession session=request.getSession(false);
   if(session!=null )
   {
    session.invalidate();
    response.sendRedirect("login.jsp");
   }
   else if(session==null)
   {
    response.sendRedirect("login.jsp");
   }
}
}