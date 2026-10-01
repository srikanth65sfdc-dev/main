trigger TriggerCaseorigin2 on Case (before insert,before update) {
    For(Case EC: Trigger.new){
        if(EC.Origin == 'web'){
            EC.Priority = 'Low';
            EC.Status='Escalating';
            EC.Reason='No useful';
            EC.SuppliedEmail='srikanth65sfdc@gmail.com';
            EC.SuppliedName='Srikanth';
            EC.SuppliedPhone='12345';
        }
    }
}