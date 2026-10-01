@isTest
public class EventBatchTest {
   public TestMethod static void Class_Event_Batch_Test_Method()
    {
        List<Event__c> eve_List = New List<Event__c>();
        Event__c eve = new Event__c();
        eve.Status__c = 'Deleted';
        eve_List.add(eve);
        Test.startTest();
        Database.SaveResult []str = Database.insert(eve_List,false);
        system.assertEquals(True, str[0].isSuccess());
        EventBatchDeleteStatus ev = New EventBatchDeleteStatus();
        Database.executeBatch(ev);
        Test.stopTest();
    }
}