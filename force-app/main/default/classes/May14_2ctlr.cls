public class May14_2ctlr {
    public Account acc1{get;set;}
    public May14_2ctlr(){
        if(ApexPages.currentPage().getParameters().get('Id')==null){
            acc1 = new Account();
        }
        else{ 
            acc1 = [Select Id, Name, Phone, Industry From Account Where Id =:ApexPages.currentPage().getParameters().get('Id')];
        }
    }
    public PageReference Save(){
        try{
            upsert acc1;
        }
        catch(Exception e){
            System.debug(e.getMessage());
            ApexPages.addMessages(e);
        }
        pagereference pr = new pagereference('https://curious-bear-r8dah4-dev-ed.lightning.force.com/'+acc1.Id);
        return pr;
    }
}