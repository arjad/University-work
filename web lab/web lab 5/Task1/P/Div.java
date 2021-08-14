package P;
import java.util.*;

public class Div
{
	public void display()
	{
		Scanner input= new Scanner(System.in);
		System.out.println("Enter no1 = ");
		int no1=input.nextInt();

		System.out.println("Enter no2 = ");
		int no2=input.nextInt();
		
		int ans= no1/no2;
		System.out.print("After Divison = ");
		System.out.println(ans);		
	}

}