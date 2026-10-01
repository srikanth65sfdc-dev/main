@isTest
public class AccountContactTest {
    @isTest
    static void testme(){
        Integer count=[Select count() from Account];
        Integer size=[Select count() from Contact];
        Account acc = new Account(Name = 'VemuriIndustry',Phone ='123456');
        try{
            insert acc;
        }catch(Exception e){
            System.debug(e);
        }
        Integer newCount=[Select count() from Account];
        Integer newSize = [Select count() from Contact];
        Contact c = [Select Lastname,Phone from Contact where accountid=:acc.id];
        System.assertEquals(c.LastName, acc.name);
        System.assertEquals(c.Phone, acc.Phone);

    }
}