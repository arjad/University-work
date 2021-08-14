import javax.swing.*;
import java.util.*;
class Store
{
	String inds,sizes;
	int ind,size;
	int[] arr;

	Scanner i=new Scanner(System.in);

	Store()	///ctor
	{
		sizes=JOptionPane.showInputDialog(null, "Please enter array size = ");
		size= Integer.parseInt(sizes);

		arr=new int[size];
	}

	public void store() throws ArrayIndexOutOfBoundsException
	{
		System.out.println("\nStore Function");
		inds=JOptionPane.showInputDialog("Please enter index = ");
		ind=Integer.parseInt(inds);		

		System.out.print("Please enter value for that index = ");
		arr[ind]=i.nextInt();
	}

	public void print()
	{
		System.out.println("\nPrint Function");
		for(int i=0;i<arr.length;i++)
		{
			System.out.println(arr[i]);
		}
	}
}

public class Task2
{
	public static void main(String[] args)
	{
		Store s = new Store();
		try
		{
			s.store();
		}
		catch(ArrayIndexOutOfBoundsException Ex)
		{
			System.out.println("\tERROR = \n\tIndex is out of Bound of Array !!!");	
		}

	s.print();	
	}
}