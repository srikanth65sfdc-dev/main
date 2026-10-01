public class StreetAPI {
  @future(callout=true)
    public static void verifyAddress(String Address){
        
        Http Http = new Http();
        HttpRequest Request = new HttpRequest();
        Request.setEndpoint('https://us-street.api.smartystreets.com/street-address?auth-id=6b5c9c08-5840-01d5-0933-83cc23fc280d&auth-token=uOXA3WXHhV8eyK4LoFOb'+ Address);
        Request.setMethod('GET');
        HttpResponse Response = Http.send(Request);
        
        if(Response.getStatusCode()!=200){
            system.debug(Response.getBody());
        }
        
        if(Response.getStatusCode()==200){
            List<object> results = (List<object>) JSON.deserializeUntyped(Response.getBody());
            Map<string,object> mapComponents = (Map<string,object>)results[0];
            Map<string,object> components = (Map<string,object>)mapComponents.get('components');
            for(string s :components.keyset()){
                if(components.get(s)==Address){
                    try{
                        Event e = new Event();
                        e.Location=Address;
                        
                        e.ActivityDateTime=system.now();
                        insert e;
                    }
                    catch (Exception ex){
                        system.debug('Error'+ex.getMessage());
                    }
                }      
            }
        }
    }
}