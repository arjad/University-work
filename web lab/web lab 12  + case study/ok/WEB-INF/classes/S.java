import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;

public class S extends HttpServlet 
{

public void doGet(HttpServletRequest request, HttpServletResponse response){
try{
response.setContentType("text/html");
PrintWriter pwriter = response.getWriter();

	Cookie c= new Cookie("key","value");

    String e = request.getParameter("s_e" );
    String pass = request.getParameter("s_pass" );

pwriter.print("\nemail : " + e);
pwriter.print("\npassword: "+pass);


HttpSession session=request.getSession();
session.setAttribute("usname",e);
session.setAttribute("uspass",pass);

//pwriter.print("\nId ="+ session.getID());
pwriter.print("\n is new ="+ session.isNew());
pwriter.print("\n create time ="+ session.getCreationTime());

pwriter.print("\n <a href='Servlet2'>view details</a>");
pwriter.close();
}
catch(Exception exp)
{
System.out.println(exp);
}


}
}