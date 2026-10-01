trigger ContactTrigger on Contact (after insert,after Delete,after Undelete) {
    if(Trigger.isInsert &&Trigger.isAfter){
        ContactTriggerHandler.updateTotalContacts(Trigger.New);
    }
    if(Trigger.isDelete &&Trigger.isAfter){
        ContactTriggerHandler.updateTotalContacts(Trigger.old);
    }
    if(Trigger.isUndelete &&Trigger.isAfter){
        ContactTriggerHandler.updateTotalContacts(Trigger.New);
    }
}