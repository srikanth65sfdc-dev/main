public class AddMultiAccounts {
   Account acc=new Account();
    public List<Account>listAcc{get;set;}
    public AddMultiAccounts(){
        listAcc=new list<Account>();
        listAcc.add(acc);
        
    }
    public void accAdd(){
        Account acc1=new Account();
        listAcc.add(acc1);
    }
    public void saveAcc(){
        insert listAcc;
        
    }
}