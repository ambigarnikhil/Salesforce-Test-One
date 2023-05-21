public class DatabaseClass {
    public static void method1(){
        List<Contact> con = [Select Id, Name From Contact where isDeleted=true ALL ROWS];
        Database.emptyRecycleBin(con);
    }
    public static void method2(){
        //The below dynamic soql will not work
        //Integer i1= Database.query('Select Count() from Account');
        Integer i2 = Database.countQuery('Select Count() from Account');
        System.debug(i2);
        //Integer i3 = Database.countQuery('Select Count(Id) from Account');  Exception
    }
    public static void method3(){
        //Transaction control and roll Back
        Savepoint sp1 = Database.setSavepoint(); //Saving the state of database.
        try{
            Account acc= [Select Id, Name, NumberofEmployees From Account Limit 1];
            acc.NumberOfEmployees = 123;
            update acc;
            Student__c s= [Select Id, Name, Age__c From Student__c Limit 1];
            s.Age__c= 29;
            update s;
        }
        catch(Exception e){
            Database.rollback(sp1);
        }
    }
    public static void method4(){
        List<Account> ls = new List<Account>();
        for(Integer i=0;i<10;i++){
            ls.add(new Account(Name='October'+(i+1)));
        }
        ls.add(new Account());
        System.debug('Total Accounts: '+ ls.size());
        Database.SaveResult[] savelist = Database.Insert(ls,false);
        for(Database.SaveResult it:savelist){
            if(it.isSuccess()){
                System.debug('New Account created and Id is '+ it.getID());
            }
            else{
                System.debug('Record failed because of following errors');
                for(Database.error ite: it.getErrors()){
                    System.debug(ite.getMessage());
                }
            }
        }
    }
}