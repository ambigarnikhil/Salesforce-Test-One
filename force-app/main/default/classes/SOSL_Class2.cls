public class SOSL_Class2 {
    public static void method1(){
        /*
         Search in Specified Fields(Search Group)
		 1)All Fields(By default)
		 2) Name Fields
		 3) Email Fields
		 4) Phone Fields
		 5) Sidebar Fields
        */
        // ALl Fields
        List<List<sObject>> s = [Find 'Nikhil' IN All Fields Returning Contact,Student__c];
        List<Contact> con= s[0];
        List<Student__c> std =s[1];
        for(Contact itc: con){
            System.debug(itc);
        }
        for(Student__c its: std){
            System.debug(its);
        }
        
        List<List<sObject>> s1 = [Find 'Univ*' In Name FIELDS RETURNING Account(Name, BillingCountry)];
        List<Account> acc1= s1[0];
        for(Account ita: acc1){
            System.debug(ita);
        }
        List<List<sObject>> s2 = [Find '*com' In Email FIELDS RETURNING Contact(Name, firstName, lastName)];
        List<Contact> con1= s2[0];
        for(Contact itcc: con1){
            System.debug(itcc);
        }
        
         List<List<sObject>> s3 = [Find '1234*' In Phone FIELDS RETURNING Contact(Name, firstName, lastName)];
        List<Contact> con2= s3[0];
        for(Contact itcc1: con2){
            System.debug(itcc1);
        }
        
    }
}