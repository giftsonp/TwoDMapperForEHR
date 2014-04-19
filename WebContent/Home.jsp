<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Welcome to 2D Body Image Mapping on EHR, A website for annotating diseases on the human Body Map. This is the Home Page" />
<meta name="keywords" content="Body Mapping, Image Mapping, Mapper, EHR, Two Dimensional Human Body, 2D, Body Annotation, Home Page, Human model, 3d Model, Weg gl" />
    <meta name="author" content="">

    <title>Two Dimensional Body Map for EHR</title>

    <!-- Bootstrap core CSS -->
	<link rel="icon" type="image/png" href="img/icon.PNG">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/business-casual.css" rel="stylesheet">
    
	<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
     <script src="js/bootstrap.js"></script>
     
     <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">   

    
 
  </head>

  <body>

   <jsp:include page="HeaderLayout.jsp" />
 <div class="container">
      <div class="row" style="height: 710px;">
        <div class="box" style="height: 100%">
           
          <div class="col-lg-12 text-center">
            <div id="carousel-example-generic" class="carousel slide">
              <!-- Indicators -->
              <ol class="carousel-indicators hidden-xs">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
              </ol>
            
              <!-- Wrapper for slides -->
              <div class="carousel-inner">
                <div class="item active">
                  <img class="img-responsive img-full" src="img/Ehr1.jpg" >
                </div>
                <div class="item">
                  <img class="img-responsive img-full" src="img/blender1.jpg" >
                </div>
                <div class="item">
                  <img class="img-responsive img-full" src="img/slide31.jpg" >
                </div>
              </div>
            
              <!-- Controls -->
              <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                <span class="icon-prev"></span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                <span class="icon-next"></span>
              </a>
            </div>
            <h3><small>Welcome to</small><br><span class="brand-name">Two Dimensional Body Map for EHR</span><hr class="tagline-divider"></h3>
            
		  	<div id="fb-root"></div>
			<script>
				(function(d, s, id) {
				  var js, fjs = d.getElementsByTagName(s)[0];
				  if (d.getElementById(id)) return;
				  js = d.createElement(s); js.id = id;
				  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
				  fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
			</script>
			<script>		
				!function(d,s,id){
					var js,fjs=d.getElementsByTagName(s)[0];
					if(!d.getElementById(id)){
						js=d.createElement(s);
						js.id=id;
						js.src="http://platform.twitter.com/widgets.js";
						fjs.parentNode.insertBefore(js,fjs);
					}
				}(document,"script","twitter-wjs");
			</script>
			<div class="fb-like" data-href="http://twodmapperforehr.giftsonp.cloudbees.net/" data-width="10" data-layout="standard" data-action="like" data-show-faces="false" data-share="false"></div>
    		<a href="https://twitter.com/twitterapi" class="twitter-follow-button" data-show-count="true" data-lang="en">Follow @twitterapi</a>
          </div>
        </div>
      </div>
  </div>
      <jsp:include page="FooterLayout.jsp" />
       <!-- Bootstrap core JavaScript -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- Make sure to add jQuery - download the most recent version at http://jquery.com/ -->

	
     

<!--      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script>
	  // Activates the Carousel
	  $('.carousel').carousel({
		interval: 3000
	  })
	</script>
  </body>
</html>