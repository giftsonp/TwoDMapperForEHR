<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Welcome to 2D Body Image Mapping on EHR, A website for annotating diseases on the human Body Map. Error Page" />
<meta name="keywords" content="Body Mapping, Image Mapping, Mapper, EHR, Two Dimensional Human Body, 2D, Body Annotation, Error Page" />
    <meta name="author" content="">
	 <link rel="icon" type="image/png" href="img/icon.PNG">
    <title>Login</title>

    <!-- Bootstrap core CSS -->
  	<link rel="icon" type="image/png" href="img/icon.PNG">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
     
     <script src="js/bootstrap.js"></script>
     <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    
    <script type="text/javascript">
    
    $( document ).ready(function() {

    	var UA = "User-agent header sent: " + navigator.userAgent;
    	
    	 if (UA.toLowerCase().indexOf("android") >= 0){
    	
    		 
    		 $('#rowID').removeAttr("style");
    	 }
    	
    	 $("#loginbtn").click(function(e) {
    		 
 			
 			document.location.href="Login.jsp";
 	  			
 	   });  
 	 
    	
    });
    
    
    </script>
    
  </head>

  <body>
  <jsp:include page="HeaderLayout.jsp" />
     <div class="container" style="height: 100%">

      <div class="row" style="height: 710px">
        <div class="box" style="height: 100%">
          <div id="rowID" class="row" style="border:1px solid; position: absolute;border-radius:25px; width: 30%; top:35%;  left: 36%;"  > 
          <div class="col-lg-12">
            <hr>
            <h2 class="intro-text text-center"><strong>Oops!! </strong>Your session has Timed out!</h2>
            <hr>
          

          
                 <div class="row">
                <div class="form-group col-lg-10" style="left:8.5%; text-align: center;">
                  <div style="color: red">
                  Your session has timed out as you were idle for 1 minute! Kindly Login again to use 2D Body Map application!
                  Thank You..
                  
                  </div>
                  <br>  
     
                  <button type="button" class="btn btn-primary" id="loginbtn" style="width:82%">Login</button>
                                       
                </div>
                </div>
                <br>
              
             <p class="change_link">
									Logged out ?
									<a href="Login.jsp" class="to_register">Login here</a>
								</p>

          </div>
          </div>
        </div>
      </div>

    </div><!-- /.container -->
    
      <jsp:include page="FooterLayout.jsp" />
  </body>
</html>