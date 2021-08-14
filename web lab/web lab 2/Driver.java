import java.util.*;

class T1
{
	protected String name;
	protected String email;
	protected int salary;
	protected String company;
	
	T1(){}	//default ctor
	T1(String n,String e,int s,String c)//parametrize ctor
	{
		name=n;
		email=e;
		salary=s;
		company=c;	
	}
	
///////////////////////getter & setters ///////////////////
	public String getName()
	{
		return name;
	}
	public void setName(String newName)
	{
		this.name=newName;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String newEmail)
	{
		this.email=newEmail;
	}
	public int getSalary()
	{
		return salary;
	}
	public void setSalary(int newSalary)
	{
		this.salary=newSalary;
	}
	public String getCompany()
	{
		return company;
	}
	public void setCompany(String newCompany)
	{
		this.company=newCompany;
	}
//////// Display//////////////////
public void display()
	{
		System.out.println("\nEmp name : " + name);
		System.out.println("Emp E-mail : " + email);
		System.out.println("Emp salary : " + salary);
		System.out.println("Emp Company : " + company);
	} 
}

class Driver extends T1
{

 //////////// Main /////////////

  public static void main(String[] args) 
  {
	T1 obj=new T1();	//by getter setter
	obj.setName("arjad");
	System.out.println(obj.getName());	
	obj.setEmail("arjad@gmail.com");
	System.out.println(obj.getEmail());	
	obj.setSalary(10000);
	System.out.println(obj.getSalary());	
	obj.setCompany("best company");
	System.out.println(obj.getCompany());	
		
	T1[] Driver=new T1[5];		      //array of 5 elements
	Driver[0]= new T1("ali0","ali0@gamil.com",100,"company no 0");
	Driver[0].display();
	
	Driver[1]= new T1("ali1","ali1@gamil.com",100,"company no 1");
	Driver[1].display();
		
	Driver[2]= new T1("ali2","ali2@gamil.com",200,"company no 2");
	Driver[2].display();
		
	Driver[3]= new T1("ali3","ali3@gamil.com",300,"company no 3");
	Driver[3].display();
			
  }
}