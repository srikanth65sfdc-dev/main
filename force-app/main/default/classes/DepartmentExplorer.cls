@RestResource(urlMapping='/Department/*')
 global class DepartmentExplorer {
    @HttpGet
     global static Department__c getDeptById(){
         RestRequest req = RestContext.request;
         String deptId=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
            Department__c dept = [Select Id,Name, Department_Code__c, Expenses__c, Total_Expenses__c from Department__c Where Id=:deptId Limit 1];
         return dept;
     }
     @HttpPost
     global static Id createDept(String deptName, String deptCode){
         Department__c dept = new Department__c();
         dept.Name = deptName;
         dept.Department_Code__c = deptCode;
         insert dept;
         return dept.Id;
     }
     @HttpDelete
     global static String deldept(){
     RestRequest req = RestContext.request;
     String deptId = req.requestURI.subString(req.requestURI.lastIndexOf('/')+1);
       Department__c dept =[Select Id from Department__c Where id=:deptId LIMIT 1];
         delete dept;
         return 'Record has been deleted';
     }
     
         
     
}