@isTest
public class AccountCalculatorTest {
@isTest
    private static void countContactsTest(){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<=250;i++){
           accList.add(new Account(Name='Test' +i));
        }
        Test.startTest();
        insert accList;
        List<Contact> conList = new List<Contact>();
        List<Id> accIds = new List<Id>();
        for(Account acc:accList){
            Contact con =  new Contact();
            con.FirstName ='Testing';
            con.LastName  ='Method';
            con.AccountId = acc.Id;
            conList.add(con);
            accIds.add(acc.Id);
        }
        Insert conList;
        AccountCalculator.countContacts(accIds);
        Test.stopTest();
        List<Account> accs =[Select Id,Count_Number_of_Contacts__c from Account];
        //System.assertEquals(0, accs[0].Count_Number_of_Contacts__c,  'Contact was not updated successfully');
    }
}