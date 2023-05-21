public class CustomExceptiondemo {
    public static void method1(Integer i){
        try{
            if(i<0){
                throw new Myexception();
            }
            else{
                i=i*i-i;
                System.debug(i);
            }
        }
        catch(Myexception e){
            System.debug('Number is negative');
        }
    }
}