<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Welcome to 2D Body Image Mapping on EHR, A website for annotating diseases on the human Body Map. This is the Print Report Page" />
<meta name="keywords" content="Body Mapping, Image Mapping, Mapper, EHR, Two Dimensional Human Body, 2D, Body Annotation, Print Report" />
    <meta name="author" content="">
 	<link rel="icon" type="image/png" href="img/icon.PNG">
    <title>Report</title>

    <!-- Bootstrap core CSS -->
   <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet"> 
 
    <script src="js/bootstrap.js"></script>
     <script src="js/jquery.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">   
    <link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">   
<script src="js/Three.js"></script>   

    <script src="js/OBJLoader.js"></script>
   <script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
    <script src="js/d3.v3.min.js"></script>
    <script src="js/html2canvas.js"></script>
 <script src="js/canvas2image.js"></script>

    <script type="text/javascript" src="js/canvg.js"></script> 

<script src="http://cdnjs.cloudflare.com/ajax/libs/prettify/188.0.0/prettify.js"></script>
<script src="js/vkbeautify.0.99.00.beta.js"></script>
    
  <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
  <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/element/element-min.js"></script>
 
<!--  <script type="text/javascript">
        var myEditor = new YAHOO.widget.SimpleEditor('Curl', {
            height: '300px',
            width: '600px',
            dompath: true,
            ConversionDelay : 5
        });
        myEditor.render();

        YAHOO.util.Event.on('btnConvert', 'click', function () {
            myEditor.saveHTML();
        });
    </script>  -->
    
   
  </head>

  <body>
 
  
      


  	
            

 <div class="col-lg-3"></div>
	  <form id="form6">
	<div class="col-lg-6" style="border:1px solid;top:-10px" id="myDivNew">
	<h3 align="center">2D Body Map for EHR</h3>
	<h4 align="center">Report</h4>
	<hr>

  <div class="row" > 
  <div class="col-lg-5">
  
   <h5 style="text-decoration: underline;">Personal Information</h5>
  <div class="form-group">
              <label id="fname">  First Name: </label> ${reg.firstName}
   </div>
    <div class="form-group">
              <label id="lname">  Last Name:</label> ${reg.lastName}
   </div>
    <div class="form-group">
             <label id="gender"> Gender:</label> ${reg.gender}
   </div>
    <div class="form-group">
             <label id="gender">  Age:</label> ${reg.age}
   </div>
    <div class="form-group">
             <label id="email">   Email ID:</label> ${reg.email}
   </div>
      <div class="form-group">
             <label id="bid">     Body Map ID: </label> ${reg.BID}
   </div>
  </div> 

    </div><!--Row -->
    
    
    

   <div class="row" id="row"> 
   <div class="col-lg-6" style="width: 100%">
      <h5 style="text-decoration: underline;">Disease Information</h5>           
            <div class="table-responsive">
              <table class="table table-hover tablesorter">
                <thead>
                  <tr>
                  <th>BID</th>
                    <th>Disease Code </th>
                    <th>Disease Name </th>
                    <th>Date of Diagnosis </th>
                    <th>Disease Description </th>               
                  </tr>
                </thead>
                <tbody>
                  <form name="disease" id="disease">
			<c:if test="${annotation ne null }">				
			<c:forEach begin="0" end="${fn:length(annotation)-1}" var="index">
 				<tr>
                    <td>${annotation[index].getBID()} </td>
                    <td>${annotation[index].getDiseaseCode()} </td>
                    <td>${annotation[index].getExtraDiseaseName()} </td>	
                    <td>${annotation[index].getDateOfDiag()}</td>
                    <td>${annotation[index].getDiseaseDesc()} </td>     
 				</tr>					
			</c:forEach>				
			</c:if>
			</form>
                </tbody>
              </table>
              </div>
            </div>
          
    </div> 

  <div class="row" id="myDiv">
  <div id="imageObj" style="left: 12%; position: relative;">
    <img alt="" src="img/Mbody.png">    
 	 <svg style="position: absolute; left:-3.25; top: -4" id="svgID" >
 	        <c:if test="${annotation ne null }">				
					<c:forEach begin="0" end="${fn:length(annotation)-1}" var="index">      				
					 <a href="About.jsp" id="annotationsLink" data-ot="Disease Code:${annotation[index].getDiseaseCode()}" data-ot-hide-trigger="trigger" data-ot-target="true"> 
					 <circle cx="${annotation[index].getX_Coord()+2}" cy="${annotation[index].getY_Coord()}"/>
					 <text dx="${annotation[index].getX_Coord()+12}" dy="${annotation[index].getY_Coord()+4}">${annotation[index].getExtraDiseaseName()}</text></a> 
					 </c:forEach>			
			</c:if>
 	</svg> 
 	
 	<img alt="" id="imageOfModel"> 
 </div>  
 </div>
 </div> 
 </form>
   
