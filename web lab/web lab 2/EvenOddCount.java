public class EvenOddCount
{
 public static void main(String[] args)
 {
	int[] arr = {5, 7, 2, 4, 9};
	int even = 0;
	int odd = 0;
	
	System.out.print("Original Array:  ["); 
    	for(int i = 0; i < arr.length; i++) 
	{
		System.out.print(arr[i]);
		System.out.print(", "); 
	}
	System.out.println("]");
    	for(int i = 0; i < arr.length; i++) 
	{
        	if(arr[i] % 2 == 0)
		{         
          		even++;
		}
		else if(arr[i] % 2 != 0)
		{
			odd++;
		}	
   	}
            
    	System.out.println("Count of even numbers : " + even);
	System.out.println("Count of odd numbers : " + odd);
  }
}