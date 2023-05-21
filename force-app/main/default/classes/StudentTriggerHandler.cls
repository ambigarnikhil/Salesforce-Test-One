public class StudentTriggerHandler {
    
    public static void scholarship_Update(List<Student__c> studentslist){
        for(Student__c it: studentslist){
            it.Scholarship__c = 1000;
        }
    }

}