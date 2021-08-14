import java.sql.*; 
import java.util.*;

public class Web
{
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
		url= "jdbc:mysql://localhost/arjad";
		con=DriverManager.getConnection(url,"root","root");
		s=con.createStatement();
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
	
//////////////////////////////////////////////////////////////////////////////////////
	public void signin(String email,String password)
	{
		try
		{
			query=" select * from info where email = '"+email+"' and password= '" + password + "' " ;
			rs = s.executeQuery(query);
		
			if (rs.next())
			{
				System.out.print("====  Login Successful  ==== \n\n");		
				System.out.print("Login INFO\n");
	
					String emails = rs . getString(1);
					String passwords = rs .getString(2);
					String fname = rs. getString(3);
					String lname = rs. getString(4);	
					String gender = rs .getString(5);
					java.sql.Date date=rs .getDate(6);

				System.out.println(" First Name= "+fname +"\n Last Name =  "+ lname + "\n Email = "+ emails +"\n Password=   " + passwords +"\n Gender = "+ gender+" \n Date of Birth = "+date);
			}
		}
		catch(Exception ex)
		{
			System.out.println("ERROR !!! \t" +ex);
		}
		
	}


//////////////////////////////////////////////////////////////////////////////////////	
	public void createaccount(String email,String password, String fname,String lname, String gender,String dates)
	{ 	
		System.out.print("====  Create Account  ==== \n\n");	
		try
		{
			query="insert into info(email,password,f_name, l_name, gender, date_of_birth) values ('"+ fname +"', '" + lname+"', '"+ email+"', '"+ password+"' , '" + gender +"' , '" + dates +"' )";
			rs_i = s.executeUpdate(query);
		}
		
		catch(Exception ex)
		{
			System.out.print("\n Account Exists Already");
		}
		if(rs_i > 0)
		{
			System.out.print("\n Account Created in DATABASE\n");
		}
     		else
		{	
			System.out.print("Account Exists Already\n");
        	}
	}

//////////////////////////////////////////////////////////////////////////////////////	
	public void updateprofile(String e_mail,String value,int c)
	{
		System.out.print("====  Update Profile  ==== \n\n");	
		if (c == 1)
		{
			query = "update info set email='"+ value +"' where email= '"+ e_mail +"' ";
		}
		else if (c == 2)
		{
			query = "update info set password='"+ value +"' where email= '"+ e_mail +"' ";	
		}	
		else if (c == 3)
		{
			query = "update info set f_name='"+ value +"' where email= '"+ e_mail +"' ";
		}
		
		else if (c == 4)
		{
			query = "update info set l_name='"+ value +"' where email= '"+ e_mail +"' ";
		}
		
		else if (c == 5)
		{
			query = "update info set gender='"+ value +"' where email= '"+ e_mail +"' ";
		}
		
		
		try
		{
			rs_i = s.executeUpdate(query);
		}
		
		catch(Exception ex)
		{
			System.out.println(" ERROR !!! " + ex);
			return;
		}
		


		if(rs_i > 0)
		{
			System.out.print("\n  Account Updated\n");
		}
     		else
		{
			System.out.println("\n Cannot Update \n");
       		}
		
	}
	

//////////////////////////////////////////////////////////////////////////////////////	
	public static void main(String []args)
	{
		Web w = new Web();
        	w.database();
		
		int choice;
		System.out.print("Press 1 for sign up or create account \n\t2 for login \n\t 3 for updating");
		Scanner i= new Scanner(System.in);
		choice = i.nextInt();
		
		if(choice == 1)
		{
		w.createaccount("ahmad@pucit","789","ahmed","ali","male","2002-03-11");
		}
		else if(choice ==2)
		{
		w.signin("arjad@pucit","123");
		}     	
		else if(choice ==3)
		{
		w.updateprofile("ahmed@pucit","ahmed",3);
		}
	}
	
}

