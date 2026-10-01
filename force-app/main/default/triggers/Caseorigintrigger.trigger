trigger Caseorigintrigger on Case (before insert,before update) {
    for(Case EC:Trigger.new){
        if(EC.Origin =='Email'){
            EC.Status='New';
            EC.Priority ='Medium';
        }
    }
}