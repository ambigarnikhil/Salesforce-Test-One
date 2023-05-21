public class SOSL_Class4 {
    public static void main(){
        // Dynamic SOSL
        String s='Find \'Nikhil\' RETURNING Student__c';
        List<List<sObject>> sl = Search.query(s);
        List<Student__c> std = sl[0];
        System.debug(std);
    }
}