<!--    
    <a id="newButton" href="#">Click Me</a> -->
    <a id="linkMe">Try Me</a>




<!--Hide -->
 <form id="form5" action="http://do.convertapi.com/Web2Pdf" method="post">
 	<textarea name="CUrl" id="CUrl" cols="50" rows="10">    
 	<div class="col-lg-6" style="border:1px solid;top:-10px" >
	<h3 align="center">2D Body Map for EHR</h3>
	<h4 align="center">Report</h4>
	<hr>

  <div class="row" > 
  <div class="col-lg-5">  
  <h5 style="text-decoration: underline;">Personal Information</h5>
  <div class="form-group">
              <label id="fname">  First Name: </label> ${reg.firstName}
   </div>
    <div class="form-group">
              <label id="lname">  Last Name:</label> ${reg.lastName}
   </div>
    <div class="form-group">
             <label id="gender"> Gender:</label> ${reg.gender}
   </div>
    <div class="form-group">
             <label id="gender">  Age:</label> ${reg.age}
   </div>
    <div class="form-group">
             <label id="email">   Email ID:</label> ${reg.email}
   </div>
      <div class="form-group">
             <label id="bid">     Body Map ID: </label> ${reg.BID}
   </div>
  </div> 
  </div><!--Row -->
    
    
    

   <div class="row" id="row"> 
   <div class="col-lg-6" style="width: 100%">
      <h5 style="text-decoration: underline;">Disease Information- Checking</h5>           
            <div class="table-responsive">
              <table class="table table-hover tablesorter">
                <thead>
                  <tr>
                  <th>BID</th>
                    <th>Disease Code </th>
                    <th>Disease Name </th>
                    <th>Date of Diagnosis </th>
                    <th>Disease Description </th>               
                  </tr>
                </thead>
                <tbody>
                  <form name="disease" id="disease">
			<c:if test="${annotation ne null }">				
					<c:forEach begin="0" end="${fn:length(annotation)-1}" var="index">
					<tr>
                    <td>${annotation[index].getBID()} </td>
                    <td>${annotation[index].getDiseaseCode()} </td>
                    <td>${annotation[index].getExtraDiseaseName()} </td>	
                    <td>${annotation[index].getDateOfDiag()}</td>
                    <td>${annotation[index].getDiseaseDesc()} </td>			
					</tr>					
					</c:forEach>				
			</c:if>
			</form>
            </tbody>
            </table>
            </div>
            </div>          
   			</div> 

<div class="row" id="myDiv">
  <div id="imageObj" style="left: 12%; position: relative;">
    Image: <img alt="" src="img/Mbody.png">    
 	<%-- <svg style="position: absolute; left:-3.25; top: -4" id="svgID" >
 	        <c:if test="${annotation ne null }">				
					<c:forEach begin="0" end="${fn:length(annotation)-1}" var="index">      				
					 <a href="About.jsp" id="annotationsLink" data-ot="Disease Code:${annotation[index].getDiseaseCode()}" data-ot-hide-trigger="trigger" data-ot-target="true"> 
					 <circle cx="${annotation[index].getX_Coord()+2}" cy="${annotation[index].getY_Coord()}"/>
					 <text dx="${annotation[index].getX_Coord()+12}" dy="${annotation[index].getY_Coord()+4}">${annotation[index].getExtraDiseaseName()}</text></a> 
					 </c:forEach>			
			</c:if>
 	</svg> --%>
 	<div class="col-lg-2"><img alt="" id="imageOfModel"> </div>
 </div>  
 </div>
</div> 

</textarea>   
</form>



<!-- <form id="svgform" method="post" action="download.pl">
 <input type="hidden" id="output_format" name="output_format" value="">
 <input type="hidden" id="data" name="data" value="">
</form>
 -->




   <div style="text-align: center">
           	<button class="btn btn-success" id="newButton" value="">
			Save as PDF</button>
        </div>


   </body>
  <script src="js/screenshot.js"></script> 

<script type="text/javascript">
    
    $( document ).ready(function() {
    	
    	
 	 
   	  var patientGender = '${reg.gender}'; 	  
   	  
   	if(patientGender=="M")
		{
			
		   /* $.getScript("js/Male.js"); */
		
		
		}
	
	else if (patientGender=="F")
		{
		
		 $.getScript("js/Female.js");
		}
   	 
   	
$("#pID").click( function(){
   		
   		var url= window.location.pathname;
   		
   		document.location.href="PDFServletNew?url="+url;	
   		
   		
   		
   	});
    
	
	/* var canvas = document.getElementsByTagName('canvas');
	var dataURL = canvas.toDataURL();
	document.getElementById('imageOfModel').src = dataURL; */
	
	var svg = d3.select("svg");
	var circle = svg.selectAll("circle");
	circle.style("fill", "steelblue");
	
	circle.attr("r", 7);
	

	
  	
   	});
    
    

   	
   	
