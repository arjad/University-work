import java.util.*;
import java.io.*;

class Bank implements java.io.Serilizable
{
	public String name;
	public int account_no;
	public int pin_code;
        public double balance;

	public Bank()	//// ctor
	{
		name="";
		account_no=0;
		pin_code=0;
		balance = 1000.0;	////default value	
	}

	public Bank(String n,int ano, int pin, double b)	////parametrize ctor
	{
		name=n;
		account_no=ano;
		pin_code=pin;
		balance=b;
	}

	public void transfer( double amount )
	{
		System.out.println("   Transfer Ammount   ");
		balance = balance - amount;
		System.out.println("Sender Remaining Balance = " + balance );
		
		balance = balance + amount;
		System.out.println("  Reciever  Remaining Balance = " + balance);
	}

	public double withdraw( double amount )
	{
			System.out.println("   WithDraw   ");
		if(amount <= balance)
		{
			balance = balance - amount;
		}
		else
		{
			System.out.println("WithDraw not possible, you donot have enough balance ");
		}
		System.out.println("Balance after WithDraw = " + balance);
	return balance;		
	}

	////getter setter
	public String getname()
	{
                return name;
	}
	public int getaccountno()
	{
                return account_no;
	}
	public int getpin()
	{
                return pin_code;
	}
	public double getbalance()
	{
                return balance;
	}

}
public class Driver
{
  public static void main(String args[])
  {
		Driver d= new Driver();

        	Bank obj1 = new Bank();
    		d.write(obj1);
        	Bank obj2 = new Bank("Arjad", 12345678,123, 0);
    		d.write(obj2);

		ArrayList acc = new ArrayList();
		acc.add(obj1);
		acc.add(obj2);	
		
		System.out.println("The size of arraylist: " + acc.size());

		////output obj
		int i=0;
		///int size = ;
		while( i < acc.size())
		{
			Bank obj = (Bank) acc.get(i);
			

			String n = obj.getname();
			int a = obj.getaccountno();
			int p = obj.getpin();	
			double b = obj.getbalance();

			System.out.println(" ==Account no ( " + i + " ) info");
			System.out.println("\t\tNAME = " + n);
			System.out.println("\t\tACCOUNT NO = " + a);
			System.out.println("\t\tPinCode = " + p);
			System.out.println("\t\tBalance = " + b);

			if(b <= 0)
			{
				System.out.println("  Deleteing Account  "+ obj.getname());
				acc.remove(i);			
			}

		i++;
		} 


  }
  public void write(Object o) 
  {
        try 
	{
            FileOutputStream fileOut = new FileOutputStream("text.txt");
            ObjectOutputStream objectOut = new ObjectOutputStream(fileOut);
            objectOut.writeObject(o);
            objectOut.close();
            System.out.println("---written---");
 
        }
	catch (Exception ex) 
	{
            ex.printStackTrace();	////exception
  	}
  }
} 