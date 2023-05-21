public class ExceptionClass1 {
    public static void method1(){
        /* System Exception*/
        // DML Exception 
        try{
            Account a= new Account();
            insert a;
        }
        catch(DMLException e){
            System.debug('Following error occured: '+ e.getMessage());
        }
    }
    //List Exception
    public static void method2(){
        try{
            List<String> ls = new List<String>{'Nikhil','Varun'};
            System.debug(ls[0]);
            System.Debug(ls[1]);
            System.debug(ls[2]); // will throw list exception as there is no element on index 3.
        }
        catch(ListException le){
            System.debug('Following error occured: '+ le.getMessage());
        }
    }
    //null pointer exception
    public static void method3(){
        try{
            //Example 1
            Integer a;
            Integer b=a*8; //will throw a null pointer exception
            
            //Example 2
            List<integer> ilist;
            ilist.add(1); //throws nullpointer Exception as list does not refer to any object.
            
            //Example 3 
            Account acc;
            acc.Name='Temp'; //throws nullpointer Exception as list does not refer to any object.
        }
        catch(NullPointerException npe){
            System.debug(npe.getLineNumber());
            System.debug('Following error occured: ' +npe.getMessage());
        }
    }
    //Query Exception
    public static void method4(){
        try{
            Account a = [Select Id, Name From Account]; // this will return many records but are assigning it to a single account object.
            Account b = [Select Id, Name From Account Where Name='Any Company']; //This will return no record
        }
        catch(QueryException qe){
            System.debug('Following error occured: '+ qe.getMessage());
        }
    }
    //sObject Exception
    public static void method5(){
        try{
			List<Account> acc= [Select Name From Account];
            for(Account it:acc){
                System.debug(it.NumberOfEmployees); // you are trying to access the field which is not part of query .
            }
        }
        catch(sObjectException soe){
            System.debug('Following Errors occured: '+ soe.getMessage());
        }
    }
}