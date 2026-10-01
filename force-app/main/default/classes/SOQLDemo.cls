public class SOQLDemo {
    public static void soqlAccount(){
        List<Account> accList = new List<Account>();
        String ind = 'Energy';
        Integer rev = 1000;
        //accList =[Select Id,Name,Industry,Phone, rating,AnnualRevenue from Account where Industry!= null and rating!=null and Phone!=null and AnnualRevenue!=null ];
        //accList =[Select Id,Name,Industry,Phone, rating,AnnualRevenue from Account where Industry!= null OR rating!=null];
        //accList =[Select Id,Name,Industry,Phone, rating,AnnualRevenue from Account where Industry IN ('Finanace ','Energy')];
        //accList =[Select Id,Name,Industry,Phone, rating,AnnualRevenue from Account where Industry = 'Media' order by Name ASC];
        //accList =[Select Id,Name,Industry,Phone, rating,AnnualRevenue from Account where Industry = 'Media' order by Rating DESC];
        //accList =[Select Id,Name,Industry,Phone, rating,AnnualRevenue from Account where Industry = 'Media' order by Name NULLS First];
        //accList =[Select Id,Name,Industry,Phone, rating,AnnualRevenue from Account where Industry=:ind];
        accList =[Select Id,Name,Industry,Phone, rating,AnnualRevenue from Account where AnnualRevenue>=:rev];
        if(accList.size()>0){
            for(Account acc:accList){
                System.debug(acc);
            }
        }
        //Querying list,set ,map in SOQL
        List<Account> accList1 = new List<Account>();
         set<Id> accid = new set<Id>();
        accList1 = [Select Id,Name from Account Limit 5];
        if(accList.size()>0){
             for(Account acc:accList){         //for(Account acc:[Select Id,Name from Account Limit 1])//in line soql for single account
                accid.add(acc.Id);
            }
            List<Account> accse =[Select Id,Name from Account where Id IN:accid];
            integer coun =[Select  count() from Account where Rating= 'Hot'];
            System.debug(coun);
        }
    }
    public static void soqlGroupagg(){
        AggregateResult[] aggregate = [Select Account.Name,Sum(Amount) from Opportunity Group By Account.Name];
        for(AggregateResult ar : aggregate){
            System.debug('Account ID = '+ar.get('Name'));
            System.debug('Amount sum = '+ar.get('Expr0'));
        }
    }
    public static void ParenttoChildSoqlDemo(){
        List<Account> accList= new List<Account>();
        accList = [Select Id,Name,(Select Id,FirstName,LastName from Contacts) from Account limit5];
        //accList = [Select Id,Name,(Select Id,FirstName,LastName from Application__r) from Candidate__c  limit5];//custom object and relation of child
        if(accList.size()>0){
            for(Account acc:accList){
                System.debug('Show Account = '+acc.Name);
                for(Contact con:acc.Contacts){
                    System.debug(con.FirstName +'' +con.LastName);
                }
            }
        }
    }
}