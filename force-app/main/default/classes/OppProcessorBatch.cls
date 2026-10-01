public class OppProcessorBatch implements Database.Batchable<sObject>, Database.stateful {
     public integer recordCount = 0;
    
    public Database.QueryLocator Start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select Id,LeadSource from Opportunity]);
    }
    public void Execute(Database.BatchableContext bc ,List<Opportunity> opps){
        if(!opps.isEmpty()){
            for(Opportunity opp:opps){
                opp.LeadSource ='WEB';
               
            }
            update opps;
            recordCount =recordCount + opps.size();
        }
    }
    public void Finish(Database.BatchableContext bc){
        System.debug('Total records are processed '+ recordCount);
    }
}