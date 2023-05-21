public class DML_Class1 {
     public static void method_insert(){
        List<Student__c> stdinsert = new List<Student__c>();
         for(Integer i=0;i<5;i++){
             Student__c temp = new Student__c(Student_Name__c = 'Temp'+i);
             stdinsert.add(temp);
         }
         insert stdinsert;
    } 
    public static void method_update(){
        List<Student__c> stdupdate = new List<Student__c>();
        stdupdate = [Select Id, Name, Student_Name__c FROM Student__c Where CreatedDate = TODAY];
        Integer i=0;
        for(Student__c it: stdupdate){
            it.Age__c = 20+i;
            it.Student_Name__c = it.Student_Name__c+'Updated';
            i++;
        }
        update stdupdate;
    }
    public static void method_upsert(){
        List<Student__c> stdupsert= new List<Student__c>();
        stdupsert= [Select Id, Name from Student__c Where CreatedDate= Today];
        Integer i = 101;
        for(Student__c its: stdupsert){
            its.Mobile_Number__c = '9987654'+i;
            i+=100;
        }
        for(Integer a= 0;a<2;a++){
            Student__c sd = new Student__c(Student_Name__c ='October3'+a);
            stdupsert.add(sd);
        }
        upsert stdupsert;
    }
    public static void method_delete(){
        List<Student__c> stddelete = [Select Id, Name, Student_Name__c From Student__c Where Student_Name__c LIKE 'October%' OR Student_Name__c Like '_emp_Upd%'];
        delete stddelete;
    }
    public static void method_undelete(){
        //Note: We can't use ALL ROWS in query editor.
        List<Student__c> stdundelete = [Select Id, Name, Student_Name__c From Student__c Where (Student_Name__c LIKE 'October%' OR Student_Name__c Like '_emp_Upd%') AND isDeleted=true ALL ROWS];
        undelete stdundelete;
    }
    public static void method_merge(){
        //Merge operations works on only certain objects.
        //It doesn't work on all the Objects.
        //Consider Account1 and Account2
        //Account1 has Contact1, Contact2 and Opportunity1, opportunity3
        //Account2 has Contact3, Contact4, Contact5 and Opportunity2, Opportunity4.
        // When we merge Account2 with Account1, all the related records of account2 will be reparented to Account1.
        // Now, Account1 has Contact1, Contact2, Contact3, Contact4, Contact5 and Opportunity1, Opportunity2, Opportunity3, Opportunity4.
        // Account2 will be deleted.
        // When we merge, two things happen first is reparenting and second is deleting.
        // No field value from account2 will get  updated to account1
    }
    public static void assignment1(){
        List<Opportunity> opp = [Select Id, Name, CloseDate From Opportunity ALL ROWS];
        for(Opportunity it: opp){
            it.CloseDate = Date.today()+90;
        }
        update opp;
    }
    public static void assignment2(){
        List<String> ls = new List<String> {'MiniCopper1','MiniCopper2','MiniCopper3','MiniCopper4','MiniCopper5'};
        List<Product2> prd = [Select Id, Name From Product2 Where Name NOT IN :ls];
        for(Product2 it1: prd){
            String temp = it1.Name;
            temp= temp.substring(0,temp.length()-2);
            it1.Name= temp; 
        }
        for(Integer i=0;i<5;i++){
            Product2 temp = new Product2();
            temp.Name='MiniCopper'+(i+1);
            prd.add(temp);
        }
        upsert prd;
    }
    public static void assignment3(){
        //Delete Duplicate contacts.
        Map<String, Id> cmap = new Map<String, Id>();
        List<Contact> allcon = [Select Id, Name From Contact];
        for(Contact it: allcon){
            cmap.put(it.name,it.id);
        }
        List<Contact> uniquecon = new List<Contact>();
        List<Contact> duplicatecon = new List<Contact>();
        Set<String> iter = cmap.keySet();
        Set<Id> uniqset = new Set<Id>();
        for(String s: iter){
            uniqset.add(cmap.get(s));  
        }
        for(Contact x: allcon){
            if(uniqset.contains(x.id)){
                uniquecon.add(x);
            }
            else{
                duplicatecon.add(x);
            }
        }
        delete duplicatecon;
    }
    public static void assignment4(){
        List<Contact> cond = [Select Id, Name From Contact Where isDeleted = true AND LastModifiedDate = TODAY ALL ROWS];
        undelete cond;
    }
    public static void mergeassignment(){
        List<Account> la = [Select Id, Name From Account Where Name Like 'Merge%' Order By Name];
        Account a = la[0];
        Account b= la[1];
        Account c=la[2];
        List<Account> mergelist =new List<Account>();
        mergelist.add(b);
        mergelist.add(c);
        merge a mergelist;
    }
}