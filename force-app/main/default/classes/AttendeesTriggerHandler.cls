public class AttendeesTriggerHandler {
    
    
    public static void sendEmail(List<Attendees__c> atndList){
        
        List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();
        List<String> sendTo = new List<String>();
        for(Attendees__c at:atndList){
            sendTo.add(at.Email__c);
            Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
            mail.setToAddresses(sendTo);
            mail.setSubject(' Pass for the Event Name: '+ at.Name);
            String body = 'Dear ' + at.Name + ', ';
            body += 'Thank you for registering for at.Name which will be Organized on at.Start__c.';
            body +=  'will be held in at.Location__c.';
            body += 'We are excited to have you, see you in the event';
            body += 'Thanks,at.Name.';

            mail.setHtmlBody(body);
            mails.add(mail);
        }
        Messaging.sendEmail(mails);
    }
}