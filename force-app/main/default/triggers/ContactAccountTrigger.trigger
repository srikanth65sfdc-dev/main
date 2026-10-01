trigger ContactAccountTrigger on Contact (before insert) {
      List<Account> acc = new List<Account>();
    for(Contact ec:Trigger.new){
        Account a= new Account();
        a.Parentid = ec.id;
        a.Name =ec.LastName;
        a.Phone =ec.Phone;
        a.BillingCity = ec.MailingCity;
        a.BillingState=ec.MailingState;
        acc.add(a);
    }
    insert acc;
}