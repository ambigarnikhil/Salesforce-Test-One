public class FirstCustomController {
    //Account Variables
    public string accName{get;set;}

    //Contact Variables
    public string lastName{get;set;}
    public string email{get;set;}
    public string mobile{get;set;}

    //Student Variables
    public string studentName{get;set;}

    public Pagereference saveAllRecords(){
        Account a = new Account(Name = accName);
        insert a;
        Contact c = new Contact(LastName=lastName,Email=email,MobilePhone=mobile,AccountId=a.Id);
        insert c;
        Student__c s = new Student__c(Student_Name__c=studentName, Contact__c=c.Id);
        insert s;
        Pagereference pf = new Pagereference('/apex/Thankyoupage');
        return pf;
    }

}