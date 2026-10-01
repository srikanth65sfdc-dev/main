public class TaskUtils {
    public static String getTaskPriority(String LeadState){
        //Validate input
        if(String.isBlank(LeadState) || LeadState.Length()>2){
            return null;
        }
        String taskPriority;
        if(LeadState == 'CA'){
            taskPriority ='High';
                }else{
                  taskPriority ='Low';  
                }
        return taskPriority;
    }
}