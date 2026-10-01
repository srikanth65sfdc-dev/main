trigger ExpenseTrigger on Expense__c (before insert,before update,after insert,after update,after undelete){
    for(Expense__c exp:Trigger.New){
        if(exp.Mode_of_Payment__c=='cash'){
            exp.Description__c='Please upload relevant cash receipt and bill for the expense';
        }
        else{
            exp.Description__c='Please provide the bank details and upload relevant statement and bill for the expense';
            
        }
    }
}