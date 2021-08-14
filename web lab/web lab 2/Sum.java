import java.util.*;

class Sum
{
  public static void main(String[] args) 
  {
	Scanner input= new Scanner(System.in);
	int n1=0;
	int n2=0;
	
	while(n1!=-1)
	{
	 System.out.println("Enter Number 1 : ");
	 n1=input.nextInt();
	
	 System.out.println("Enter Number 2 : ");
	 n2=input.nextInt();

		int sum=n1+n2;
		System.out.println("Sum is  " + sum);
	}
  }
}