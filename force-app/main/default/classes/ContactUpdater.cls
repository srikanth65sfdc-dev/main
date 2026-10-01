public class ContactUpdater {
    public static void markContactsProiority(){
        List<Account> goldAccounts = [Select Id,Tier__c from Account where Tier__c='Gold'];
         set<Id> goldAccountids = new set<Id>();
        for(Account acc : goldAccounts){
            goldAccountids.add(acc.Id);
        }
        List<Contact> relatedContacts =[select Id,Accountid from Contact where Accountid IN:goldAccountids];
        List<Contact> updatedContacts = new List<COntact>();
        for(Contact con: relatedContacts){
            con.Is_Priority__c=true;
            updatedContacts.add(con);
              
        }
        if(!updatedContacts.isEmpty()){
            update updatedContacts;
        }
    }
}