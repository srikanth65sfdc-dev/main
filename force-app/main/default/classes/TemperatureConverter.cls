public class TemperatureConverter {
    //Takes the Faherienheit temp and converts it into celcieus temp.
    public static Decimal FarenheitToCelsius(Decimal fh){
        Decimal cs =(fh-32)*5/9;
        return cs.setScale(2);
    }
}