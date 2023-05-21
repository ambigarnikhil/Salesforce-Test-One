public class FlowseriesCase {
    @InvocableMethod(label='Send email to contact'
                     description='Send email to contact.'
                     category = 'Case')
    public static void sendemailToContact(List<request> req){
        
        String contactId = req.get(0).contactIds;
        List<String> contactIds = new List<Id>{contactId};
        String casenumber =  req.get(0).casenumber;
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toaddresses = contactIds;
        message.subject= 'Your case has been received';
        message.plainTextBody = 'Your case has been received';
        message.setSaveAsActivity(true);
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>{message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        if(results[0].success){
            System.debug('The email was sent successfully');
        }
        else{
            System.debug('The email failed to send: '+results[0].errors[0].message);
        }    
    }
    
    public class request{
        @Invocablevariable(label='Case Id' required=true)
        public String caseIds;
        @Invocablevariable(label ='Contact Id' required= true)
        public String contactIds;
        @Invocablevariable(label ='Case Number' required= true)
        public String casenumber;
    }
    
}