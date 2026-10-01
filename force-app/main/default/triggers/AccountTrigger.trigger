trigger AccountTrigger on Account (before insert,After Insert,Before Update,After Update,before Delete) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountTriggerHandler.PopulateAccDesc(Trigger.New);
            //AccountTriggerHandler.populateRating(Trigger.New,Null);
        }else if(Trigger.isAfter){
            AccountTriggerHandler.CreateOpp(Trigger.New);//In after insert trigger.new is read only
            boolean b=AccountTriggerHandler.handleAccount(Trigger.New);
        }
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            AccountTriggerHandler.updateDescription(Trigger.New,Trigger.oldMap);
             AccountTriggerHandler.populateRating(Trigger.New,Trigger.oldMap);   
            
        }if(Trigger.isAfter){
            AccountTriggerHandler.populateRelatedContactPhone(Trigger.New,Trigger.oldMap);
            if(!PreventRecursion.firstcall){
                PreventRecursion.firstcall = true;
                AccountTriggerHandler.updateAccountRecursive(Trigger.New,Trigger.oldMap); 
            }
               
            
        }
    }
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            AccountTriggerHandler.preventionOfDeletion(Trigger.old);                           
        }if(Trigger.isAfter){
                                        
        }
    }
}