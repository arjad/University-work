public class T5
{
    public static void main(String[] args) 
    {
        int n;
        int counting = 0;
        int x, y, z;
        int s = 0;
        System.out.print("Armstrong numbers from 1 to 1000: \n");
        for(int i = 1; i <= 1000; i++)
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
                System.out.print(i+"\n");
            }
            s = 0;
        }
    }
}