global class FirstBatchClass implements Database.Batchable<sObject>{
	
    global Integer count =0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select AnnualRevenue from Lead]);
        // Database.getQueryLocator - This will return the results in batches.
    }
    global void execute(Database.BatchableContext bc, List<Lead> llist){
     
        for(Lead it: llist){
            it.AnnualRevenue = 3000000;
            System.debug(count);
            count+=1;
        }
        update llist;
    }
    global void finish(Database.BatchableContext bc){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> receiver = new List<String>{'nikhilambigar23@gmail.com'};
        String param1 = 'Batch class executed';
        mail.setToAddresses(receiver);
        mail.setSubject(param1);
        mail.setPlainTextBody('Hey Nikhil ambigar, The batch class is executed successfully. The total number of records processed are '+count+'.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});   
        
    }
}