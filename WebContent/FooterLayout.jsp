<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>

   <link rel="icon" type="image/png" href="img/icon.PNG">
   
   <!--  <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet">
     <link href="css/style.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
     <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
     <script src="js/bootstrap.js"></script> -->
     
     <script type="text/javascript">
    $( document ).ready(function() {
    	
    		
        /* 	document.location.href="userDetailsForDoctor"; */
        
    	 
  
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
  
    <footer>
      <div class="container">
        <div class="row">
     
       
          <div class="col-lg-12 text-center">
            <a href="DoctorLandingPage.jsp" id="dash"><i class="fa fa-dashboard"></i>&nbsp;DashBoard</a>&nbsp;&nbsp;&nbsp;&nbsp;
      		<a href="DoctorViewMode.jsp" id="view"><i class="fa fa-eye"></i>&nbsp;View Mode</a>&nbsp;&nbsp;&nbsp;&nbsp;
     		<a href="DoctorEditMode.jsp" id="edit"><i class="fa fa-edit"></i>&nbsp;Edit Mode</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       		<a href="DoctorPrintReport.jsp" id="report"><i class="fa fa-print"></i>&nbsp;Print Report</a>&nbsp;&nbsp;&nbsp;&nbsp;
       		<a href="RenderDiseasesChart" id="chart"><i class="fa fa-bar-chart-o"></i>&nbsp;Charts</a>&nbsp;&nbsp;&nbsp;&nbsp;
       		<a href="Logout.jsp" id="logout"><i class="fa fa-sign-out"></i>&nbsp;Logout</a>
            <p>Copyright &copy; Body Map Team</p>
           <small><a href="References.jsp">References</a></small>
          </div>
        </div>
      </div>
    </footer>

 
  </body>
</html>