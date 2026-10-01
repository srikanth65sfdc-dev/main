public class CallingApexByFlow1 {
   @invocableMethod(Label ='Send Email to Contact'
                   Description ='Send Email to Contact'
                   Category ='Case')
    
    public static void sendEmailToContact(List<Requests> requestsList){
        String ContactId =requestsList.get(0).ContactId;
        String caseId =requestsList.get(0).caseId;
        string caseNumber =requestsList.get(0).caseNumber;
        
         Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
// Set recipients to two contact IDs.
// Replace IDs with valid record IDs in your org.
message.toAddresses =new String[] { ContactId };
message.optOutPolicy = 'FILTER';
message.subject = 'Your case has been recieved' +caseNumber;
message.plainTextBody = 'This is the message body.' + 'This is the Case Id ='+caseId;
Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
         Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
if (results[0].success) {
    System.debug('The email was sent successfully.');
} else {
    System.debug('The email failed to send: '
          + results[0].errors[0].message);
}
    }
    public class Requests{
        @invocableVariable(Label ='Record id' Description ='The id of the case record' required =true)
        public String caseId;
        @invocableVariable(Label ='Contact Record id' Description ='The id of the Contact record' required =true)
        public String ContactId;
        @invocableVariable(Label ='Case Number' Description ='The Case Number' required =true)
        public  String caseNumber;
    }
}