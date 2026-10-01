trigger CarTrigger on Car__c (before insert,after Insert) {
    if(trigger.isInsert){
        if(trigger.isBefore){
            //ApplyDiscountCars.ApplyDiscount(Trigger.new);
             CarTriggerHandler.populateData(Trigger.new);
        }else if(trigger.isAfter){
            CarTriggerHandler.CreateTask(Trigger.New);
        }
    }
  
}