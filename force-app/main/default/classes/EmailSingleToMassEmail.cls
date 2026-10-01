public class EmailSingleToMassEmail {
    public void Sendmassfromvemuri()
    {
        List<Contact> pq =[Select Id,FirstName,LastName,Email From Contact Where MailingCity='Bombay'];
        for(Contact ep:pq)
        {
          Messaging.SingleEmailMessage R = NEW Messaging.SingleEmailMessage();
            List<String> ToAdd = new List<String>{ep.Email};
             R.setToAddresses(ToAdd);
            R.setSubject('Hello' +ep.FirstName   +'This is sent mail from programmytstyd');
            R.setPlainTextBody( 'Hi '+ep.FirstName +'Mail sent success');
            List<Messaging.Email> qs = new List<Messaging.Email>{R};
                Messaging.sendEmail(qs);
        }
    }
}