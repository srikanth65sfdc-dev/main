@isTest
public class TemperatureConverterTest {
  @isTest
    static void warmTempMethod(){
        Decimal celcius = TemperatureConverter.FarenheitToCelsius(70);
        System.assertEquals(21.11, celcius);
    }
}