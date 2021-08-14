import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
public class Lab extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{        
    PrintWriter out = response.getWriter();

    String n = request.getParameter("name");
    String p = request.getParameter("pass");
    String m = request.getParameter("m");  
    String f = request.getParameter("f");  
    String age = request.getParameter("age");
    String java = request.getParameter("java");
    String cplus = request.getParameter("cplus");
    String sharp = request.getParameter("sharp");

    String i = request.getParameter("inst");

    out.println("<html>");
    out.println("<head>");
    out.println("<title>Lab 12</title>");
    out.println("</head>");
    out.println("<body>");

    out.println("<p>Name= " + n + "     </p>");
    out.println("<p> Password= " + p +"</p>");

 out.print("<p> Gender = </p>");
	if(m.equals("on"))
	{
    	out.print("<p>   MALE </p>");
	}
	if(f.equals("on"))
	{
    	out.print("<p>   Female </p>");
 	}
   	
  out.println("<p>age="+age+"</p>");

  out.print("<p>Languages = </p>");
		
	if(java.equals("on"))
	{
	out.print("<p>     java </p>");
 	}
	if(cplus.equals("on"))
	{
    	out.print("<p>     c ++  </p>");
 	}
	if(sharp.equals("on"))
	{
    	out.println("<p>   c # </p>");
 	}
 
    out.println("<p> Instructions= "+i+"</p>");
    
    out.println("</body>");
    out.println("</html>");
    out.close(); 	
	}
}