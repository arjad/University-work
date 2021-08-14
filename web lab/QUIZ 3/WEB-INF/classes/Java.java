import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*; 
import servlet.http;
import java.util.*;

public class Java extends HttpServlet {

	String url,query;
	Statement s;
	Connection con;
	ResultSet rs;
	int rs_i;

	public void database()
	{
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		url= "jdbc:mysql://localhost/university";
		con=DriverManager.getConnection(url,"root","root");
		s=con.createStatement();
		System.out.print(url);
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
//////////////////////////////////////////////////////////////////////////////////////	

public static void main(String []args)
	{
		Java w = new Java();
        	w.database();

	Cookie cook= new Cookie(String k, String val);
	out.println(cook);
	

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{        
    //response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String n = request.getParameter("comp");

    out.println("<html>");
    out.println("<head>");
    out.println("<title>html page </title>");
    out.println("</head>");
    out.println("<body>");

    out.println("<p> user name =  " + n + " </p>");

    out.println("</body>");
    out.println("</html>");
    out.close(); 
	}
}