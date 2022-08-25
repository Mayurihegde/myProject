public class magazineZone {
	 @AuraEnabled(Cacheable=true)
    public static List<Magazines__c> getAllMagazines() {
        List<Magazines__c> query = [SELECT Id, Name, Author__c, Category__c, Title__c FROM Magazines__c WHERE RecordTypeId =: Label.ReadersChoice];
        System.debug('@@@@@@@@@@@@query1@@@@@@@@@@@@@@@@@'+query);
        return query;
    }
    
    @AuraEnabled(Cacheable=true)
    public static List<Magazines__c> searchMagazines(String MagazineCategory) {
        // Execute search query
        System.debug('MagazineCategory'+MagazineCategory);
        List<Magazines__c> newQuery = [SELECT Id, Name, Author__c, Category__c, Title__c, Content__c, Description__c, Image_Url__c, Published_On__c, Source__c, Source_Url__c, Image__c FROM Magazines__c Where RecordTypeId =: Label.MagRecId];
        if (String.isNotBlank(MagazineCategory)) {
            return [SELECT Id, Name, Author__c, Category__c, Title__c, Content__c, Description__c, Image_Url__c, Published_On__c, Source__c, Source_Url__c, Image__c FROM Magazines__c Where RecordTypeId =: Label.MagRecId AND Category__c = :MagazineCategory]; 
        } 
        return newQuery; 
    }
    
    @AuraEnabled(cacheable=true)
   public static List<Magazines__c> getArticles( String searchKey) {
       //List<Magazines__c> query = [SELECT Id, Name, Author__c, Category__c, Title__c FROM Magazines__c WHERE RecordTypeId =: Label.ReadersChoice];
       
       if ( searchKey != null && searchKey != '' ) {
           String key = '%' + searchKey + '%';
           System.debug('key'+key);
           List<Magazines__c> query = [SELECT Id, Name, Author__c, Category__c, Title__c FROM Magazines__c WHERE RecordTypeId =: Label.ReadersChoice AND Name LIKE :key];
       		system.debug('query---'+query);
           return query;
       }
       return getAllMagazines();
   }
    
    @AuraEnabled
    public static List<Reviews__c> getAllReviews(Id magazineId) {
        System.debug('recordId'+magazineId);
        List<Reviews__c> reviewlist = [SELECT Id, Name, Review__c, Ratings__c, LastModifiedDate, CreatedDate, CreatedBy.Name, CreatedBy.SmallPhotoUrl, CreatedBy.CompanyName FROM Reviews__c WHERE Magazine__c =:magazineId];
        System.debug('query'+reviewlist);
        return [SELECT Id, Name, Review__c, Ratings__c, LastModifiedDate, CreatedDate, CreatedBy.Name FROM Reviews__c WHERE Magazine__c =:magazineId];
    }
    
    @AuraEnabled
    public static List<Magazines__c> deleteMultipleArticleRecord(List<String> articleObj){
        System.debug('test'+articleObj);
        List<Magazines__c> conObjItem = new   List<Magazines__c>();
      List<Magazines__c> conObjList = [Select Id, Name  From Magazines__c Where Id IN:articleObj];
      for(Magazines__c con:conObjList){
        conObjItem.add(con);
      }
      if(conObjItem.size()>0){
          try{
            delete conObjItem;           
          }
          catch (Exception exp) {
            throw new AuraHandledException(exp.getMessage());
        }
      }
      System.debug('test'+[SELECT Id, Name, Author__c, Category__c, Title__c FROM Magazines__c WHERE RecordTypeId =: Label.ReadersChoice]);
      return [SELECT Id, Name, Author__c, Category__c, Title__c FROM Magazines__c WHERE RecordTypeId =: Label.ReadersChoice]; 
    }
}