$(function() {  
	
    
	$("#newButton").click(function(){
	   		
		//alert("clicked");
		var objDiv= document.getElementById('myDivNew');
		
		
 	var svg = d3.select("svg")
         .attr("version", 1.1)
        .attr("xmlns", "http://www.w3.org/2000/svg") 
        .node().parentNode.innerHTML; 

    
		
 		var imgsrc = 'data:image/svg+xml;base64,'+ btoa(svg);  		
  		d3.select("#linkMe").attr("href",imgsrc);
  		
  		
  		document.getElementById('imageOfModel').src = imgsrc; 

	/* 	var svg = document.getElementById('svgID').innerHTML.trim(); */
		//alert(objDiv);
		  html2canvas(objDiv, {
			  onrendered: function(canvas) {
			  //  document.body.appendChild(canvas); 
			  /*   var img = canvas.toDataURL();
			    document.getElementById('imageOfModel').src = img; */
			  
			    
		    	//var svg = $('svg').parent().html(); //Works but Says Bad request

			    // canvg(canvas, svg); 	
			   // Canvas2Image.saveAsPNG(canvas); 
			

	
				    	//  var img = canvas.toDataURL();
				    	 // document.getElementById('imageOfModel').src = img;
				    	  /* window.open(img); */
		
			  
			      /*  canvg(canvas, svg,{ renderCallback: function () {
			    	  var img = canvas.toDataURL();
			    	  window.open(img);
			    	}});  */
			    	
			    	/* document.body.appendChild( canvas ); */
			/* 	    var img = canvas.toDataURL("image/png");  */
			   
				/*   var html = d3.select("svg")
			        .attr("title", "test2")
			        .attr("version", 1.1)
			        .attr("xmlns", "http://www.w3.org/2000/svg")
			        .node().parentNode.innerHTML;

			      d3.select("#imageOfModel1").attr("src", "data:image/svg+xml;base64," + btoa(html));
			      var src = $("#imageOfModel1").attr( "src" );
			     
			      var canvas1 = document.createElement("canvas");
			      var ctx = canvas1.getContext("2d");
			      ctx.drawImage(src, 0, 0);
			      var img = canvas1.toDataURL();
			      window.open(img);  */
			      
			       var img = canvas.toDataURL();
			      window.open(img);
			     
			     // Canvas2Image.saveAsPNG(canvas);
			/* d3.select("body").append("div")
			        .attr("id", "download")
			        .append("img")
			        .attr("src", "data:image/svg+xml;base64,"+ btoa(html));
			 */


		
			// document.getElementById('imageOfModel').src = img; 
				 /*  window.open(img); */
			  }});
	   		
		  $('canvas').remove();
	   		
	   	});
	
});




/* $(function() {  
	
    
	$("#btnConvert").click(function(){ */
		function clicked(){
		
		$( "#form5" ).submit();
	   	alert("initial");
		/* $('canvas').remove();  */
		/* var dataUrl = renderer.domElement.toDataURL("image/png");
		THREEx.Screenshot.bindKey(renderer);
		document.getElementById('imageOfModel').src = dataUrl;  */
	   		
		var html = d3.select("svg")
        .attr("version", 1.1)
        .attr("xmlns", "http://www.w3.org/2000/svg")
        .node().parentNode.innerHTML;
 
  		//console.log(html);
 		 var imgsrc = 'data:image/svg+xml;base64,'+ btoa(html);
  		
  d3.select("#linkMe").attr("href",imgsrc);

  alert("oiii");
/*   var img = '<img src="'+imgsrc+'">'; 
  d3.select("#testing").html(img); */
  document.getElementById('imageOfModel').src = imgsrc; 
  var canvas1 = document.createElement("canvas");
  canvas1.id="mycanvas";
  var context = canvas1.getContext("2d");
 
/* alert("hi"); */
var image = new Image;
image.src = imgsrc;
 image.onload = function() { 
/* 	alert("hmmm"); */
	  context.drawImage(image, 0, 0);
	  document.body.appendChild(canvas1);
	 /*  alert("canvas drwn"); */
	   var canvasdata = canvas1.toDataURL("image/jpeg"); 
	 // Canvas2Image.saveAsJPEG(canvas1); 

	   var a = document.createElement("a");
	  a.download = "sample.jpg";
	  a.href = canvasdata;
	  a.click();

}; }
	   		
/* 	   	});
	
}); */


    </script> 
    
<!-- <script type="text/javascript">
function submit_download_form(output_format)
{
	// Get the d3js SVG element
	var tmp = document.getElementById("myDiv");
	var svg = tmp.getElementsByTagName("svg")[0];
	// Extract the data as SVG text string
	var svg_xml = (new XMLSerializer).serializeToString(svg);

	// Submit the <FORM> to the server.
	// The result will be an attachment file to download.
	var form = document.getElementById("svgform");
	form['output_format'].value = output_format;
	form['data'].value = svg_xml ;
	form.submit();
}


</script> -->
   
</html>