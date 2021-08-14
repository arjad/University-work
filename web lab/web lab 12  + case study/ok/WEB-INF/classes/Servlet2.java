import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Servlet2 extends HttpServlet 
{
public void doGet(HttpServletRequest request, HttpServletResponse response){
try
{
response.setContentType("text/html");

PrintWriter pwriter = response.getWriter();
HttpSession session=request.getSession(true);

String N=(String)session.getAttribute("usname");
String P=(String)session.getAttribute("uspass");

pwriter.print("Name: "+ N +"\n Pass: "+P);
pwriter.close();
}
catch(Exception exp)
{
System.out.println(exp);
}
}
}