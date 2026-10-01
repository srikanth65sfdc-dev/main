public class AccountInsertionByList {
    public static void insertAccount(){
        Account acc = new Account(Name='Prashanth Accountnew');
        //insert acc;
        Account acc1 = new Account();
        acc1.Name = 'Bharath123';
        //insert acc1;
        
        List<Account> acc2 = new List<Account>();
            acc2.add(acc);
            acc2.add(acc1);
            insert acc2;
    }
}