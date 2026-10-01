public class ApplyDiscountCars {
    public static void ApplyDiscount(List<Car__c>Carsnew){
        for(Car__c Car:Carsnew ){
            Car.Discounted_Price__c= Car.Original_Price__c*(100.00-Car.Discount__c)/100 ;
        }
    }
    
}