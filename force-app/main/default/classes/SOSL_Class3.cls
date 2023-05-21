public class SOSL_Class3 {
    public static void method1(){
        //Wild cards
        List<List<sObject>> sb = [Find 'Ni?hil' Returning Student__c, Contact];
        List<Student__c> std= sb[0];
        System.debug(std);
        List<Contact> con= sb[1];
        System.debug(con);
    }
    public static void method2(){
        /* Clauses in SOSL*/
        //WHERE Clause
        List<List<sObject>> sl = [Find 'Nikhil' Returning Student__c(Name, Student_Name__c, Age__c Where Age__c>20)];
        List<Student__c> stu =sl[0];
        System.debug(stu);
        
        // ORDER BY CLAUSE
        List<List<sObject>> sl1 = [Find 'Ni*' Returning Student__c(Name, Student_Name__c, Age__c ORDER BY Name)];
        List<Student__c> stu1 =sl1[0];
        System.debug(stu1);
        
        //LIMIT
         List<List<sObject>> sl2 = [Find 'Ni*' Returning Student__c(Name, Student_Name__c, Age__c ORDER BY Name LIMIT 1)];
        List<Student__c> stu2 =sl2[0];
        System.debug(stu2);
    }
    
}