public class Temp20 {
    public static void method1(){
        System.debug('Hello');
        try{
            Integer i;
        	Integer j=i+5;
            System.debug('World');
        }
        catch(Exception e){
            System.debug(e.getMessage());
        }
        
    }
}