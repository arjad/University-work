import java.util.*;
import javax.swing.*;

class Number
{
	public float CalculatQuotiant(int n, int d) throws Exception
	{
		if(d == 0)
		{
			throw new e();
		}	
		else if(n == 0)
		{
			float ans=0;
		}	
		else
		{
			return (n/d);
		}
		return (n/d);
	}
}
class e extends Exception	////access exception class
{
	public String Msg()
	{
		return("cannot divide by 0");	
	}
}
public class Task3
{
	public static void main(String[] args)
	{
		Number obj=new Number();
		String n_s;
		String d_s;
		int n;
		int d;
		float ans;
		//Scanner i = new Scanner(System.in);
		
		n_s=JOptionPane.showInputDialog("Please enter numenator = ");
		n=Integer.parseInt(n_s);		

		d_s=JOptionPane.showInputDialog("Please enter denomenator= ");
		d=Integer.parseInt(d_s);		

		try
		{
		ans=obj.CalculatQuotiant(n,d);
		System.out.print("Answer in Float = " );
		System.out.print(ans);
		}
		catch(Exception ex)
		{
			System.out.println("ERROR = " + ex + "\n\n");
		}
	}

}