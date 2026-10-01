public class CreateRecordInCustomObject {
    public static void Createrecord(){
        Applicant__c app = new Applicant__c();
        app.Name ='Mule soft Deve';
        app.Credit_Status__c ='Limit';
        insert app;
    }
}