public with sharing class AccountHelper {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        try {
            return [SELECT Id,Name,Type,Phone from Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    

    
}