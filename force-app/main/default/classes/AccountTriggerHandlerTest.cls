@isTest
public class AccountTriggerHandlerTest {
    /*@testsetup//Using testsetup method for the account creation is used in all methods commonly ,no need to create account at every method.
    static void setup(){
        List<Account> accList = new List<Account>();
        for(Integer i =1;i<10;i++){
            Account acc = new Account();
            acc.Name = 'Testing Account '+ i;
            accList.add(acc);
        }
        Test.startTest();
         insert accList;
        Test.stopTest();*/
    

    
    
   @isTest
    static void CreateAccountWithOpp(){
        /*List<Account> accList = new List<Account>();
        for(Integer i =1;i<10;i++){
            Account acc = new Account();
            acc.Name = 'Testing Account '+ i;
            accList.add(acc);
        }
        Test.startTest();
         insert accList;
        Test.stopTest();*/
        List<Account> accList = new List<Account>();
    accList = DataFactory.CreateAccountRecord('Test', 10, true);
     List<Opportunity> oppList =[Select Id from Opportunity ];
        System.assert(oppList!=null,'Opportunity is not created');
    }
    @isTest
    static void PopulateRatingTestInsert(){
        /*List<Account> accList = new List<Account>();
        for(Integer i =1;i<10;i++){
            Account acc = new Account();
            acc.Name = 'Test'+ i;
            acc.Industry ='Media';
            accList.add(acc);
    }
        Test.startTest();
         insert accList;
        Test.stopTest();*/
        List<Account> accRating = [Select Id, Rating From Account];
         System.equals('Hot', accRating[0].Id);
    }
    @isTest
    static void PopulateRatingTestUpdate(){
        /*List<Account> accList = new List<Account>();
        for(Integer i =1;i<10;i++){
            Account acc = new Account();
            acc.Name = 'Test'+ i;
            acc.Industry ='Chemicals';
            accList.add(acc);
    }
        Test.startTest();
         insert accList;*/
        List<Account> accList = new List<Account>();
        accList =[Select Industry from Account];
        for(Account acc:accList){
            acc.Industry = 'Media';
        }
             update accList;
             
        Test.stopTest();
        List<Account> accRating = [Select Id, Rating From Account where Id=:accList[0].Id];
         System.equals('Hot', accRating[0].Id);
    }
}