public class may2_5ctlr {
    public String recordId;
    public Student__c std{get;set;}
    public may2_5ctlr(){
        Map<String,String> parameters = ApexPages.currentPage().getParameters();
        recordId = parameters.get('Id');
        std = [Select Id, Name From Student__c Where Id =: recordId][0];
    }
}