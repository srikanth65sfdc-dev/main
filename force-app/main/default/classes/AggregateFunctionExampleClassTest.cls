@isTest
private class AggregateFunctionExampleClassTest {
    @isTest
    static void updateDepartmentWithExpenseAmountTest(){
        List<Department__c>deptList=TestDataFactory.createDeptWithExps(1,3);
        Department__c dept=[Select Id,Total_Expenses__c from Department__c Where Id=:deptList[0].Id];
        System.assertEquals(dept.Total_Expenses__c,306 );
    }
}