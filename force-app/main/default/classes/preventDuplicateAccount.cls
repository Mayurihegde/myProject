public class preventDuplicateAccount {
    public static void beforeInsert(List<Account> acc){
        Set<String> nameSet = new Set<String>();
        for(Account acc1 : acc){

            nameSet.add(acc1.name);

        }

        List<Account> acnt= new List<Account>([SELECT Id, Name FROM Account Where Name IN: nameSet]);
       
        for(Account a:acnt) {
            if(acnt.size() > 0 ) {
                a.addError('Account already exists in your Organization with name ');
                    }
        }
    }
}