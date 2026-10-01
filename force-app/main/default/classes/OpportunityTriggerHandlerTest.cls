@isTest
public class OpportunityTriggerHandlerTest {
@isTest
    Static void ValidateAmountTest(){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i =1;i<10;i++){
            Opportunity op = new Opportunity();
         op.Name ='Test opp'+i;
        op.StageName ='Prospecting';
        op.CloseDate =System.Today();
        op.Amount=null;
        oppList.add(op);
        }
        Test.startTest();
    insert oppList;
    Test.stopTest();
    
    } 
}