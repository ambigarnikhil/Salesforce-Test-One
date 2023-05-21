public class userClone_Controller {
    public String userName{get;set;}
    public String emailinput{get;set;}
    public User existingUser{get;set;}
    public boolean display{get;set;}
    public boolean errormssg{get;set;}
    public string comerrormssg{get;set;}
    public userClone_Controller(){
        userName = userInfo.getName();
    }
    
    public void getUser(){
        display=true;
		System.debug('Get user method is called');
        if(emailinput == '' || emailinput == null){
            //ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,'Please enter the email address.'));
            errormssg = true;
            comerrormssg = 'Error';
        }
        if(emailinput != '' && emailinput != null){
            existingUser = [Select Id, Name, Email From User Where email =:emailinput][0];
        }        
        if(existingUser.Id == null){
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,'Please enter the valid email address.'));
        }
    }
}