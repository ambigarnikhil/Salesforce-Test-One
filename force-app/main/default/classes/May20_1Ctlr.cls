public class May20_1Ctlr {
    public Id recordId;
    public boolean imagerender{get;set;}
    public Document doc{get;set;}
    public Document extdoc;
    public string url{get;set;}
    public Student__c std{get;set;}
    
    
    public May20_1Ctlr(){
        recordId = ApexPages.currentPage().getParameters().get('Id');
        if(recordId != null || recordId !=''){
            std = [Select Id, Name, Student_Image_Id__c,Student_Name__c from Student__c Where Id =:recordId];
        }
        System.debug(std.Student_Image_Id__c);
        if(std.Student_Image_Id__c == null){
            imagerender = false;
            doc = new Document();
        }
        if(std.Student_Image_Id__c != null){
            url = 'https://curious-bear-r8dah4-dev-ed.file.force.com/servlet/servlet.FileDownload?file='+std.Student_Image_Id__c;
            imagerender = true;
            doc= [Select Id, Name From Document Where Id=: std.Student_Image_Id__c];
        }
    }
    public void Save(){
        Folder bmwFolder = [Select Id, Name From Folder Where Name = 'BMW_Group'];
        if(std.Student_Image_Id__c == null){
            doc.FolderId = bmwFolder.id;
                doc.ContentType = 'image/jpg';	
                doc.IsPublic = true;
                System.debug(doc);
                insert doc;
            	std.Student_Image_Id__c= doc.Id;
        		update std;
            }
        if(std.Student_Image_Id__c != null){
            update doc;
        }
        	url = 'https://curious-bear-r8dah4-dev-ed.file.force.com/servlet/servlet.FileDownload?file='+std.Student_Image_Id__c;
        	imagerender = true;
        
    }

}