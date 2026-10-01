public class CurrencyConverterClass {
    public static Decimal convertEURToINR(Decimal eur){
        decimal inr=0.0;
        HTTP httpCall =new HTTP();
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint('http://api.exchangeratesapi.io/v1/latest?access_key=9101a274f0d486cef73716f311d0b8e3');
        req.setMethod('GET');
        HTTPResponse resp=httpCall.send(req);
        if(resp.getstatus() == 'OK'){
            Map<String,Object> respBody = (Map<String,Object>)json.deserializeUntyped(resp.getBody());
            Map<String,Object> rates = (Map<String,Object>)respBody.get('rates');
            Decimal Conversionrate = (Decimal)rates.get('INR');
            inr = eur*Conversionrate;
        }
        return inr;
    }
}