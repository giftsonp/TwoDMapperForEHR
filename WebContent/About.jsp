<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Welcome to 2D Body Image Mapping on EHR, A website for annotating diseases on the human Body Map. This is the about Page" />
<meta name="keywords" content="Body Mapping, Image Mapping, Mapper, EHR, Two Dimensional Human Body, 2D, Body Annotation" />



<title>About 2DBM</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="icon" type="image/png" href="img/icon.PNG">
<link href="css/business-casual.css" rel="stylesheet">
<link href="css/sb-admin.css" rel="stylesheet">
 
 
 <style>
   #content{
 
/*    margin-left:400px;
   margin-right:400px;
   margin-bottom: 200px;*/
   text-align:justify;
  
   width: 200%
     }
    
     
</style>
  <script src="js/bootstrap.js"></script>
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

     <script id="vertexShader" type="x-shader/x-vertex">


varying vec2 vUv;
varying vec3 vNormal;
varying vec3 vViewPosition;

void main() {

	vec4 mvPosition = modelViewMatrix * vec4( position, 1.0 );

	vUv = uv;
	vNormal = normalize( normalMatrix * normal );
	vViewPosition = -mvPosition.xyz;

	gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );

}

</script>
<script id="fragmentShader" type="x-shader/x-fragment">
uniform sampler2D texture1;
uniform sampler2D texture2;

varying vec2 vUv;
varying vec3 vNormal;
varying vec3 vViewPosition;

void main() {


	vec3 c;
	vec4 Ca = texture2D( texture1, vUv );
	vec4 Cb = texture2D( texture2, vUv );

	// hack in a fake pointlight at camera location, plus ambient
	vec3 normal = normalize( vNormal );
	vec3 lightDir = normalize( vViewPosition );

	float dotProduct = max( dot( normal, lightDir ),0.0 ) + 0.2;

	//gl_FragColor = vec4( mix( tColor.rgb, tColor2.rgb, tColor2.a ), 1.0 )* dotProduct;
	//gl_FragColor = vec4( 5.5, 4.5, 4.0, 2.0 )* dotProduct;

 	c = Ca.rgb * Ca.a + Cb.rgb * Cb.a * (1.0 - Ca.a);  // blending equation
    gl_FragColor= vec4(c, 1.0)* dotProduct;

}
</script>



<script type="text/javascript">
 $( document ).ready(function() {
	console.log( "ready!" );
	$.getScript("js/HumanModel.js");
	}); 
</script>
        
             
</head>

<body>
	<jsp:include page="HeaderLayout.jsp" />
	    <div class="container" style="height: 100%">

      <div class="row" style="height: 710px">
        <div class="box" style="height: 100%">
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						About <strong>2DBM</strong>
					</h2>
					<hr>
					     
					<form role="form">
						<div class="row">
							<div class="form-group col-lg-4">
								<div id = "content">
<p> We develop a pictorial medical record system called Two Dimensional Human Body Map that serves as image based mapper for the physicians to annotate diseases and ailments on the human body map.This 
gives an easy understanding of diseases for the patients due to presence of image based report rather than text report.This application will display the entire medical history 
of a patient, thus assisting the doctors to know the condition of the patient</p> 
The application consists of following options:
<p>
<ul>
	<li><h3><b>View Mode:</b></h3>In view mode, 
the body map will be displayed read only and will contain notification on parts where the patient 
has a disease. This will give patients more understanding of their current and historical disease information on body map.</li><br>
	<li><h3><b>Edit Mode:</b></h3>In the edit mode, the doctor will be able to edit the body map based on the 
diseases diagnosed on any specific part.</li>
	<li><h3><b>Print Report:</b></h3> This option lets the user print the entire report including the bodymap for records.</li>
	
</ul>
</p>
</div>
								
							</div>						
						<div id='obj' style="float: right; height: 300px;"></div> 
							</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container -->

	<jsp:include page="FooterLayout.jsp" />
</body>
</html>