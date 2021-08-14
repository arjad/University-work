import java.util.*;
class Publication{
    public String tittle;
    public float price;
    
     public void getdata()
	{
	Scanner input=new Scanner (System.in);
		System.out.print("Plz enter title here: ");
		title = input.nextLine();
		System.out.print("Plz enter price here: ");
		price = input.nextFloat();
	}
	public void putdata()
	{
		System.out.println("Title: "+title);
		System.out.println("Price: "+price);
	}
}

class Book extends Publication
{
    public int page_count;
	public void getdata()
	{
		super.getdata();
		Scanner input=new Scanner (System.in);
		System.output.print("Plz enter pages here : ");
		page_count = input.nextInt();
	}

	public void putdata()
	{
		super.putdata();
		System.out.println("No of pages are =  " + page_count);
	}
    
}
class Tape extends Publication
{
    public float time;
    public void getdata()
	{
		super.getdata();
		System.out.print("Plz enter minutes here : ");
		Scanner input=new Scanner (System.in);
		time=input.nextInt();
	}

	public void putdata()
	{
		super.putData();
		System.out.println("No of minute are =  " + time);
	}
}

public class body
{
	public static void main(String[] args)
	{
		Book b = new Book();
		Tape t = new Tape();
		b.getdata();
		b.putdata();	
		t.getdata();
		t.putdata();
		
	}
}






