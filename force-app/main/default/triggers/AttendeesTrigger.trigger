trigger AttendeesTrigger on Attendees__c (After insert) {

    AttendeesTriggerHandler.sendEmail(Trigger.New);
}