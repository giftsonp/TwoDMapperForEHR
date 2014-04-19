<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta name="description" content="Welcome to 2D Body Image Mapping on EHR, A website for annotating diseases on the human Body Map. This is the Logout Page" />
<meta name="keywords" content="Body Mapping, Image Mapping, Mapper, EHR, Two Dimensional Human Body, 2D, Body Annotation, Home Page, Human model, 3d Model, Weg gl" />
    <meta name="author" content="">

	 <link rel="icon" type="image/png" href="img/icon.PNG">
    <title>Login</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
       <link href="css/sb-admin.css" rel="stylesheet">
       <script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.js" type ="text/javascript"></script>

    <!-- Add custom CSS here -->
    <link href="css/business-casual.css" rel="stylesheet">
    
    <script type="text/javascript">
$(document).ready(function(){   
	

	var UA = "User-agent header sent: " + navigator.userAgent;
	
	 if (UA.toLowerCase().indexOf("android") >= 0){
	
		 
		 $('#rowID').removeAttr("style");
	 }
	
	if (!window.location.search) 
	{ 
	setTimeout("window.location+='?refreshed';", .1000); 
	} 
	

	// function to make AJAX call to the server
	$("#login").submit(function(e){
	  console.log("in submit");
	     e.preventDefault();
	     var formdata = new Object();
	     var inpele = document.getElementsByTagName("input");
	     for (var i = 0; i < inpele.length; i++) {
	       formdata[inpele[i].name] = inpele[i].value;
	      }
	     frmd = JSON.stringify(formdata);
	    
	   $.ajax ({
	        			url : "SignInAction",
	        			type : "POST",
	        			dataType: "json",
	                    async: false,
	        			data : frmd,      			
	 				    success: function(data) {	 
	 				    	
	 				    	 var session = '${user}';
	 				    	
	 				    	if(data.role=="Doctor")
	 				    	{
	 				    		
	 				    		
	 				    		
	 				    		location.href = 'DoctorLandingPage.jsp?obj='+ data + '&session=' +session;
	 				    		
	 				    	}
	 				    	else if(data.role=="Patient")
	 				    		{
	 				    		
	 				    		
	 				    		location.href = 'PatientLandingPage.jsp?obj='+ data + '&session=' +session;;
	 				    		
	 				    		}
	 				    	
	 				    	
	 				    	else if(data=="Invalid Username and password!")
 				    		{
	 				    	document.getElementById('errorDiv').style.visibility='hidden'; 
 				    		document.getElementById('errorDivError').style.visibility='visible'; 
 				    		}
			    		
	        		          
	        		          
	      
	        		         
	        		 },
	        		        error: function() {
	        		        	
	        		        	document.getElementById('errorDiv').style.visibility='visible'; 
	        		            /* alert("An error occured while attempting fetch data."); */
	        		            
	        		            
	        		        }
	        			
	      		 });
	     
   	
	 });   
	
/* 	  var patientGender = '${user.firstName}';
	 alert(patientGender);  */
	
 }); 

</script>

<script type="text/javascript">




</script>
  </head>

  <body>
  <jsp:include page="HeaderLayout.jsp" />
  <input type="hidden" value="<%session.invalidate(); %>">
  
    <div class="container" style="height: 100%">

      <div class="row" style="height: 710px">
        <div class="box" style="height: 100%">
          <div id="rowID" class="row" style="border:1px solid; position: absolute;border-radius:25px; width: 30%;  left: 38%;"  > 
          <div class="col-lg-12">
            <hr>
            <h2 class="intro-text text-center">Login <strong>form</strong></h2>
            <hr>
                 <form role="form" id = "login">
                  <div class="row">
                  <div class="form-group col-lg-11" style="left: 5%;"> 
                   <div class="alert alert-success alert-dismissable" id="errorDiv">
              <button type="button" class="close" data-dismiss="alert" id="error" aria-hidden="true">&times;</button>
             Thank you for using 2 Dimensional human body mapping on EHR! You Have been Logged out! See You soon!
            </div>
                    <div class="form-group col-lg-13">
                      <label>Enter your Email: <span class="required">*</span></label>
                      <input id = "email" type = "email" class="form-control" name = "email" placeholder = "John@gmail.com" required/>
                      <div class="errorMessage" id="BusinessLoginForm_email_em_" style="display:none">Email cannot be blank.</div>
                    </div>
 <div class="clearfix"></div>
                    <div class="form-group col-lg-13">
                      <label>Enter your Password: <span class="required">*</span> </label>
                      <input id = "pwd" class="form-control" type = "password" name = "pwd" required >
                    </div>
                  
                    <div class="clearfix"></div>
                    <div class="form-group col-lg-13">                   
                      <button type="submit" class="btn btn-primary" style="width:100%">Login</button>
                    </div>
                </div>
                </div>
                <div class="alert alert-danger alert-dismissable" id="errorDivError" style="visibility: hidden; width: 100%">
              <button type="button" class="close" data-dismiss="alert" id="error" aria-hidden="true">&times;</button>
              Invalid User Name or Password!! Please Enter Valid Credentials or Register!
            </div>
              </form>
          </div>
        </div>
        </div>
      </div>

    </div><!-- /.container -->
    
      <jsp:include page="FooterLayout.jsp" />
  </body>
</html>