public class MapDemoClass {
    
    public static void demoMap(){
        Map<Id,Account> accmap  = new Map<Id,Account>();
        
        List<Account> accList = new List<Account>();
        List<Account> accList1 = new List<Account>();
        accList1 =[Select Id,Name,Phone,Rating from Account Limit 6];//without loop
        Map<Id,Account> clonedmap1  = new Map<Id,Account>(accList1);
        //accList1 =[Select Id,Name,Phone,Rating from Account Limit 6];
        System.debug('The all map values are = ' + clonedmap1);
        System.debug('The keys are = ' + clonedmap1.keyset());
        System.debug('The values are = ' + clonedmap1.values());
         accList =[Select Id,Name,Phone,Rating from Account Limit 6];
        //accList1 =[Select Id,Name,Phone,Rating from Account Limit 6];
        accmap.putAll(accList);
        System.debug('The values are = ' + accmap);
    }
    
    public static void Demo(){
        List<Account> accList2 = new List<Account>();
        accList2 =[Select Id,Name,Phone,Rating from Account Limit 6];//with loop
        Map<Id,Account> accmap1  = new Map<Id,Account>();
        for(Account ac:accList2){
            accmap1.put(ac.Id,ac);
        }
        System.debug('The all map values are = ' + accmap1);
        System.debug('The keys are = ' + accmap1.keyset());
        System.debug('The values are = ' + accmap1.values());
        
        
        Map<Integer,String> colours = new Map<Integer,String>();
        Map<Integer,String> moreColours = new Map<Integer,String>();
        Map<Integer,String> clonedmap  = new Map<Integer,String>();
        set<Integer> intset  = new set<Integer>();
        List<String>strList = new List<String>();
        colours.put(1,'Red');
        colours.put(2,'Blue');
        colours.put(3,'Green');
        colours.put(4,'Blue');
        System.debug('colours are = ' + colours);
        colours.put(1,'White');
        System.debug('colours are = ' + colours); 
        moreColours.put(10,'Pink');
        moreColours.put(20,'Yellow');
        moreColours.put(1,'Purple');
        colours.putAll(moreColours);
        System.debug('colours are = ' + colours);
        colours.remove(1);
        System.debug('Removed colours are = ' + colours);
        System.debug('Map size is = ' + colours.size());
        System.debug('Map size is = ' + colours.values());
        //colours.clear();
        System.debug('Map size is = ' + colours);
        clonedmap = Colours.clone();
        System.debug('Added colours are = ' + clonedmap);
        System.debug('Added colours are = ' + clonedmap.Containskey(30));
        System.debug('Added colours are = ' + clonedmap.Containskey(10));
        System.debug('Added colours are = ' + clonedmap.equals(colours));
        System.debug('Added colours are = ' + clonedmap.equals(moreColours));
        System.debug('Added colours are = ' + clonedmap.get(10));
        System.debug('Added colours are = ' + clonedmap.isempty());
        System.debug('all keys are = ' + clonedmap.keyset());
        
          intset = clonedmap.keyset();//Stores keys into a set
          strList = clonedmap.values();//stores values into a list
        System.debug('all keys are = ' + intset);
        System.debug('all values are = ' + strList);
    }
}