import java.util.*;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Login
{
void details()
{
	FileInputStream fin=null;
	BufferedInputStream bin= null;
	try
	{
	fin= new FileInputStream("client.txt");
	bin= new BufferedInputStream(fin);
	int ch=0;
	while((ch=bin.read())>-1)
	{	
		System.out.print((char)ch);
	}
	}
	catch(IOException ex)
	{
		System.out.print("ERROR\n");
	}	
}

void search() 
{
        Scanner obj=new Scanner(System.in);
             
        String word;
	String line="";
	FileReader f_reader=null;
        
        System.out.print("Enter ID or Name to search client details = ");
        word=obj.nextLine();       
        
        try{
           f_reader=new FileReader("client.txt");
           BufferedReader b_reader=new BufferedReader(f_reader);           
           
           do
	   {
            if(line.contains(word))
          	System.out.println(line);
           
           }while((line=b_reader.readLine())!=null);
        }
        catch (IOException ex) 
	{            
	     System.out.println("ERROR " + ex.getMessage());
        }                   
        finally
	{            
                try 
		{
                    f_reader.close();
                }
		 catch (IOException ex) 
		{
		    ex.getMessage();
                } 
	} 
}



void delete() 
{
        Scanner obj=new Scanner(System.in);
             
        String word;
	String line="";
	FileReader f_reader=null;
        
        System.out.print("Enter ID or Name to DELETE client details = ");
        word=obj.nextLine();       
        
        try{
           f_reader=new FileReader("client.txt");
           BufferedReader b_reader=new BufferedReader(f_reader);           
           
           do
	   {
            if(!line.contains(word))
            { 	System.out.println(line);


		ArrayList <String> elements = new ArrayList<>();
		elements.add(line);

		try 
		{
            	FileWriter writer = new FileWriter("client2.txt", true);
        
			for (int i = 0; i < elements.size(); i++) 
	    		{
	   	 	String value = elements.get(i);
	     		writer.write(value + "\n");
        	    	}
	
		writer.close();
        	} 
		catch (IOException e) 
		{
            	e.printStackTrace();
        	} 
	    }
           
           }while((line=b_reader.readLine())!=null);
        }
        catch (IOException ex) 
	{            
	     System.out.println("ERROR " + ex.getMessage());
        }            
        finally
	{            
                try 
		{
                    f_reader.close();
                }
		 catch (IOException ex) 
		{
		    ex.getMessage();
                } 
	} 
}


void c1() 
{
	String line="";
	FileReader f_reader=null;
     
        try
	{
           f_reader=new FileReader("event.txt");
           BufferedReader b_reader=new BufferedReader(f_reader);           
           
           do
	   {
	            if(line.contains("client1"))
        	  	System.out.println(line);
			

           }while((line=b_reader.readLine())!=null);
        }
        catch (IOException ex) 
	{            
	     System.out.println("ERROR " + ex.getMessage());
        }                    
        finally
	{            
                try 
		{
                    f_reader.close();
                }
		 catch (IOException ex) 
		{
		    ex.getMessage();
                } 
	} 
}
void c2() 
{
	String line="";
	FileReader f_reader=null;
     
        try
	{
           f_reader=new FileReader("event.txt");
           BufferedReader b_reader=new BufferedReader(f_reader);           
           
           do
	   {
	            if(line.contains("client2"))
        	  	System.out.println(line);
			

           }while((line=b_reader.readLine())!=null);
        }
        catch (IOException ex) 
	{            
	     System.out.println("ERROR " + ex.getMessage());
        }                    
        finally
	{            
                try 
		{
                    f_reader.close();
                }
		 catch (IOException ex) 
		{
		    ex.getMessage();
                } 
	} 
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public static void main(String args[])
{	
	Login obj=new Login();
	Scanner i= new Scanner(System.in);

	////input////
	System.out.print("Enter Login ID = ");	
	String i1 = i.nextLine();
	System.out.print("Enter Password = ");
	String i2 = i.nextLine();
	



	if(i1.equals("admin") && i2.equals("123"))
	{
		System.out.println("=== ADMIN ===");	
		System.out.println("Press    1 for client details\n\t2 for search details\n\t 3 for delete details");	
		int choose= i.nextInt();
		if(choose==1)
		{
		System.out.println("=== Customer Details ===");	
		obj.details();						
		}
		else if(choose==2)
		{
		System.out.println("=== Search Details ===");	
		obj.search();
		}
		else if(choose==3)
		{
		System.out.println("=== Delete Details ===");	
		obj.delete();
		}
		else 
		{
		System.out.println("Wrong choice");		
		}

	}



	else if(i1.equals("client1") && i2.equals("123"))
	{
		System.out.println("=== CLIENT 1 EVENTS===");	
		obj.c1();
	}
	else if(i1.equals("client2") && i2.equals("123"))
	{
		System.out.println("=== CLIENT 2 EVENTS===");
		obj.c2();	
	}
	else
	{	
		System.out.print("ERROR- Wrong ID or Password ");
	}		
}
}