public class UpdateAccountParentQueueble implements Queueable{
     //Variables of class
     private List<Account> accList;
     private Id parentAccId;
    //Constructor
    
    public UpdateAccountParentQueueble(List<Account> accRecords,Id accId){
        this.accList = accRecords;
        this.parentAccId = accId;
    }
    //Method
    public void Execute(QueueableContext context){
        for(Account acc:accList){
            acc.ParentId = parentAccId;
        }
        update accList;
    }
    
}