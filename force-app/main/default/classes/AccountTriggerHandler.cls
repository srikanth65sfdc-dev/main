public with Sharing class AccountTriggerHandler {
  public static void PopulateAccDesc(List<Account> accList){
    for(Account acc:accList){ 
                acc.Description = 'Account was created';
            }   
      }
    /*public static void populateRating(List<Account> accList){
        if(!accList.isEmpty()){
            for(Account acc:accList){
                if(acc.Industry!=null && acc.Industry == 'Media'){
                    acc.Rating ='Hot';//Befor insert
                }
            }
        }
    }*/
    public static void populateRating(List<Account> accList,Map<Id,Account> accoldMap){
        if(!accList.isEmpty()){
            for(Account acc:accList){
                if((accoldMap==null && acc.Industry!=null && acc.Industry == 'Media')|| (accoldMap!=null&&acc.Industry!= accoldMap.get(acc.Id).Industry && acc.Industry == 'Media')){
                    acc.Rating ='Hot';//Befor insert and Before Update
                }
            }
        }
    }
    public static void CreateOpp(List<Account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc:accList){
            Opportunity opp = new Opportunity();
             opp.Name = acc.Name;
            opp.CloseDate =System.today();
            opp.StageName ='Prospecting';
            opp.AccountId = acc.Id;
            oppList.add(opp);
            //acc.AnnualRevenue=123333; WE GET ERROR IF NEW ACCOUNT IS CREATES DUE TO THIS,TEST IT IF NECESSARY,ACCOUNT RECORD IS READ ONLY.
        }
        if(!oppList.isEmpty()){
            /*DataBase.SaveResult[] srList = Database.insert(oppList,false);
            for(Integer i=0;i<srList.size();i++){
                if(!srList[i].isSuccess()){
                    string errors='';
                    for(DataBase.Error err:srList[i].geterrors()){
                       errors=errors+err.getmessage(); 
                    }
                    accList[i].addError(errors);
             
                }
            }*/
           insert oppList;
        }
    }

    public static void updateDescription(List<Account> accList, Map<Id,Account> accoldMap){
        for(Account acc:accList){
            if(acc.Phone!= accoldMap.get(acc.Id).Phone){
                acc.Description ='Phone is updated  | old vaue = '+accoldMap.get(acc.Id).Phone  +  '||New Value = ' +acc.Phone;
            }
        }
    }
    public static void populateRelatedContactPhone(List<Account> accList, Map<Id,Account> accoldMap){
        List<Contact> conList = new List<Contact>();
        //Map<Id,Account> accMap = new Map<Id,Account>();//Using Map
        Set<Id> accIds = new Set<Id>();
        for(Account acc:accList){
            if(acc.Phone!=accoldMap.get(acc.Id).Phone){
                //accMap.put(acc.Id,acc);
                accIds.add(acc.Id);
            }
        }
        /*for(Contact con: [Select Id,Name,HomePhone,AccountId from Contact where AccountId IN:accMap.Keyset()]){
            if(accMap.ContainsKey(con.AccountId)){
                con.HomePhone = accMap.get(con.AccountId).Phone;*/
        for(Account acc:[Select Id,Phone,(Select Id,HomePhone FROM Contacts) FROM Account WHERE Id IN:accIds]){//Using Parent child SOQL 
            //we can do both ways 
            if(acc.Contacts!=null){
                for(Contact con:acc.Contacts){
                    con.HomePhone = acc.Phone;
                    conList.add(con);
                }
            }
        }
             if(!conList.isEmpty()){
                update conList;
            }    
            
           
        }
    public static void preventionOfDeletion(List<Account>accList){
        Profile p =[Select Id FROM Profile Where Name ='System Administarator'];
        for(Account acc:accList){
            if(UserInfo.getProfileId()!=p.Id||acc.Rating!=null && acc.Rating =='Hot'){
                acc.addError(Label.Prevention_Of_Account_Deletion);
            }
            
        }
    }
    public static void updateAccountRecursive(List<Account> accList,Map<Id, Account> accoldMap){
        List<Account> accToBeUpdated = new List<Account>();
        for(Account acc:accList){
            Account a = new Account();
            a.id = acc.Id;
            a.Description = 'Test Recursion through trigger';
            accToBeUpdated.add(a);
        }
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        }
    }
    public static boolean handleAccount(List<Account> accList){
        if(trigger.isExecuting){
            System.debug('Trigger is executing '+trigger.isExecuting);
        } else{
                System.debug('Trigger is not executing ' );
            }
        return trigger.isExecuting;
        }
        
    
    
}