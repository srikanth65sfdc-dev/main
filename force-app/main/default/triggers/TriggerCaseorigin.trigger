trigger TriggerCaseorigin on Case (before insert,before update)
     {
    for(Case EC:Trigger.new)
    {
      if(EC.Origin == 'Phone')
      {
          EC.Status = 'Working';
          EC.Priority = 'High';
          EC.Type ='Electrical';
          EC.Reason='Breakdown';
      }
    }
}