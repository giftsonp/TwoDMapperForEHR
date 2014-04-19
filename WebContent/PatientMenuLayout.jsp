<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="refresh" content="${pageContext.session.maxInactiveInterval}; url=Error.jsp">
        
    <link rel="icon" type="image/png" href="img/icon.PNG">

    <title></title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/business-casual.css" rel="stylesheet">
    
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script type="text/javascript">
  
  $( document ).ready(function() {
  	
   	/* document.location.href="userDetailsForDoctor";     */
   	if(!'${user}')
   		{
   
   	 	/* alert("Redirecting!");  */
   		document.location.href="Login.jsp"; 
   		
   		}
   	
   	
  /*  	var timeOut = 1000 * 60 * 1; // x minutes
   	var lastActivity = new Date().getTime();
   	var checkTimeout;
   	
   	checkTimeOut = function(){
   	    if(new Date().getTime() > lastActivity + timeOut){
   	    	document.location.href="Login.jsp"; 
   	    }else{
   	        window.setTimeout(checkTimeOut, 1000); // check once per second
   	    }
   	}; */
});
  
  
  </script>
  </head>

  <body>
  
    <!-- <div class="brand">2D Body Map for EHR</div> -->


   

      <nav class="navbar navbar-inverse" role="navigation" style="top:-12px">

        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex2-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
           <a class="navbar-brand" href="Home.jsp">View Mode</a>
        </div>
          <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex2-collapse">
          <ul class="nav navbar-nav " >
            <li><a href="PatientLandingPage.jsp" id="patVM"><i class="fa fa-eye"></i> View Mode</a></li>
             <li><a href="PatientPrintReport.jsp" id="patReport"><i class="fa fa-print"></i> Print Report</a></li>      
          </ul>
         
        </div>
   
      </nav>


   
  </body>
</html>