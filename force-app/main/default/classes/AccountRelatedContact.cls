public class AccountRelatedContact {
    public static ID InsertAccount(){
        Account acb = new Account();
        acb.Name ='sri testAccopp';
        acb.rating= 'hot';
        insert acb;
        return acb.Id;
    }
    public static void InsertContact(){
        Id acbId;        
        acbId = InsertAccount();
        contact con = new contact(LastName = 'test srirelatedOppo');
        con.AccountId= acbId;
        insert con;
    }
    public static void InsertOpportunity(){
        Id acpId;        
        acpId = InsertAccount();
        Opportunity opp = new Opportunity();
        opp.Name = 'Srikanth test opp';
        opp.CloseDate =System.today();
        opp.StageName ='Discovery';
        opp.AccountId= acpId;
        insert opp;
    }
    public static void InsertAccountwithContactandOpportunity(){
        Account acc = new Account();
        acc.Name ='Acc1012123';
        insert acc;
        Contact con1 = new contact();
        con1.LastName='Cona123';
        con1.AccountId = acc.Id;
        insert con1;
        Opportunity opp = new Opportunity();
        opp.Name = 'Srikanth test opp123';
        opp.CloseDate =System.today();
        opp.StageName ='Discovery';
        opp.AccountId= acc.Id;
        insert opp;
    }
}