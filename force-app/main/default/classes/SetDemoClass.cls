public class SetDemoClass {
    
    public static void setobjectshow(){
            set<Id> accids = new set<Id>();
            set<String> accName = new set<String>();
            List<Account> acc = new List<Account>();
        acc = [Select Id,Name from Account Limit 5];
        for(Account ac:acc){
            accids.add(ac.Id);
            accName.add(ac.Name);
        }
        System.debug('The Account Ids  = ' + accids);
        System.debug('The Account Ids  = ' + accName);
            
        }
    public static void showContactIds(){
        set<Id> conId = new set<Id>();
        set<String> conName = new set<String>();
        List<Contact> conList = new List<Contact>();
        conList =[Select Id,Name from Contact Limit 10];
        for(Contact con:conList){
            conId.add(con.Id);
            conName.add(con.Name);
        }
        System.debug('The Ids of Contact are =  ' + conId );
        System.debug('The Names of Contact are =  ' + conName );
    }
    public static void setDataType(){
        Set<Integer> intset = new Set<Integer>();
        List<Integer> intList = new List<Integer>();
        Set<Integer> cloneset = new Set<Integer>();
        intset.add(12);
        intset.add(16);
        intset.add(20);
        
        intList.add(24);
        intList.add(28);
        
      intset.addAll(intList);
     System.debug('Set contsins values  = ' + intset);
        //intset.clear();
      System.debug('Set contsins values  = ' + intset);  
       cloneset= intset.clone();
      System.debug('Set contsins values  = ' + cloneset);
       System.debug('Set contsins values  = ' + intset.contains(110));
        System.debug('Set contsins values  = ' + intset.containsAll(intList));
        System.debug('find the Equal of 2 sets  = ' + intset.equals(cloneset));
        System.debug('find the Equal of 2 sets  = ' + intset.equals(intList));
        intset.remove(24);
        System.debug('find the Equal of 2 sets  = ' + intset);
        System.debug('Size of set = ' +intset.size());
        intset.retainAll(intList);
        System.debug('Size of set = ' +intset);
        
        
    }
}