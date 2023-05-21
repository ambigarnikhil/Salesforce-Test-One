public class sept26 {
    public void dynamicsoql(){
        // Query Exception
       String s= 'Select Id, PhoneNumber from Account';
        List<Account> acc = Database.query(s);
        System.debug(acc);
        
    }
}