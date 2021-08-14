import P.*;
import java.util.*;

class Cal
{
	public static void main(String args[])
	{
		System.out.println("-------Calculator-----");
		Scanner i= new Scanner(System.in);
		System.out.println("Press \n 1 for addition\n 2 for subtraction \n 3 for multplication \n 4 for divison");
		int input=i.nextInt();	
		
	if(input==1)
	{
		Add a=new Add();
		a.display();
	}	
	else if(input==2)
	{
		Sub s=new Sub();
		s.display();
	}	
	else if(input==3)
	{	
		Mul m=new Mul();
		m.display();
	}	
	else if(input==4)
	{
		Div d=new Div();
		d.display();				
	}
	}
}