public class April30controller {
    public string searchtext{get;set;}
    public boolean ren{get;set;}
    public boolean ren1{get;set;}
    public List<Contact> conList{get;set;}
    public string objectname {get;set;}
    public string pagemssg{get;set;}
    

    public PageReference getcontacts(){
        if(searchtext == null || searchtext == ''){
            pagemssg= 'Please Enter some text to search:';
            ren1=true;
            ren=false;
            return null;
        }
        if(searchtext != null || searchtext != ''){
            string query = 'Select Id, Name From Contact Where Name Like' +' \'%'+searchtext+'%\'';
            conList = Database.query(query);
            if(conList.size()==0){
                  pagemssg= 'No records found';
                  ren1=true;
                  ren=false;
                return null;
        	}
            else if(conList.size()>0){
                ren=true;
                ren1=false;
                return null;
            }
        }
        return null;
    }
}