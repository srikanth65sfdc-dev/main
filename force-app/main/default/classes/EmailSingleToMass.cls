public class EmailSingleToMass {
   public void sendMassfromSingle()
   {
       List<Contact> EL =[Select FirstName,LastName,Email from Contact Where Phone='123456'];
       for(Contact EC : EL)
       {
           Messaging.SingleEmailMessage M1 = New Messaging.SingleEmailMessage();
           LiSt<String> ToADD = New List<String>{EC.Email};
           M1.setToAddresses(ToADD);
           M1.setSubject( 'Hi '+EC.FirstName +' '+EC.LastName + 'This is Mass email sending through ingle email');
           M1.setPlainTextBody('Hi '+EC.FirstName +' '+EC.LastName + 'This is Mass email sent through Apex');
           List<Messaging.Email> SE = NEW List<Messaging.Email>{M1};
               Messaging.sendEmail(SE);
       }
   }
}