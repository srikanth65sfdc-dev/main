public class CarTriggerHandler {
    public static void populateData(List<Car__c> cars){
        for(Car__c ca:cars){
            if(ca.Status__c == 'New Position'){
                if(ca.Open_Date__c == null){
                    ca.Open_Date__c = System.Today();
                }
                if(ca.Min_Pay__c == null){
                    ca.Min_Pay__c =10000;
                }
                if(ca.Max_Pay__c == NULL){
                    CA.Max_Pay__c = 15000;
                }
            }
        }
    }
    public static void CreateTask(List<Car__c> cars){
        List<Task> taskList = new List<Task>();
        for(Car__c ca: cars){
            Task t = new Task();
            t.Subject ='Follow up';
            t.ActivityDate = System.Today()+10;
            t.WhatId = ca.Id;
            t.OwnerId =UserInfo.getUserId();
            t.Status = 'Not Started';
            taskList.add(t);
        }
        if(!taskList.isEmpty()){
            insert taskList;
        }
        
    }
}