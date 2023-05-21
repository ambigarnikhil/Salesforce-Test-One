public class ExceptionClass2 {
    public static void method1(){
        try{
            List<Account> acc = [Select Name From Account LIMIT 5];
            for(Account it:acc){
                System.debug(it.id);
            }
        }
            catch(Exception e){
                System.debug(e.getMessage());
            }
            try{
                Integer a;
                Integer b= a+4;
            }
            catch(Exception e){
                System.debug(e.getMessage());
                System.debug(e.getCause()); // cause of the exception.
                System.debug(e.getLineNumber()); // Returns the line number from where the exception was thrown.
                System.debug(e.getStackTraceString()); // Returns the stack trace as a string.
                System.debug(e.getTypeName()); // Returns the type of exception.
            }
        }
    }