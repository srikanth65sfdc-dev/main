public class OpportunityTriggerHandler {
    public static void ValidateAmount(List<Opportunity> opp){
        for(Opportunity o:opp){
            if(o.Amount == null){
                o.addError('Please Populate Amount on Opportunity');
            }
        }
    }
    public static void updateDescription(List<Opportunity> opp,Map<Id,Opportunity> oldMap){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Opportunity op:opp){
            Opportunity o = new Opportunity();
            o.Id = op.Id;
            if(op.StageName!=oldMap.get(op.Id).StageName){
                if(op.StageName =='Closed Won'){
                    o.Description ='Opportuity  was Won';
                }else if(op.StageName =='Closed Lost'){
                    o.Description ='Opportuity was Lost';
                }
            }
             oppList.add(o);
            }
        if(!oppList.isEmpty()){
            update oppList;
        }
        }
    }