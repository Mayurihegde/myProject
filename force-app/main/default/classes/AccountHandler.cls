public class AccountHandler {
    public static Account insertNewAccount(String AccountName){
        //Ok Bye
        //Finally, it's working
        Account acct = new Account(Name=AccountName);

        try {
            insert acct;

        } catch (DMLException e){
            return null;
        }

        return acct;
    }


}
