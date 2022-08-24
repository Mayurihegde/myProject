trigger Contrigger on Contact (before insert) {
    set<id> idset = new set<id>();
    for(Contact con: Trigger.new){
        idset.add(con.Id);
    }
    List<Contact> conLst = [Select Id, AccountId, Primary__c from Contact Where AccountId IN: idset];
    for(Contact cn: conLst){
        if(idset.size() == 0){
            cn.Primary__c = True;
        }
        else {
            cn.Primary__c = False;
        }
    }
}