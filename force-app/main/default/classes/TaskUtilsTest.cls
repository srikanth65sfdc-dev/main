@isTest
public class TaskUtilsTest {
@isTest
    static void testTaskPriority(){
        String pri =TaskUtils.getTaskPriority('NY');
        System.assertEquals('Low',pri);
    }
    @isTest
    static void testTaskPriority1(){
        String pri =TaskUtils.getTaskPriority('CA');
        System.assertEquals('High',pri);
    }
    @isTest
    static void testTaskPriority2(){
        String pri =TaskUtils.getTaskPriority('Montana');
        System.assertEquals(null,pri);
    }
}