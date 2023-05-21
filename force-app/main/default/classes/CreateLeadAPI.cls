@RESTResource (urlMapping='/CreateLead/') 
global class CreateLeadAPI { 
	@HTTPPost 
    global static String creatingLeadRecord() { 
    string fName, lName, comp; 
    string fieldName, fieldValue;
    RestRequest req = RestContext.request; 
    RestResponse res = RestContext.response; 
    String jsonBody = req.requestBody.toString(); 
    JSONParser parser = JSON.createParser(jsonBody); 
    while(parser.nextToken() !=null) { 
        if (parser.getCurrentToken() != JSONToken.END_OBJECT) {
         fieldName = parser.getCurrentName(); 
        fieldValue = parser.getText(); 
        if(fieldName == 'FirstName') { 
        fName = fieldValue; 
        } else if(fieldName == 'LastName') { 
        lName = fieldValue;
        }
        else if(fieldname == 'Company'){
        comp= fieldValue;
        }
        } 
        }
        Lead l = new lead(firstName = fname, lastName = lname, company=comp);
        Insert l;
        return l.id;
        }
}