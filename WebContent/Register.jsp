<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Welcome to 2D Body Image Mapping on EHR, A website for annotating diseases on the human Body Map. This is the Register Page" />
<meta name="keywords" content="Body Mapping, Image Mapping, Mapper, EHR, Two Dimensional Human Body, 2D, Body Annotation, Home Page, Human model, Register Patient, Register Doctor, 3d Model, Weg gl" />
  
    <meta name="author" content="">

    <title>Registration</title>

    <!-- Bootstrap core CSS -->
    <link rel="icon" type="image/png" href="img/icon.PNG">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
     
     <script src="js/bootstrap.js"></script>
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
     <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"> 
    
    <!-- Add custom CSS here -->
<style type="text/css">
.hide {
    display: none;
}


</style>

    <script type="text/javascript">
    
    
   
    
 // function to make AJAX call to the server
	 $(document).ready(function(){  
		 
		 var UA = "User-agent header sent: " + navigator.userAgent;
			
		 if (UA.toLowerCase().indexOf("android") >= 0){
		
			 
			 $('#rowID').removeAttr("style");
		 }
		 

	$("#register").submit(function(e){
	  console.log("in submit");
	     e.preventDefault();
	   var success="SignUp Successful, Please Login.";
  	   var failure="Unable to Register! Please Verify and try again!";
  	   var alreadyRegistered="The email ID is already registered. Please try another email ID";
  	   var formdata = new Object();
	     var inpele = document.getElementsByTagName("input");
	     
	     
	     for (var i = 0; i < inpele.length; i++) {
	       	
				if(inpele[i].name == 'gender'|| inpele[i].name == "role"){
					 if(inpele[i].checked == true) 
						formdata[inpele[i].name] = inpele[i].value;
					
				} else {
					formdata[inpele[i].name] = inpele[i].value;
				}
					
             	     
 }
	     frmd = JSON.stringify(formdata);
	    
	     	$.ajax({
	        			url : "RegisterUser",
	        			type : "POST",
	        			data : frmd,
	     	            success : function(data, textStatus, jqXHR){
	     	        	   console.log('In success!');    	     	        	   
	     	        	        	   
	     	        	 
	     	        	   if(data==success)
	 				    		{
	     	        		   
								location.href = 'Login.jsp?msg='+ success;
	 				    		
	 				    		}
	 				    	else if(data==failure)
	 				    		{
	 				    		  	 				    		
	 				    			location.href = 'Register.jsp?msg='+ failure;
	 				    			document.getElementById('errorDiv').style.visibility='visible'; 
	 				    		
	 				    		}  
	     	        	   
	 				    	else if(data==alreadyRegistered)
				    		{
				    		  	 				    		
				    			location.href = 'Register.jsp?msg='+ alreadyRegistered;
				    			
				    			$('#errorDiv').show().removeClass('hide');
				    /* 		document.getElementById('errorDiv').style.visibility='visible';  
				    			 	$("#errorDiv").html(alreadyRegistered); */
				    				/*  $("#errorDiv").show(); */
				    		
				    		}  


	        			},
	        			error : function(jqXHR, textStatus, errorThrown){
	          				console.log('fail');
	          				location.href = 'Register.jsp?msg='+ failure;;
	        			}
	      		 });
	    	
	 });   
	 return false;
}); 
    
    
    </script>
    

  <script>
  var pwdvalid = false;
  function matches(){
  	var pwd = document.getElementById("pwd").value;
  	var cpwd = document.getElementById("cpwd").value;
  	if(pwd!=cpwd){
  		alert("Your password and confirm password do not match!");
  	document.getElementById("cpwd").value = "";
  	}	
  }
  function show(){
  	var val = document.getElementById("age").value;
  	document.getElementById("agevalue").innerHTML = val;
  	
  }
  function strength()
  {
  	   var uc=0; var lc=0; var sp=0;
  	   var upcase  = new RegExp("[A-Z]");
  	   //document.write(upcase);	
  	   var locase  = new RegExp("[a-z]");
  	   var special =  new RegExp("[!@#$%^&*_-]");
  	   var pass = document.getElementById("pwd").value;
  	   var pg = document.getElementById("prgs");
  	   var subdisable = document.getElementById("sub");
  	   for (var i = 0; i< pass.length;i++) {
  	          if(pass.charAt(i).match(upcase))
  	            {
  	                uc++;
  	            }
  	          else if (pass.charAt(i).match(locase))
  	            {
  	               lc++;
  	            }
  	          else
  	               sp++;
  	   }
   	   if (uc>=3&& lc>= 2&&sp == 2)
  	   {
  	         pg.value = 10;
  	         document.getElementById("lbl").innerHTML = "Normal";          
  	         pwdvalid = true;
  	         subdisable.disabled = false;
  	         
  	   }	
  	   else if (uc >= 3&&lc >=2&&(sp>3&&sp<5)) {
  	         pg.value = 50;
  	         document.getElementById("lbl").innerHTML =  "Medium";
  	         pwdvalid = true;
  	         subdisable.disabled = false;
  	   }
  	   else if (uc >=3&& lc >=2 && sp>5) {
  	         pg.value = 100;
  	         document.getElementById("lbl").innerHTML = "Strong";
  	         pwdvalid = true;
  	         subdisable.disabled = false;
  	   }
  	   else if (pass.length == 0) {
  	         pg.value = 0;
  	         document.getElementById("lbl").innerHTML ="";
  	   }
  	    	
  }
    	
    </script>
      
  </head>

  <body>

  <jsp:include page="HeaderLayout.jsp" />
       <div class="container">    

      <div class="row" style="overflow: auto;">
        <div class="box" style="height: auto;">
          <div id="rowID" class="row" style="border:1px solid; position: relative;border-radius:25px; width: 50%; margin: 0 0 0 -200px; left: 44%;"  > 
          <div class="col-lg-12">
            <hr>
            <h2 class="intro-text text-center">Registration <strong>form</strong></h2>
            <hr>
          
                 <form role="form" id = "register">
                    <br>
                  <div class="row" >
                  
                    <div class="form-group col-lg-8" style="left: 2%;">
                      <label>First Name: <span class="required">*</span></label>
                      <input id = "fname" type = "text" class="form-control" name = "fname" placeholder = "John" required/>                     
                    </div>
 					<div class="clearfix"></div>
                    <div class="form-group col-lg-8" style="left: 2%;">
                      <label>Last Name: <span class="required">*</span> </label>
                      <input id = "lname" class="form-control" type = "text" name = "lname" placeholder = "Beetham" required >
                    </div>
                    
                   <div class="clearfix"></div>
                    <div class="form-group col-lg-8" style="left: 2%;">
                      <label>Age: <span class="required">*</span>  </label>                      
                     <input id = "age" type = "range" name = "age" value = "50" required onchange="show()" style="width: 70%; position: relative; left: 22px; top: 7px;"><div id = "agevalue"  style = "float:right; position: relative;  top: 7px;"></div>
                    </div>
                    
                    	<div class="clearfix"></div>
                    <div class="form-group col-lg-8" style="left: 2%;">
                      <label>Gender: <span class="required">*</span> </label>
                      Male: <input id = "mgender" type = "radio" name = "gender" value= "M"/>
                    Female: <input id = "fgender" type = "radio" name = "gender" value= "F"/>
                    </div>
                    
                    <div class="clearfix"></div>
                    <div class="form-group col-lg-8" style="left: 2%;">
                      <label>Email: <span class="required">*</span> </label>
                      <input id = "email" class="form-control" type = "email" name = "email" placeholder= "johnb@gmail.com" required/>
                    </div>
                    
                     <div class="clearfix"></div>
                    <div class="form-group col-lg-8" style="left: 2%;">
                      <label>Password: <span class="required">*</span> </label>
                      <input id = "pwd" class="form-control" type = "password" name = "pwd" required onkeyup = "strength()" title ="Password must contain atleast 3 Upper-case 2 lower-case and 2 special chars"/> <progress value = "0" max = "100" id = "prgs" style="left: 102%; visibility:hidden; top: -28px; position: relative"></progress>
                   	  <label id = "lbl" for = "prgs"></label>                   	  
                    </div>
                    
                     <div class="clearfix"></div>
                    <div class="form-group col-lg-8" style="left: 2%;">
                      <label>Confirm Password: <span class="required">*</span> </label>
                     <input id = "cpwd" class="form-control" type = "password" name = "cpwd"  required onchange = "matches()"/>  
                   	    <label id = "mismatch"></label>                  	  
                    </div>
                    
                    <div class="clearfix"></div>
                    <div class="form-group col-lg-8" style="left: 2%;">
                      <label>Role: <span class="required">*</span> </label>
                      Doctor: <input id = "drole" type = "radio" name = "role" value= "Doctor"/>
                      Patient: <input id = "prole" type = "radio" name = "role" value= "Patient"/>           	  
                    </div>                 
              
                    <div class="clearfix"></div>
                      <div class="form-group col-lg-12" style="left: 2%;">                   
                      <button type="submit" class="btn btn-primary" style="width:100px;">Register</button>
                    </div>
                </div>
                 <div class="alert alert-danger alert-dismissable hide" id="errorDiv">
          <!--     <button type="button" class="close" data-dismiss="alert" id="error" aria-hidden="true">&times;</button> -->
          
            </div> 
             <p class="change_linkreg">
									Already Registered ?
									<a href="Login.jsp" class="to_register">Login</a>
								</p>
              </form>
          </div>
          </div>
        </div>
      </div>

    </div><!-- /.container -->
    
      <jsp:include page="FooterLayout.jsp" />
         
  </body>
</html>