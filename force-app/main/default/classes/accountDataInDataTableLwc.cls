public class accountDataInDataTableLwc {
    @AuraEnabled(cacheable =true)
    public static List<Account> getAccountData(){
        List<Account> acc =[Select Id,Name,Industry,Rating,Phone from Account];
        System.debug('acc == '+acc);
        return acc;
    }
}