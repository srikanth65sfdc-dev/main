trigger OpportunityTrigger on Opportunity (Before Insert,After Update) {
    if(trigger.IsInsert){
        if(trigger.isBefore){
           // OpportunityTriggerHandler.ValidateAmount(Trigger.New);
        }
    }
    if((trigger.isUpdate) &&(trigger.isAfter)){
        if(!PreventRecursion.Firstcall){
            PreventRecursion.Firstcall =true;
            OpportunityTriggerHandler.updateDescription(Trigger.New,Trigger.oldmap);
        }
        
    }
}