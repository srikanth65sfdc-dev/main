public class ContactComponentApexController {
	@AuraEnabled
    public static List<Contact> getContactRecords(){
        return [Select Id,Name From Contact];
    }
}