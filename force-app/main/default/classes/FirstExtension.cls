public class FirstExtension {
    public List<Contact> conList{get;set;}
    public FirstExtension(FirstCustomController fcc){
        conList = [Select Id, Name, Email From Contact];
	}
    public FirstExtension(){
        conList = [Select Id, Name, Email From Contact];
	}
}