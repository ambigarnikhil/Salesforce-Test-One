public class StdList_CTLR {
    public List<Student__c> students{get;set;}
    public StdList_CTLR(){
        students = [Select Id, Name, Student_Name__c From Student__c];
    }
}