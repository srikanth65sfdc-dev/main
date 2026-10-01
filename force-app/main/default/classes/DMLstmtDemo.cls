public class DMLstmtDemo {
    public static void insertAccountSingle(){
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        Account acc = new Account();
        acc.Name = 'DML TEST 10004';
        accList.add(acc);
        Account acc1 = new Account();
        
        acc1.Name = 'DML TEST 1005';
        //insert acc1;//inserting single account
        accList.add(acc1);
        insert accList;
        
        Contact con = new Contact();
         con.FirstName ='test';
         con.LastName = acc.Name;
        
         con.AccountId = accList[0].Id;
         conList.add(con);
        //insert acc;//inserting single account
        //System.debug('Inserting Account with Id  = '+acc.id);
        Contact con1 = new Contact();
        con1.FirstName = acc1.Name;
        con1.LastName = acc1.Name;
        con1.AccountId = accList[1].Id;
        conList.add(con1);
        //System.debug('Inserting Account with Id  = '+acc1.id);
        
        insert conList;
    }
    public static void insertBulkAccounts(){
        List<Account> accList = new List<Account>();
        integer i;
        for(i=1;i<=50; i++){
            Account acc = new Account();
            acc.Name = 'test10'+i;
            accList.add(acc);
        }
        insert accList;
    }
    public static void updateaccIndustry(){
        List<Account> accList = new List<Account>();
        accList =[SELECT Id,Name,Industry,Rating FROM Account WHERE Rating ='Hot'];
        if(!accList.isEmpty()){
            for(Account acc : accList){
            acc.Industry ='Media' ;//'Finance';
             //accList.add(acc);   
            }
            
            }
        
        Account acc = new Account();
            for(integer i ; i<=5; i++){
                acc.Name = 'test upsert1'+i;
                accList.add(acc);
        }
                            
        if(!accList.isEmpty()){
        //update accList;
        upsert accList;
        }
    }
    public static void deleterecords(){
        List<Account> accList =[select Id,Name from Account where Name like 'Test' all rows];
        if(!accList.isEmpty()){
            //delete accList;
            //undelete accList;
        }
        try{
            Account ac1 = new Account();
            insert ac1;
        }
        catch(Exception e){
            System.debug(e);
        }
    }
    public static void databaseDMLinsert(){
        List<Contact> conList = new List<Contact>{
            new contact(LastName = 'test1',Department='Finance'),
               new contact(LastName = 'test1' , Department = 'Technoly'),
               new contact(LastName = 'test1' , Department = 'Education'),
               new contact(LastName = 'test1',Department = 'Business'),
                new contact()};
                    Database.SaveResult[] srList = Database.insert(conList,false);
        for(Database.SaveResult sr:srList){
            if(sr.isSuccess()){
            System.debug('Inserted contacts  '+sr.getId());
            }else{
                System.debug(conList);
            }
        }
    }
}