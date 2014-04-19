<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta name="description" content="Welcome to 2D Body Image Mapping on EHR, A website for annotating diseases on the human Body Map. This is the Login Page" />
<meta name="keywords" content="Body Mapping, Image Mapping, Mapper, EHR, Two Dimensional Human Body, 2D, Body Annotation, Home Page, Human model, 3d Model, Weg gl" />
  
    <meta name="author" content="">

    <title>Login</title>

    <!-- Bootstrap core CSS -->
  	<link rel="icon" type="image/png" href="img/icon.PNG">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
     
     <script src="js/bootstrap.js"></script>
    <!--  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
     <script src="js/jquery.js"></script>
    
    <script type="text/javascript">
$(document).ready(function(){       
	

	var UA = "User-agent header sent: " + navigator.userAgent;
	
	 if (UA.toLowerCase().indexOf("android") >= 0){
	
		 
		 $('#rowID').removeAttr("style");
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
	 				    	 
	 				    	if(data)
	 				    		{
	 				    		
	 				    		 if(data.role=="Doctor")
			 				    	{
		 				    		  /*   int count=data.count1;	 */	
			 				    		location.href = 'DoctorLandingPage.jsp?session='+ session;
			 				    		
			 				    	}
			 				    	else if(data.role=="Patient")
			 				    		{
			 				    		
			 				    		
			 				    		location.href = 'PatientLandingPage.jsp?session='+ session;;
			 				    		
			 				    		}	
			 				    	else if(data=="Invalid Username and password!")
			 				    		{
			 				    		document.getElementById('errorDiv').style.visibility='visible'; 
			 				    		}
	 				    		
	 				    		
	 				    		}
	 				    	else
	 				    		{
	 				    		
	 				    		document.getElementById('errorDiv').style.visibility='visible'; 
	 				    		
	 				    		
	 				    		}
	 				    		
	 				    				    	
	 					    	
	 				    	
	 				    	
	 		/* 		    	alert(data); */
	        		            
	        		         /*  alert(data.firstName); */
	        		          
	        		          
	      
	        		         
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

  
    <!-- PDF Printing -->
    <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
    <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/element/element-min.js"></script>
    
 <!--   <script type="text/javascript">
        var myEditor = new YAHOO.widget.SimpleEditor('CUrl', {
            height: '300px',
            width: '600px',
            dompath: true
        });
        myEditor.render();

        YAHOO.util.Event.on('btnConvert', 'click', function () {
            myEditor.saveHTML();
        });
    </script> -->






  </head>

  <body>
  <jsp:include page="HeaderLayout.jsp" />
       <div class="container" style="height: 100%">

      <div class="row" style="height: 710px">
        <div class="box" style="height: 100%">
          <div id="rowID" class="row" style="border:1px solid; position: absolute;border-radius:25px;width: 30%; top:35%;  left: 36%;"   > 
          <div class="col-lg-12">
            <hr>
            <h2 class="intro-text text-center">Login <strong>form</strong></h2>
            <hr>
          
                 <form role="form" id = "login">
                    <br>
                  <div class="row">
                  
                    <div class="form-group col-lg-11" style="left: 2%;">
                      <label>Enter your Email: <span class="required">*</span></label>
                      <input id = "email" type = "email" class="form-control" name = "email" placeholder = "John@gmail.com" required/>                     
                    </div>
 					<div class="clearfix"></div>
                    <div class="form-group col-lg-11" style="left: 2%;">
                      <label>Enter your Password: <span class="required">*</span> </label>
                      <input id = "pwd" class="form-control" type = "password" name = "pwd" required="required" >
                    </div>
                    
                  <!--   <div class="clearfix"></div>
                      <div class="form-group col-lg-12" style="left: 24px;">                   
                 	  <input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
					  <label for="loginkeeping">Keep me logged in</label>	
                    </div> -->
                  
                    <div class="clearfix"></div>
                      <div class="form-group col-lg-11" style="left: 2%;">                   
                      <button type="submit" class="btn btn-primary" style="width:100%">Login</button>
                    </div>
                </div>
                
                <div class="alert alert-danger alert-dismissable" id="errorDiv" style="visibility: hidden;">
              <button type="button" class="close" data-dismiss="alert" id="error" aria-hidden="true">&times;</button>
              Invalid User Name or Password!! Please Enter Valid Credentials or Register!
            </div>
             <p class="change_link">
									Not a member yet ?
									<a href="Register.jsp" class="to_register">Join us</a>
								</p>
              </form>
              
              
              
              
              
             <!--    <form id="form5" action="http://do.convertapi.com/Web2Pdf" method="post">
    	 <div class="yui-skin-sam">
            <textarea name="CUrl" id="CUrl" cols="50" rows="10">
       CONTENT
        </textarea>
        </div>
        <br />
        <br />
  
 
        <div style="text-align: center">
            <button type="submit" id="btnConvert" name="btnConvert" value="Submit">Convert text to PDF</button>
        </div>
           </form> -->
              
              
          </div>
          </div>
        </div>
      </div>




 

  






    </div><!-- /.container -->
    
      <jsp:include page="FooterLayout.jsp" />
      
      
      
      
      
      
      
      
      
  </body>
</html>