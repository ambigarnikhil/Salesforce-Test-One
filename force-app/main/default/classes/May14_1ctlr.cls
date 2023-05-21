public class May14_1ctlr {
    public Account account{get;set;}
    public May14_1ctlr(){
		account = [Select Id, Name, Site from Account where Id=: ApexPages.currentPage().getParameters().get('id')];
    }
    public PageReference Save(){
         update account;
        return null;
    }
}