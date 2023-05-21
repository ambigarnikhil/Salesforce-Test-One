public class Flowseries {
	
    @InvocableMethod(label='Delete Related opportunities for the given record ids.'
                     description='Returns list of account names corresponding to the specified account Ids.'
                     category = 'Account')
    public static void deleteopportunity(List<Id> ids){
        List<Opportunity> opp = [Select Id, Name from Opportunity where AccountId in :ids And StageName = 'Closed Won'];
        delete opp;
    }
    
}