import java.util.*;

class Cal
{
  public static void main(String[] args) 
  {
	Scanner input= new Scanner(System.in);

	System.out.println("Please Enter Value 1 : ");
	int n1=input.nextInt();
	
	System.out.println("Please Enter Value 2 : ");
	int n2=input.nextInt();

		int ans=n1-n2;
		System.out.print("Result : ");
        	System.out.println(ans);
	 
  }
}