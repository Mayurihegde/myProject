trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    List<Task> Assigntask =new List<Task>();
for (Opportunity opp:[Select ID,StageName from Opportunity where ID IN :Trigger.New])

 

If (opp.StageName =='Closed Won')
{
Task t=new Task();
t.Subject='Follow Up Test Task';
t.WhatId=opp.ID;
Assigntask.add(t);
}
insert Assigntask;
     
 }