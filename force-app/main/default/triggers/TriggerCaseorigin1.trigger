trigger TriggerCaseorigin1 on Case (before insert,before update) 
     {
         For(Case EC:Trigger.New){
             if(EC.Priority == 'High'){
                 EC.Status = 'New';
                 EC.Type='Earth';
                 EC.Origin='Phone';
                 
             }
         }
}