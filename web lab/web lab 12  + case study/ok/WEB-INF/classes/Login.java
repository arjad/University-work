import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*; 
import java.util.*;

public class Login extends HttpServlet {

	String url;
	String query,query2,query3;
	Statement st;
	Connection con;
	ResultSet rs;
	int rs_i;

	public void database()
	{
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		url= "jdbc:mysql://localhost/cms";
		con=DriverManager.getConnection(url,"root","root");
		st=con.createStatement();
		System.out.print("DB connection established \n");
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
//////////////////////////////////////////////////////////////////////////////////////	
	public void signup(String n,String j, String s,String ph,String e, String pass)
	{ 	
		System.out.print("\n====  Enter in DataBase  ==== \n");	
		try
		{
			query="insert profile(name, job, semester, phone_no, email, password) values ('"+ n +"', '" + j +"', '"+ s +"', '"+ ph +"', '"+ e +"', '"+ pass +"')";
			rs_i = st.executeUpdate(query);

			query2="insert authentication(email, password, user_type) values ('"+ e +"', '"+ pass +"', '"+2+"')";
			rs_i = st.executeUpdate(query2);

			query3="select email,password,user_type from authentication where email='"+ e +"' and password='"+ pass +"'";
			rs = st.executeQuery(query3);

				System.out.print("\n after entering\n");

				System.out.println(" name = " + n);
				System.out.println(" job = " + j);
				System.out.println(" semester = " +s);
				System.out.println(" ph no = " + ph);
				System.out.println(" email = " + e);
				System.out.println(" password = " + pass);
				System.out.println("______________________");

		}
		catch(Exception ex)
		{
			System.out.print("\n Error (signup) - Exception");
		}
	}

public static void main(String []args)
	{
		System.out.println("__java main__");

		Login w = new Login();
        	w.database();
					
		w.signup("arjad", "IT" , "6" , "23891231", "arjad@gmail.com", "123");
	}


///////////// post //////////

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{        
    //response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String ut = request.getParameter("ut");

    String n = request.getParameter("s_n");
    String j = request.getParameter("s_job");
    String s = request.getParameter("s_sem" );
    String ph = request.getParameter("s_ph" );
    String e = request.getParameter("s_e" );
    String pass = request.getParameter("s_pass" );

    out.println("<html>");
    out.println("<head>");
    out.println("<title>Sign up </title>");
    out.println("</head>");
    out.println("<body>");

    out.println("<p> <b>name =</b>  " + n + " </p>");
    out.println("<p><b> job =  </b>" + j + " </p>");
    out.println("<p><b> s =  </b>" + s + " </p>");
    out.println("<p><b> ph =  </b>" + ph + " </p>");
    out.println("<p><b> e =  </b>" + e + " </p>");
    out.println("<p><b> pass =  </b>" + pass + " </p>");

    out.println("all above info is added into DB <br> now you can login with new email and password");
    out.println("<a href='http://localhost:8089/ok/login.html'>go to main page-- LOGOUT </a>");
    out.println("<a href='S'>servlets </a>");

    out.println("</body>");
    out.println("</html>");
    out.close(); 
	}

}