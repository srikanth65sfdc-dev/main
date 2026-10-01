trigger EmailTestPractice on Event_Attendee__c (after insert) {
     List<Messaging.Email> emailList = new List<Messaging.Email>();
    for(Event_Attendee__c ea : trigger.new){
        Messaging.SingleEmailMessage createeva = new Messaging.SingleEmailMessage();
        createeva.setToAddresses(new String[] {ea.Attendee__c});
        createeva.setSubject('Event Attendee Created Successfully');
        String body = 'registration has been confirmed ';
        createeva.setHtmlBody(body);
        emailList.add(createeva);
    }
    Messaging.sendEmail(emailList);
}