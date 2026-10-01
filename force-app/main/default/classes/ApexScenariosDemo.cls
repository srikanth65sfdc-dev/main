public class ApexScenariosDemo {
    public static void showAccountwithContact(){
        List<Account> accList = new List<Account>();
         accList =[Select Id,Name,(Select Id,Name from Contacts) FROM Account WHERE Phone!=null];
        if(!accList.isEmpty()){
            for(Account acc:accList){
                System.debug(acc.Name +' has '+acc.Contacts.size() +'related contacts');
            }
        }
    }
    public static void showOppAmountOfAccounts(){
        List<Account> accList = new List<Account>();
        //accList =[Select Id,Name,(Select Id,Name,Amount from Opportunities) FROM Account WHERE Phone!=null];
        //if(!accList.isEmpty()){
            for(Account acc:[Select Id,Name,(Select Id,Name,Amount from Opportunities) FROM Account WHERE Phone!=null]){
                Decimal total=0;
                for(Opportunity opp:acc.Opportunities){
                    if(opp.Amount!=null){
                        total = total+opp.Amount; 
                    }
                   
                //}
                System.debug(acc.Name +' has '+total +'worth of Opps');
            }
        }
    }
    public static void oppStageDescripton(){
        List<Opportunity> oppList = new List<Opportunity>();
        oppList = [Select Id,Name,StageName FROM Opportunity where CreatedDate = THIS_YEAR];
        if(!oppList.isEmpty()){
            for(Opportunity opp:oppList){
                if(opp.StageName == 'Closed Won'){
                    opp.Description ='Opportunity was won';
                }else if(opp.StageName == 'Closed Lost'){
                    opp.Description ='Opportunity was Lost';
                }else{
                    opp.Description ='Opportunity was Open';
                }
            }
            update oppList;
        }
    }
    public static void showContactsOfAccount(){
        List<Account> accList = new List<Account>();
        accList = [Select Id,Total_Contacts__c,(Select Id from Contacts) FROM Account where CreatedDate =THIS_YEAR];
        if(!accList.isEmpty()){
            for(Account acc:accList){
                acc.Total_Contacts__c =acc.Contacts.Size();
            }
            update accList;
        }
    }
    public static void PopulateContactMobileOfAccount(){
        List<Contact> conList = new List<Contact>();
         conList =[SELECT Id,MobilePhone,Account.Phone FROM Contact WHERE CreatedDate =THIS_YEAR];
        If(!conList.isEmpty()){
            for(Contact con:conList){
                if(con.MobilePhone == null && con.Account.Phone !=null){
                    con.MobilePhone = con.Account.Phone;
                }
            }
            update conList;
        }
    }
}