import java.util.*;

interface Student1
{		
	public void setname(String var1);
	public void setroll(String var2);
	public void setcgpa(double var3);
	public String getName();
	public String getRollnumber();
	public double getcgpa();
	public void showdata();
}
class Student2 implements Student1
{
	public String name, roll;
	public double cgpa;

	public void setname(String var1)
	{
		name=var1;
	}
	public void setroll(String var2){
		roll=var2;
	}
	public void setgpa(double var3){
		cgpa=var3;
	}


	public String getname(){
		return name;
	}
	public String getroll(){
		return roll;
	}
	public double getcgpa(){
		return cgpa;
	}
	public void showData()
	{
		System.out.println("Your Name is  = " + name);
		
		System.out.println("Your Rollis= " +  roll);
	System.out.println("Your CGPA is = "  + cgpa);
	}
		public static void main(String[] args)
	{
		Student1 obj;		
		obj = new Student2();		
		obj.setname("ARJAD");
		obj.setroll("BITF18M525");
		obj.setcgpa(4.00);	
		obj.showdata();
	}
}

public class Student
{
	public static void main(String[] args)
	{
		Student1 obj;		
		obj = new Student2();		
		obj.setname("ARJAD");
		obj.setroll("BITF18M525");
		obj.setcgpa(4.00);	
		obj.showdata();
	}
}









