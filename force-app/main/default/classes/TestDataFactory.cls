@isTest
 public class TestDataFactory {
     public static List<Department__c> createDeptWithExps(Integer numDept,Integer numExpsperDept){
         List<Department__c> deptList= new List<Department__c>();
         for(Integer i=0; i<numDept; i++){
             Department__c dept =new Department__c();
             dept.Name='Test Dept-'+i;
             dept.Department_Code__c ='Tes-'+i;
             deptList.add(dept);
         }
         insert deptList;
         Account acc=new Account(Name ='Harman Becker');
         insert acc;
         List<Expense__c> exps = new List<Expense__c>();
         for(Integer j=0; j<numDept; j++){
             Department__c dept= deptList[j];
             for(Integer k=0; k<numExpsperDept; k++){
                 Expense__c exp=new Expense__c();
                 exp.Name_of_Sales_Representative__c ='Test rep';
                 exp.Amount__c =102;
                 exp.Department__c=dept.Id;
                 exp.Expense_Date_time__c=System.now();
                 exp.Expense_Type__c='Food';
                 exp.Mode_of_Payment__c='Cash';
                 exp.Status__c='Draft';
                 exp.Sub_Type__c='Dinner';
                 exps.add(exp);
             }
         }
         insert exps;
         return deptList;
     }
 }