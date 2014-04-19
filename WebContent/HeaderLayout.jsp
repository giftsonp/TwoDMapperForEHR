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
    <title></title>

  	<link rel="icon" type="image/png" href="img/icon.PNG">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet">
     <link href="css/style.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
     <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
     <script src="js/bootstrap.js"></script>

      <script src="js/Three.js"></script>
 <script src="js/OBJLoader.js"></script>      
       
    <script type="text/javascript">
    $( document ).ready(function() {
    	
    	/* $.getScript("js/HumanModel.js"); */
    	
    	var UA = "User-agent header sent: " + navigator.userAgent;
		
		 if (UA.toLowerCase().indexOf("android") >= 0){
		
			 
				$('#mymenutop').remove();
		 }
		 
		
    	
    	
			
		

	
    	
    		
        /* 	document.location.href="userDetailsForDoctor"; */
        
    	 var session = '${user}';
    	 
    	 if(session)
    		 {
    		  $('#loginlogout').text('Logout'); 
    		  $('#loginlogout').attr("href","Logout.jsp");
 				
    		 /*  //For past patients
    		  var names = [];
    		  localStorage["names"] = JSON.stringify(names);  
    		  
    		   */
    		 }
    	 else
    		 {
    		 document.getElementById('mymenutop').style.visibility='hidden'; 
    		 
    		 
    		 }
  
    	 if('${user.role}'=="Patient")
    		 {
    		
    		 $("#dash").remove();
    		 $("#edit").remove();
    		 $("#chart").remove();
    		 $('#view').attr("href","PatientLandingPage.jsp");
    		 $('#report').attr("href","PatientPrintReport.jsp");    		 
    		 }
   	});
    
    
    </script>
    
 


  </head>

  <body>

    <div class="heading">2D Body Map for EHR</div>
 <div class="logoDiv">            
 <a href="Home.jsp"><img class="logoClass" src="img/newLo.png"/> </a> 
 </div>

    <nav class="navbar navbar-default" role="navigation" style="position: relative; ">
      <div class="container" >
        <div class="navbar-header" >
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="Home.jsp">2D Body Map for EHR</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
            <li id="homeMain"><a href="Home.jsp">Home</a></li>
            <li id="aboutMain"><a href="About.jsp">About 2DBM</a></li>
            <li id="registerMain"><a href="Register.jsp">Patient Registration</a></li>
            <li><a id="loginlogout" href="Login.jsp">Login</a></li>
                 
          </ul>
        
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container -->
         </nav>
      <div id="mymenutop" class="btn-group" style=" position: relative; margin-top: -250px; left:77%; z-index:100000;">
	   <button type="button" class="btn btn-default" style="width: auto;"><i class="fa fa-user"></i>&nbsp;&nbsp;${user.lastName}, ${user.firstName}</button>
       <button type="button" id="dropdownid" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="padding-left: 14px"><span class="caret"></span></button>
         <ul class="dropdown-menu" style="width: 90%">
                   <li id="dash" style="height: 30px;"><a  href="DoctorLandingPage.jsp"><i class="fa fa-dashboard"></i>&nbsp;&nbsp;DashBoard</a></li>
                   <li id="dvmSide"  style="height: 30px;"><a href="DoctorViewMode.jsp" id="view"><i class="fa fa-eye"></i>&nbsp;&nbsp;View Mode</a></li>
                   <li id="edit" style="height: 30px;"><a  href="DoctorEditMode.jsp"><i class="fa fa-edit"></i>&nbsp;&nbsp;Edit Mode</a></li>        
                   <li id="dprSide"  style="height: 30px;"><a href="DoctorPrintReport.jsp" id="report"><i class="fa fa-print"></i>&nbsp;&nbsp;Print Report</a></li> 
                   <li id="chart" style="height: 30px;"><a href="RenderDiseasesChart" id="report"><i class="fa fa-bar-chart-o"></i>&nbsp;&nbsp;Charts</a></li>  
                   <li class="divider"></li>   
                   <li id="logoutSide" style="height: 30px;"><a href="Logout.jsp" id="logout"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Logout</a></li>                   
        </ul>
          
      </div> 
 


   
  </body>
</html>