public class ConditionalStmtDemo {
    //null check apply
    Public static void nullcheckapplyList(){
        List<Account> accList = new List<Account>();
           accList = [Select Id,Name From Account Limit 6];
        if(!accList.isEmpty()){
           System.debug('the value is false =  ' +accList); 
        }
        //OR second method
        if(accList.size()>0){
            System.debug('the value is false =  ' +accList);
        }
    }
    
    public static void logicaloperatordemo(){
        integer num1=20,num2=60;
        if(num1>50 && num2>100){
           System.debug('the value is true'); 
        }else{
            System.debug('the value is false');
        }
    }
    public static void logicaloperatordemo1(){
        integer num1=20,num2=60;
        if(num1>50 || num2>100){
           System.debug('the value is true'); 
        }else{
            System.debug('the value is false');
        }
    }
    public static void elseifLadder(integer num){
        if(num>0){
            System.debug('the value is positive');
        }else if(num==0){
            System.debug('the num is zeroo');
        }else{
            System.debug('the num is negative');
        }
    }
    
    public static void ifnesteddemo(integer num){
        if(num>=0){
            if(num>0){
                System.debug('the value is positive');
            }else{
                System.debug('the num is zeroo');
            }
        }else{
            System.debug('the num is negative');
        }
    }
    public static void checkevenorodd(integer num){
        if(math.mod(num, 2)==0){
            System.debug('the num is even');
        
           }else{
               System.debug('the num is odd');
           }
    }
    public static void maxnum(integer num1,integer num2){
        //integer num1= 20,num2 =30;
        if(num1>num2){
            System.debug('the max value is =num1 ');
        }else{
            System.debug('the max value is =num2 ');
        }
    }
    
    public static void checkEligibilityvote(integer age){
        if(age>=18){
            System.debug('you are eligible to vote ');
        }else{
            System.debug('you are not eligible to vote ');
        }
    }
}