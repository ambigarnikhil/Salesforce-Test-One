public class Bestpractices {
    
    public static void method1(){
        // Not Appropriate.
        List<Account> ls = [Select Id, Name From Account LIMIT 5];
        for(Account it:ls){
            List<opportunity> opp = [Select Id, Name From Opportunity Where accountId =:it.ID];
            for(Opportunity ito: opp){
                System.debug(ito.Name);
            }
        }
        //Appropriate
        List<Account> lsa1 = [Select Id, Name From Account Limit 5];
        List<Opportunity> opp1 = [Select Id, Name From Opportunity Where accountId in :lsa1];
        for(Opportunity it1: opp1){
                System.debug(it1.Name);
            }
    }
    public static void method2(){
        // Not Appropriate.
        for(Integer i=0;i<5;i++){
            Account temp = new Account(Name='Temp'+(i+1));
            insert temp;
        }
        
        //Appropriate
        List<Account> lacc = new List<Account>();
        for(Integer j=0;j<5;j++){
            Account temp1 = new Account(Name='Powerful'+(j+1));
            lacc.add(temp1);
        }
        insert lacc;
    }

}