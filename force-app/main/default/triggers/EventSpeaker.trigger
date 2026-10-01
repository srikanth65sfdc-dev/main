trigger EventSpeaker on Event_Speaker__c (before insert) {
 List<Event_Speaker__c> events = trigger.new;
    for(Event_Speaker__c event : events){
        Id speakerId = event.Speaker__c;
        
        List<Event_Speaker__c> results = [select Id from Event_Speaker__c where Speaker__c = :speakerId];
        if(results.size() > 0){
            event.addError('Name already exists');
        }
    }
    
}