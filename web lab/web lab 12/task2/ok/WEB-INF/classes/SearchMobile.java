import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*; 
import java.util.*;

public class SearchMobile extends HttpServlet {

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
		url= "jdbc:mysql://localhost/mobileinfo";
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
	public void add(String c,String m, String p)
	{ 	
		System.out.print("====  Enter in DataBase  ==== \n");	
		try
		{
			query="insert mobileoutlet(Compnyname, Model, Price) values ('"+ c +"', '" + m +"', '"+ p +"')";
			rs_i = s.executeUpdate(query);

				System.out.print("\nafter entering\n");
				System.out.println(" Company = "+ c );
				System.out.println(" Model = "+ m );
				System.out.println(" Price = "+ p + rs_i );
		}
		catch(Exception ex)
		{
			System.out.print("\n Error - Exception");
		}
	}

public static void main(String []args)
	{
		SearchMobile w = new SearchMobile();
        	w.database();
					
		w.add("blah blah","2222","5550");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{        
    //response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String c = request.getParameter("comp");
    String m = request.getParameter("mod");
    String p = request.getParameter("pr" );

    out.println("<html>");
    out.println("<head>");
    out.println("<title>Sign up </title>");
    out.println("</head>");
    out.println("<body>");

    out.println("<p>Company=  " + c + " </p>");
    out.println("<p>Model =  " + m + " </p>");
    out.println("<p>Price =  " + p + " </p>");

    out.println("</body>");
    out.println("</html>");
    out.close(); 
	}
}