@isTest
public class OppProcessorBatchTest {
  @isTest
    public static void testBatchClass(){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i=0 ; i<20 ; i++){
            Opportunity opp = new Opportunity();
            opp.Name ='Test +i';
            opp.StageName = 'Prospecting';
            opp.CloseDate =System.today();
            oppList.add(opp);
        }
        Test.startTest();
        insert oppList;
        OppProcessorBatch opProcess = new OppProcessorBatch();
   Id batchId = Database.executeBatch(opProcess,20);
        Test.stopTest();
        List<Opportunity> updatedOpp = [Select Id from Opportunity where LeadSource ='Web'];
        System.assertEquals(20,updatedOpp.size());
    }
}