import java.util.*;
abstract class Armstrong
{
    public abstract void armstrongnumber();
}
public class Subclass extends Armstrong //child class
{
    public void armstrongnumber()
    {
        int n;
        int counting = 0;
        int x, y, z;
        int s = 0;
        System.out.print("Armstrong numbers from 0 to 1000: \n");
        for(int i = 0; i <= 1000; i++)
        {
            n = i;
            while(n > 0)
            {
                y = n % 10;
                s = s + (y * y * y);
                n = n / 10;
            }
            if(s == i)
            {
                System.out.println(i);
            }
            s = 0;
        }
    }    
     public static void main(String []args)
     {
            Armstrong a = new Subclass();
            a.armstrongnumber();
          
     }
    
}
class Driver
{
       public static void main(String []args)
     {
            Subclass a = new Subclass();
            a.armstrongnumber();
          
     }
}