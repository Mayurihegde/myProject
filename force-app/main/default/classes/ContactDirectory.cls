public class ContactDirectory {
    @AuraEnabled(cacheable = true)
    public static List<Magazines__c> getBestArticle(){
        List<Magazines__c> magList = [SELECT Id, Name, CreatedDate, Author__c, Description__c,(SELECT Id, Name, CreatedDate, Magazine__c FROM Reviews__r where CreatedDate = Last_N_Months:1), Source_Url__c, Rating__c, Image_Url__c, Content__c, Published_On__c, Category__c, Image__c, Title__c FROM Magazines__c Where CreatedDate = Last_N_Months:1 ORDER BY Rating__c DESC NULLS LAST LIMIT 1];
        System.debug('magList'+magList);
    	return magList;
    }
    /*@AuraEnabled(cacheable = true)
    public static List<Contact> getContactRecords(Id accountId){
        return [Select Id, Name, Title, Email, Department, Account.Name from Contact where AccountId = :accountId];
    }*/
}