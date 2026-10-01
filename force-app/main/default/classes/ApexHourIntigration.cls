public class ApexHourIntigration {
    public static void verifyAddress(String Address){
        
        Http Http = new Http();
        HttpRequest Request = new HttpRequest();
        Request.setEndpoint('https://smartystreets.com/products/apis/us-street-apihttps://smartystre-address?auth-id= 57cc17a5-b19a-16c0-3812-1103f761df7b&auth-token= DEd44iDLCTpDP9hLPwRe'+ Address);
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
                        e.DurationInMinutes=20;
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