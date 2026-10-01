global class CreateContactWebService {
    WebService static Id createcontact(String conFName, String conLName, String accId){
        Account acc = [Select Id from Account Where id=:accId Limit 1];
        Contact con = new Contact(FirstName = conFName, LastName=conLName,AccountId=acc.Id);
        insert con;
        return con.Id;
    }
}