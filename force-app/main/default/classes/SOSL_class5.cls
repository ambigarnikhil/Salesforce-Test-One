public class SOSL_class5 {
    public static void method1(){
        //OR
        List<List<sObject>> abcd = [Find 'Nikhil OR Prate*'Returning Student__c(Name,Student_Name__c)];
        List<Student__c> std = abcd[0];
        System.debug(std);
        //op: It has returned some of the records.
        
        //AND
       List<List<sObject>> abcd1 = [Find 'Nikhil AND Prate*'Returning Student__c(Name,Student_Name__c)];
        List<Student__c> std1 = abcd1[0];
        System.debug(std1);
        //op: It has not returned any record.
        
    }

}