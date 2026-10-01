public class LoopsDemo {
    public static void forloopDemo(){
        for(integer i=1;i<=10;i++){
            System.debug(i);
        }
    }
    public static void forlooptable(integer n){
        for(integer i=12; i<=10; i++){
            System.debug(n + '*' +i + '=' +n*i);
        }
    }
    public static void evennum(integer n){
        for(integer i = 1 ; i<=n ; i++){
            if(math.mod(i, 2)==0){
               System.debug(i); 
            }
        }
    }
    public static void oddnum(integer n){
        for(integer i = 1 ; i<=n ; i++){
            if(math.mod(i, 2) !=0){
               System.debug(i); 
            }
        }
    }
    public static void sum(integer n){
        integer i ,sum=0;
        for( i = 1 ; i<=n ; i++){
             sum = sum+i;
        }
        System.debug(sum); 
    }
    public static void whileLoop(integer n){
        integer i;
        while(i<=10){
            System.debug(n + '*' +i + '=' +n*i);
            i++;
        }
    }
    public static Void showAccountData(){//iterate account id and name throug list and display set of account ids
        List<Account> accList = new List<Account>();
        Set<Id> accs = new Set<Id>();
        Map<Id,Account> accMap = new Map<Id,Account>();
          accList = [Select Id,Name from Account Limit 5];
        System.debug('Display data throuh List');
        if(accList.size()>0){
            for(Account acc:accList){
            System.debug(acc.Id   +'-' +acc.Name );
                accs.add(acc.Id);//set having data
                accMap.put(acc.Id,acc);//map having data
           }
        }
        System.debug('Display data throuh set');
        if(!accs.isEmpty()){//Dsplay account ids through set
            for(Id acci : accs){
                System.debug(acci);
            }
        }
        System.debug('Display data throuh Map Keys');
        if(!accs.isEmpty()){//Dsplay account ids through map
            for(Id accmId : accMap.keyset()){//iterate map based on keys
                System.debug(accmId);
              }
        }
        System.debug('Display data throuh Map values');
        if(!accs.isEmpty()){//Dsplay account ids through map
            for(Account accm : accMap.values()){//iterate map based on  values
                System.debug(accm);
              }
        }
    }
}