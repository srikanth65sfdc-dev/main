public class CreateRecordController {
	@AuraEnabled
    public static Contact saveContact(String firstname, String lastname){
        Contact con = new Contact();
        con.FirstName = firstname;
        con.LastName = lastname; 
        insert con;
        return con;
    }
}