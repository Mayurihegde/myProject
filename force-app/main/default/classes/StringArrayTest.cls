public class StringArrayTest {
 public static String [] generateStringArray(integer size)
    {   
        String [] locStrArray = new String [size];

        //set values in array...
        for (integer i = 0; i < size; i++)
        {
            locStrArray[i] = 'Test ' + i;
        }    

        //display array...
        for (integer i = 0; i < size; i++)
        {
            System.debug(locStrArray[i]);       //when in doubt, system out...
        }   

        return locStrArray;
    }
}