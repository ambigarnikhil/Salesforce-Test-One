public class RecordTransfer_CTLR {
    public Id recordId{get;set;}
    public string recordId1;
    public string recordIdmethod2{get;set;}
    public String errormssg{get;set;}
    public boolean errormssgren{get;set;}
    public string infomssg{get;set;}
    public boolean infomssgren{get;set;}
    public boolean infomssgren2{get;set;}
    public sObject temp{get;set;}
    public boolean method1{get;set;}
    public boolean method2{get;set;}
    public boolean renmethod1{get;set;}
    public boolean renmethod2{get;set;}
    public List<String> fields{get;set;}
    public boolean recordren{get;set;}
    public List<String> allObjects{get;set;}
    public String SelectedObjectName{get;set;}
    public List<SelectOption> allObjectspick{get;set;}
    public List<SelectOption> allfieldspick{get;set;}
    public List<String> SelectedFieldNames{get;set;}
    public boolean renfieldname{get;set;}
    public boolean recordmethod2ren{get;set;}
    public sObject method2record{get;set;}
    public string method2response{get;set;}
    public string method1response{get;set;}
    public string severity{get;set;}
    
    //external callout
    public void getrecord(){
        recordId1 = (string)recordId;
        System.debug(recordId1.length());
        if(recordId1 == '' || recordId1 == null){
            errormssg = 'Please enter the target org record Id.';
            errormssgren = true;   
        }
        else{
            errormssgren = false;
            System.debug(recordId);
            String sObjName = recordId.getSObjectType().getDescribe().getName();
            String sObjlabel = recordId.getSObjectType().getDescribe().getlabel();
            System.debug(sObjName);
            infomssgren = true;
            fields = new List<String>(Schema.getGlobalDescribe().get(sObjName).getDescribe().fields.getMap().keySet());
            //String query = 'Select '+String.join(fields, ',')+' From '+sObjName+' Where Id =\''+recordId+'\''+' Limit 1';
            //System.debug(query);
            //temp = Database.query(query);
            //System.debug(temp);
            recordren = true;
            //makecallout(recordId);
            String accessToken = generateaccessToken();
            System.debug('Access Token:'+ accessToken);
            HttpRequest req = new HttpRequest();
            String geturl = 'https://brave-fox-61u71g-dev-ed.trailblaze.my.salesforce.com/services/data/v57.0/sobjects/'+sObjName+'/'+recordId;
            req.setEndpoint(geturl);
            req.setMethod('GET');
    
            string autho = 'Bearer '+accessToken;
            System.debug(autho);
            req.setHeader('Authorization',autho);
            req.setHeader('Content-Type','application/json');
            Http http = new Http();
            System.debug('Request:'+ req);
            System.debug(req.getBody());
            System.debug(req.getMethod());
            HTTPresponse res= http.send(req);
            System.debug('Status ' + res.getStatus());
            if(res.getStatus()=='OK'){
                infomssg = sObjlabel+' record fetched from target org.';
                severity = 'Confirm';
            }
            if(res.getStatus()!='OK'){
                infomssg = 'Fetching of '+sObjlabel+' record from target org failed.(INVALID RECORD ID)';
                severity = 'Error';
            }
            method1response = res.getBody();
            }
        }
    
    public void setparameters1(){
           renmethod1 = true;
        	renmethod2 = false;
    }
    public List<SelectOption> getObjects() {
 	 	List<SelectOption> options = new List<SelectOption>();
         options.add(new SelectOption('', '-- Select Object --'));
        Integer i=1;
        for ( Schema.SObjectType o : Schema.getGlobalDescribe().values() ){
                Schema.DescribeSObjectResult objResult = o.getDescribe();
                //system.debug( 'Sobject API Name: ' + objResult.getName());
            if(i<1000){
                options.add(new SelectOption(objResult.getLabel(),objResult.getName()));
                i++;
            }    
        }
        System.debug(options);
 	 	return options;
  	}
    public List<SelectOption> getfields() {
 	 	List<SelectOption> options = new List<SelectOption>();
        Integer i=0;
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(SelectedObjectName);
        Map<String, Schema.SObjectField> fieldMap = targetType.getDescribe().fields.getMap();
            for (Schema.SObjectField field : fieldMap.values()) {
                 if(i<1000){
                options.add(new SelectOption(field.getDescribe().getName(),field.getDescribe().getLabel()));
                i++;
            }   
             }
        System.debug(options);
 	 	return options;
  	}
    public void setparameters2(){
           renmethod2 = true;
        	renmethod1 = false;
        	allObjectspick= getObjects();   	
    }
    public void getfieldsmethod(){
        renfieldname=true;
        allfieldspick= getfields();
    }
	 
    public void method2getrecord(){
        recordmethod2ren = true;
        String accessToken = generateaccessToken();
        System.debug('Access Token:'+ accessToken);
        String query1 = 'Select+'+String.join(SelectedFieldNames, ',')+'+From+'+SelectedObjectName+'+Where+Id=\''+recordIdmethod2+'\''+'+Limit+1';
        HttpRequest req = new HttpRequest();
        String geturl = 'https://brave-fox-61u71g-dev-ed.trailblaze.my.salesforce.com/services/data/v39.0/query/?q='+query1;
        //String geturl = 'https://brave-fox-61u71g-dev-ed.trailblaze.my.salesforce.com/services/data/v39.0/query/?q=Select+Id,MasterRecordId,AccountId,LastName,FirstName+From+Contact+Where+Id=\'0035i00000SRe0X\'+Limit+1';
        req.setEndpoint(geturl);
        req.setMethod('GET');

        string autho = 'Bearer '+accessToken;
        System.debug(autho);
        req.setHeader('Authorization',autho);
        req.setHeader('Content-Type','application/json');
        Http http = new Http();
        System.debug('Request:'+ req);
        System.debug(req.getBody());
        System.debug(req.getMethod());
        HTTPresponse res= http.send(req);
        method2response = res.getBody();
        infomssgren2 = true;
        JSONParser parser = JSON.createParser(res.getBody());
        String totalsize;
            while(parser.nextToken() !=null) { 
                    if (parser.getCurrentToken() != JSONToken.END_OBJECT) {  
                        if(parser.getCurrentName() == 'totalSize') { 
                        totalsize = parser.getText(); 
                        }
                }
            }
        System.debug(totalsize);
        if(res.getStatus()=='OK' && totalsize !='0'){
                infomssg = SelectedObjectName+' record fetched from target org.';
                severity = 'Confirm';
            }
            if(res.getStatus()=='OK' && totalsize=='0'){
                infomssg = 'Fetching of '+SelectedObjectName+' record from target org failed.(INVALID RECORD ID)';
                severity = 'Error';
            }
        
    }
    public String generateaccessToken(){
        String accessToken;
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setHeader('Content-Type','application/x-www-form-urlencoded');
        req.setEndpoint('https://brave-fox-61u71g-dev-ed.trailblaze.my.salesforce.com/services/oauth2/token');

        authdetails ad = new authdetails(); 
        String CLIENT_ID = ad.CLIENT_ID;
        String CLIENT_SECRET = ad.CLIENT_SECRET;
        String USERNAME = ad.USERNAME;
        String PASSWORD = ad.PASSWORD;
        
        req.setBody('grant_type=password' + '&client_id='+CLIENT_ID + 
                    '&client_secret='+CLIENT_SECRET + '&username='+USERNAME + '&password='+PASSWORD);
        
        Http http = new Http();
        HTTPResponse response = http.send(req);
        JSONParser parser = JSON.createParser(response.getBody());
            String fieldName,fieldValue; 
            while(parser.nextToken() !=null) { 
                    if (parser.getCurrentToken() != JSONToken.END_OBJECT) {
                        fieldName = parser.getCurrentName(); 
                        fieldValue = parser.getText(); 
                        if(fieldName == 'access_token') { 
                        accessToken = fieldValue; 
                        }
                }
            }
        	//system.assertEquals(null, response.getBody() );
            return accessToken;
    }
    public class authdetails{
        String CLIENT_ID = '3MVG9wt4IL4O5wvIVo6Jqp6zWesrV2tt4wWpYO0d8DG6u26IIfN5URJISoFT7VkptWXdursg0g5SCoi7lQsf7';
        String CLIENT_SECRET = 'C76CFC049AA5FFD246D56ADD28D35BEDACEB59864AB6A8F961615A85AE460802';
        String USERNAME = 'ambigarnikhil@brave-fox-61u71g.com';
        String PASSWORD = 'Moonview.123CkcvEJNAELogsUj4aHWpqGXL';
    }
}