public class SOSL {
    //In Apex - Find 'What' IN [What type] Returning [Where]
    //In Query Editor - Find {What} IN [What type] Returning [Where]
    //Where - Objects
    //What type - Search Group (By default, it is all fields)    
    public void method1(){
        List<List<sObject>> std = [Find 'Nikhil' Returning Contact, Student__c];
        System.Debug(std);
        List<Contact> con = std[0];
        List<Student__c> constd =std[1];
        System.debug(con);
        System.debug(constd);
        List<List<sObject>> std1 = [Find 'Nikhil' Returning Student__c(Name, Age__c, Student_Name__c)];
    }
}