public class ContactAndLeadSearch {
     public static List<List<SObject>> searchContactsAndLeads (String a){
        
        
        Account acct = new Account(Name = 'whatever inc');
        insert acct;
        ID acctID = acct.ID;
        Contact ct = new Contact(lastname = 'Smith', AccountId=acctID);
        insert ct;
        Lead ld = new Lead(lastname = 'Smith', Company = 'ACD company');
        insert ld;
        
        List<List<sObject>> searchList = [FIND :a IN NAME Fields RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        
        return searchList;
    }

}