global class EventBatchDeleteStatus implements Database.Batchable<sObject>{
    
    global Database.QueryLocator Start(Database.BatchableContext bbc){
        return Database.getQueryLocator('SELECT Id,Status__c from Event__c ');
    }
    global void Execute(Database.BatchableContext bbc, List<Event__c> lstEvents){
        List<Event__c> lstEventsNew = new List<Event__c>();
        for(Event__c eve : lstEvents){
            if(eve.CreatedDate > system.today()-120){
                eve.Status__c = 'Deleted';
                lstEventsNew.add(eve);
            }
        }
        if(!lstEventsNew.isEmpty())
            update lstEventsNew;
    }
    global void Finish(Database.BatchableContext bbc){
        system.debug('Batch Job Id is......' + bbc.getChildJobId());
        
        AsyncApexJob jobDetails = [select Id,status, totalJobItems, jobItemsProcessed,numberOfErrors,CreatedBy.Email
                                   from AsyncApexJob Where id=: bbc.getChildJobId()];
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
        string[] toAddress = new string[]{jobDetails.createdBy.Email, 'Avinash51934@gmail.com' };
            email.setToAddresses(toAddress);
        
        string emailSubject = 'Event Record ('+bbc.getJobId()+') status Notification.';
        email.setSubject(emailSubject);
        
        string emailContent = 'Dear Customer,<br/><br/>'+
            'As per our organization policy, We Exhaused the Records which are not used from last 4 months<br/>'+
            'We are pleased to inform you, the below status Notification<br/>'+
            'Here are Batch Job details............:<br/>'+
            '<br/> Batch Job Id is.................:'+ jobDetails.Id+
            '<br/> Batch job status is.............:'+jobDetails.Status+
            '<br/> Total no.of batches............:'+jobDetails.TotalJobItems+
            '<br/> no.of Batches processed........:'+jobDetails.JobItemsProcessed+
            '<br/> no.of Batches failed...........:'+jobDetails.NumberOfErrors+
            '<br/><br/> Please Contact the below address , If any Queries.<br/><br/>'+
            '*** This is System generated Email, Please do not reply.<br/><br/>'+
            'Thanks & Regards,<br/> SUPPORT TEAM,<br/> Pro-Fit';
        email.setHtmlBody(emailContent);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
    }
}