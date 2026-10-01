public class CalculatorServiceClass {
    public static Double add(Double X,Double Y){
        calculatorService.CalculatorImplPort calc = new calculatorService.CalculatorImplPort();
        return calc.doadd(X,Y);
    }
}