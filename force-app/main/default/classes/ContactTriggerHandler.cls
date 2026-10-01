public class ContactTriggerHandler {
    public Static void updateTotalContacts(List<Contact> conList){
        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        for(Contact con:conList){
            if(con.AccountId!=null){
                accIds.add(con.AccountId);
            }
        }
        for(Account acc:[Select Id,(Select Id FROM Contacts) FROM Account WHERE Id IN:accIds]){
            acc.Total_Contacts__c = acc.Contacts.Size();
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
     
}