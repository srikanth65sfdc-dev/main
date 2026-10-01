public class CallingApexByFlow {
  @invocableMethod(Label ='Delete Related Opportunities'
                   Description ='Delete Related Opportunities for given Ids'
                   Category ='Account')
    public static void deleteOpportunities(List<String> ids){
        List<Opportunity> oppList = [Select Id from Opportunity where AccountId=:ids AND StageName ='Closed Won'];
        delete oppList;
    }
}