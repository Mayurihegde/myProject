@isTest
public class UnitOfWorkTest {
    @isTest static void challengeComplete(){
        fflib_SObjectUnitOfWork workUnit = new fflib_SObjectUnitOfWork(
            new Schema.SObjectType[]{
                Account.SObjectType,
                Contact.SObjectType,
                Note.SObjectType
            }
        );
       
        for (Integer i=1; i<=100 ; i++) {
            Account acc = new Account();
            acc.Name = 'Test Acct' + i;
             workUnit.registerNew(acc);
        }
       
          for (Integer i=1; i<=500 ; i++) {
           Contact con = new Contact();
            con.LastName = 'Last Test' + i;
             workUnit.registerNew(con);
             
              Note myNote = new Note();
              myNote.Title = 'Note title' + i;
              workUnit.registerNew(myNote,Note.ParentId, con);
            }
     
       
        test.startTest();
        workUnit.commitWork();    
        test.stopTest();
       
        System.assertEquals(100, [Select Id from Account].size());
        System.assertEquals(500, [Select Id from Contact].size());
        System.assertEquals(500, [Select Id from Note].size());
    }
}