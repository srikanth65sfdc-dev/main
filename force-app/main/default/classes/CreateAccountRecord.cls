public class CreateAccountRecord {
@AuraEnabled
    public static Account saveAccount(String name, String type, Decimal revenue){
        Account acc = new Account();
        acc.Name = name;
        acc.Type = type;
        acc.AnnualRevenue = revenue;
        insert acc;
        return acc;
    }
}