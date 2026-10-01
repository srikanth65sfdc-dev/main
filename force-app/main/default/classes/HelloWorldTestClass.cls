@isTest
private class HelloWorldTestClass {
    static testMethod void validateHelloWorld(){
        Book__c b=new Book__c(Name='Behind the cloud',Price__c=100);
        system.debug('Price before inserting new book:' +b.Price__c);
        insert b;
        b=[SELECT Price__c From  Book__c Where Id =:b.Id];
        system.debug('Price after trigger fired: '+b.Price__c);
        system.assertEquals(90,b.Price__c);
    }
}