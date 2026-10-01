trigger AccountContactTrigger on Account (before insert) {
        List<Contact> cons = new List<Contact>();
    for(Account acc:Trigger.new){
        Contact c = new Contact();
        c.AccountId = acc.id;
        c.LastName =acc.name;
        c.Phone = acc.Phone;
        cons.add(c);
    }
    insert cons;
}