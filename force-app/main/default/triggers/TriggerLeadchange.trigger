trigger TriggerLeadchange on Lead (before insert,before update) {
    for(Lead Id: Trigger.new){
        if(Id.LeadSource =='web'){
            Id.Rating ='cold';
             }
        else{
            Id.Rating='Hot';
        }
    }
}