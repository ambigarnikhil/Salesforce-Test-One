public class May14_4_CTLR {
    public Student__c student{get;set;}
    public May14_4_CTLR(){
        Id recordId= ApexPages.currentPage().getparameters().get('id');
        student = [Select Id, Student_Name__c, Graduated__c,Currently_working_at__c From Student__c Where id=: recordId];
    }
}