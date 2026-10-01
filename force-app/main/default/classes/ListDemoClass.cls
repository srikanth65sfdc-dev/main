public class ListDemoClass {
    public static List<String> returnvalue(String str1,String str2){
        List<String> colour = new List<String>{'red', 'blue','green'};
         colour.add(str1);
         colour.add(str2);
        //colour.add('blue');
        //colour.add('green');
        return colour;
    }
    public static void ListColourdemo(){
        List<String> colour = new List<String>();
        List<String> returnedvalues = new List<String>();
        returnedvalues = returnvalue('Black','Purple');
        System.debug('values returned  = ' + returnedvalues);
        System.debug('values returned  = ' + returnedvalues.contains('pink'));
        colour.add('red');
        colour.add('blue');
        colour.add('green');
        colour.add('yellow');
        System.debug('Result = ' + colour);
        colour.add(2,'White');
        System.debug('Result = ' + colour);
        
   List<String> colour2 = new List<String>();
        colour2.add('pink');
        colour2.add('purple');
        colour.addAll(colour2);
        System.debug('Result = ' + colour);
        System.debug('Result = ' + colour2);
        colour2.clear();
        System.debug('Result = ' + colour2);
        
    List<String> cloned = new List<String>();
        cloned = colour.clone();
        System.debug('Result = ' + cloned);
        System.debug('Result = ' + cloned.equals(cloned));
        System.debug('Result = ' + cloned.get(2));
        
        System.debug('Result = ' + cloned.indexOf('blue'));
        System.debug('Result = ' + cloned.isEmpty());
        colour.remove(2);
        System.debug('Result = ' + colour);
        
        System.debug('Size = ' + colour.size());
        System.debug('Size = ' + colour2.size());
        colour.sort();
        System.debug('Size = ' + colour);
        
        
    }
}