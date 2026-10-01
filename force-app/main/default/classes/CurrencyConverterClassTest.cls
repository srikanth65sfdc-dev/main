@isTest
private class CurrencyConverterClassTest {
    @isTest static void convertEURToINRTest(){
        StaticResourceCalloutMock mockCall = new StaticResourceCalloutMock();
        mockCall.setStaticResource('GetCurrencyConversionData');
        mockCall.setStatus('OK');
        mockCall.setStatusCode(300);
        mockCall.setHeader('Content-Type','application/json');
        Test.setMock(HttpCalloutMock.Class,mockCall);
        Decimal resp = CurrencyConverterClass.convertEURToINR(20);
        System.assertNotEquals(null, resp);
    }
}