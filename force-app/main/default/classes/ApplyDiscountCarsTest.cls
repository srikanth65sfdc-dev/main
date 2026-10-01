@isTest
private class ApplyDiscountCarsTest {
    @isTest static void ApplyDiscountTest(){
        Car__c Car =new Car__c();
        Car.Name='test car';
        Car.Original_Price__c=100000;
        Car.Discount__c=20;
        Test.StartTest();
        insert Car;
        Test.stopTest();
     Car__c carData =[Select Discounted_Price__c From Car__c Where Id=:Car.Id Limit 1] ;
        System.assertEquals(800000,  CarData.Discounted_Price__c);
    }
}