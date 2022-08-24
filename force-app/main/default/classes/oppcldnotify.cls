global class oppcldnotify implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext opcldnf){
        Return Database.getQueryLocator('SELECT CloseDate,Id,Name,Owner.Email FROM Opportunity WHERE CloseDate < Today AND IsClosed = False');
    }
    global void execute(Database.BatchableContext opcldnf, List<Opportunity> oplst){
        List<Messaging.SingleEmailMessage> mailslst = new List<Messaging.SingleEmailMessage>();
        List<String> toAddress = new List<String>();
        for(Opportunity op :oplst){
            toAddress.add(op.Owner.Email);
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(toAddress);
            mail.setSenderDisplayName('From Salesforce');
            mail.setSubject('Opportunity Status');
            mail.setHtmlBody('Dear Sir /Madam,<br/></br>Your Opportunity Close Date is expired.Please take an action</br></br>Thanks & Regards,</br></br>Salesforce');
            mailslst.add(mail);
        }
        Messaging.sendEmail(mailslst);
    }
    global void finish(Database.BatchableContext opcldnf){
    }    
    
}