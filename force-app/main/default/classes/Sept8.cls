public class Sept8 {
    
    public static void soqlbasics(){
        //List<Account> acc = [Select Id, Name From Account where Name Like '%oil%'];
        //System.debug(acc);
        
        String s='Oil';
        List<Account> acc2 = [Select Id, Name From Account Where Name Like :'%'+s+'%' ];
        System.debug(acc2);
    }

}