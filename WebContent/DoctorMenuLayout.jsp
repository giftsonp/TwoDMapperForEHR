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
<!--   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
  <script type="text/javascript">
  
  $( document ).ready(function() {
  	
   	/* document.location.href="userDetailsForDoctor";     */
   	if(!'${user}')
   		{
   		
   	/* 	alert("Redirecting!"); */
   		document.location.href="Login.jsp"; 
   		
   		}
   	

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
           <a class="navbar-brand" href="DoctorLandingPage.jsp">Welcome Doctor..</a>
        </div>
        
          <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex2-collapse"  style="height: 5%;">
          <ul class="nav navbar-nav " >
         	 <li><a href="DoctorLandingPage.jsp" id="docDash"><i class="fa fa-dashboard"></i> Dashboard</a></li>  
             <li><a href="DoctorViewMode.jsp" id="docVM"><i class="fa fa-eye"></i> View Mode</a></li>  
             <li><a href="DoctorEditMode.jsp" id="docEM"><i class="fa fa-edit"></i> Edit Mode</a></li>
             <li><a href="DoctorPrintReport.jsp" id="docPR"><i class="fa fa-print"></i> Print Report</a></li> 
            <li><a href="RenderDiseasesChart" id="docChart" ><i class="fa fa-bar-chart-o"></i> Charts</a></li>              
          </ul>
        </div>   
      </nav>


   
  </body>
</html>