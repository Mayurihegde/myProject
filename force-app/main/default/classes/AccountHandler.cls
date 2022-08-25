public class AccountHandler {
    public static Account insertNewAccount(String AccountName){
        
        //Trying merge conflicts
        //Hope it works:(
        //It's really working:)
        //Ok Bye
     
        //Trying merge conflicts
        //Hope it works
        //Yeah, it's working
        Account acct = new Account(Name=AccountName);

        try {
            insert acct;

        } catch (DMLException e){
            return null;
        }

        return acct;
    }


}
