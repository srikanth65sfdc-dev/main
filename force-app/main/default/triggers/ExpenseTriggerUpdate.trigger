trigger ExpenseTriggerUpdate on Expense__c ( before insert,before update,after insert,after update,after undelete){
    for(Expense__c exp:Trigger.New){
        if(exp.Email__c=='Blank'){
            exp.Email__c='Please fill the email field';
        }
        else{
             exp.Email__c ='  show the field as saved';
        }
    }
}