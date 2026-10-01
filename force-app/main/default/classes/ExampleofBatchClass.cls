public class ExampleofBatchClass Implements Database.Batchable<sObject> {
    public Database.QueryLocator Start(Database.BatchableContext BC){
        String Qr = 'Select Id,Name from Contact';
        Return Database.getQueryLocator(Qr);
    }
    public void Execute(Database.BatchableContext BC,List<Contact> mydata)
    {
        For(Contact EC : mydata)
        {
            EC.FirstNAME ='My contacts';
            Update EC;
        }
    }
    Public void Finish(Database.BatchableContext BC)
    {
         Messaging.SingleEmailMessage E = New Messaging.SingleEmailMessage();
        List<String> toadd = New List<String>{'srikanth65sfdc@gmail.com'};
            E.setToAddresses(toadd);
            E.setSubject( 'Your batch job processing');
            E.setPlainTextBody('Batch job is done and mail sent');
        List<Messaging.Email> BAE = New List<Messaging.Email>{E};
            messaging.sendEmail(BAE);
    }
}