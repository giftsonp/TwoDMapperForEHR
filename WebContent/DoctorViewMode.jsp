<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Welcome to 2D Body Image Mapping on EHR, A website for annotating diseases on the human Body Map. This is the View Mode" />
<meta name="keywords" content="Body Mapping, Image Mapping, Mapper, EHR, Two Dimensional Human Body, 2D, Body Annotation, View Mode" />
    <meta name="author" content="">
 	<link rel="icon" type="image/png" href="img/icon.PNG">
    <title>Doctor View Mode</title>
    
        <%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet"> 
    <link href="css/business-casual.css" rel="stylesheet">
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">  
    <link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">    
    <script src="js/Three.js"></script>
    <script src="js/OBJLoader.js"></script>
    <script src="js/opentip-jquery.js"></script><!-- Change to the adapter you actually use -->
	<link href="css/opentip.css" rel="stylesheet" type="text/css" />
	<script src="js/Detector.js"></script>
	<script src="js/ColladaLoader.js"></script>
    <script src="js/d3.v3.min.js"></script> 
    
    
<script type="text/javascript">


$(function() {

    $("#rangeBar").change(function () {     

  	  var newValue = $('#rangeBar').val();
  	  skinMesh.rotation.y += (newValue - skinMesh.rotation.y);
  	 /* document.getElementById("orientation").innerHTML =newValue; */
  	 
  	  if(newValue=="0" || newValue < "1.5")
  		 {
  			document.getElementById("orientation").innerHTML ='FRONT VIEW';
  			/* document.getElementById("display").value='FRONT'; */
  			$("#checkPast").removeAttr("disabled");
  			$("#svgElement1").show();
  				if(newValue > "0") //used to clear the annotations from front view
  					{
  						$('#checkPast').attr('disabled', true);
  						$("#svgElement1").hide();
  					}
  		 
  		 } 
  	
  	 
  	 else if ( newValue >= "1.5")
  	 {
  		  if(newValue == "1.5" || newValue < "2.9")
  			  {
  			
  	  		document.getElementById("orientation").innerHTML ='SIDE VIEW';
  	  		/* document.getElementById("display").value='LSIDE'; */
  	  		$("#svgElement1").hide();
  			  
  			  }
  		  else
  			  {
  			document.getElementById("orientation").innerHTML ='BACK VIEW';
  	  	/* 	document.getElementById("display").value='BACK'; */
  	  	    $("#checkPast").removeAttr("disabled");
  	  		$("#svgElement1").show();
  	  		
  			  
  			  }  		
  		 
  	 }
  	  
  	 	  
  	}); 
    
    
    
    /* font-size changer */
    
     $("#fontSize").change(function () {    
    	 
    	 var newValue = $('#fontSize').val();
    	
    	 $('text').attr('font-size',newValue+"pt"); 	 
    
     }); 
     
  	}); 


$( document ).ready(function() {  	  

	var patientGender = '${reg.gender}';  
	
	if($('#bid').is(':empty')){
			
			
			$("#countId").hide();
			$("#filters").hide();
		}
		
		
	/* 	$("#svgElement").hide(); */
		
		
		$("#skelDiv").hide();
		$("#organDiv").hide();
	
	
	

	if(patientGender=="M" )
		{
		$("#femaleCensor").remove();
		   $("#nobody").remove();
		   $.getScript("js/Male.js");
		
		}	
	else if (patientGender=="F")
		{
		 $("#nobody").remove();
		 $.getScript("js/Female.js");
		}
	
	

  	  
	
	 $("#viewBodyMap").click(function(e) {	 
	
		var bid = document.getElementById("bodyIDInput").value;

		 if(bid)
  		{ 
			 	var page ="view";				
		  		document.location.href="GetAllAnnotationsAction?bid="+bid+"&page="+page;
		  		
  		}
  		 else
  		{  			 
  			 alert("Please Enter a Body Map ID");
  			/* Only if else is added the "Required" Warning method shows! As this is a JQuery Call */
  		 } 
   	});   
	 

		var skinSpan = document.getElementById("skinSpan").innerHTML; 
		var organSpan = document.getElementById("organSpan").innerHTML; 
		var skeletonSpan = document.getElementById("skeletonSpan").innerHTML; 
	/* 	alert(skinSpan+organSpan+skeletonSpan); */
		if(skinSpan== 0 && organSpan== 0 && skeletonSpan== 0)
			{
		/* 	alert(skinSpan+organSpan+skeletonSpan); */
			 $("#subFilters").hide(); 
			}
		else
			{
			
			 $("#subFilters").show(); 
			
			}
	
		/*To hide the Censor gluphicon when no patient is loaded  */
		 if($('#fname').text()=="")
			 {
			 
			 $('#banID').hide();
			 }
	  
	}); 
	


</script>
   
  </head>

  <body>
  <jsp:include page="HeaderLayout.jsp" />
  
       <div class="container">
      <div class="row" style="overflow: auto;"> 
        <div class="box" style="height: auto;">    
        
        

 <!--         <div id="wrapper">  -->
  <jsp:include page="DoctorMenuLayout.jsp" />

 
 <div id="page-wrapper">
 
 <!--Col1  -->
 <div class="row">
   <div class="col-lg-3" style="margin-top:0.5%; left: 1%">
            <div class="panel panel-info" style="width: 100%; height: 520px;">
              <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center"><i class="fa fa-user"></i> Patient Info</h3>
              </div>
              <div class="panel-body">
                <div class="list-group">                  
                  <a class="list-group-item">                    
                    <i class="fa fa-user"></i> <label> First Name:</label><label id="fname" style="font-weight:normal;">${reg.firstName}</label>
                  </a>
                  <a class="list-group-item">                 
                    <i class="fa fa-user"></i> <label> Last Name: </label> ${reg.lastName}
                  </a>
                  <a class="list-group-item">                 
                    <i class="fa fa-check"></i> <label> Age: </label> ${reg.age}
                  </a>
                   <a class="list-group-item">                 
                    <i class="fa fa-male"></i> <label> Gender: </label> <label id="gender" style="font-weight:normal;">${reg.gender}</label>
                  </a>
                   <a class="list-group-item">                 
                    <i class="fa fa-envelope"></i> <label> Email: </label> ${reg.email}
                  </a>
                   <a class="list-group-item">                 
                    <i class="fa fa-tag"></i> <label >Body Map ID: </label> <label id="bid" style="font-weight:normal;">${reg.BID}</label>
                  </a>
                </div>             
              </div>
            </div>
    </div> 
 
<!--  style="height: 30px;" -->
            
  <!--Col1 Ends -->

	 <!--Col2 -->
  	<div class="col-lg-4" style="margin-top:0; padding-left: 1%">
      <h2>Body Map <small>View Mode</small></h2>
            <ol class="breadcrumb">
              <li class="active"><i class="fa fa-eye"></i> View Mode</li>
            </ol>
            
          <h4 id="patientName" align="center"></h4>
          
 <form role="form" id="myForm">
     <div class="form-group">
                <label>Body Map ID</label>
                <input id="bodyIDInput" class="form-control" title="Patient Body Map ID" placeholder="Enter Body Map ID"  autocomplete="on" autofocus="autofocus" required>
     </div>
      <div class="form-group">

       			<button type="button" class="btn btn-primary" id="viewBodyMap">Search Patient</button>
       			
      </div>    
      
            
<div id="filters">
<c:choose>
<c:when test="${fn:length(annotationCount) gt 0 }">	
<c:forEach begin="0" end="${fn:length(annotationCount)-1}" var="index"> 
	   
    <div id="levelDiv">
    	<label>Select a Level</label>
			<ul class="nav nav-tabs">
					<li class="active" style="height: 43px" id="skinLi"><a href="#" data-toggle="tab" id="skinLevel">Skin<span class="badge" id="skinSpan">	${annotationCount[index].getSkinCount()}</span></a></li>
					<li class="" style="height: 43px" id="orgLi"><a href="#" data-toggle="tab" id="organLevel" >Organ<span class="badge"  id="organSpan">	${annotationCount[index].getOrganCount()}</span></a></li>
					<li class="" style="height: 43px" id="skelLi"><a href="#" data-toggle="tab" id="skeletalLevel">Skeleton<span class="badge"  id="skeletonSpan">	${annotationCount[index].getSkeletonCount()}</span></a></li>
			</ul>	 
    </div> 
</c:forEach>
    <br> <br>
<div id="subFilters">		
	<label>Rotate Canvas:&nbsp; </label>
	 <input type="range" name="points" min="0" max="3" value="0" id="rangeBar" step="0.1">
	 	&nbsp;&nbsp;<label id="orientation">FRONT VIEW</label>
	  <br> 
         <br>  
      <details id="detailsID">        
       <summary>Filters </summary><br>
       	<div id="seeAnnotations">       	
       	<ul style="list-style: none">
       	<li class="filterClass"><i class="fa fa-tint"></i>   Annotation Color: <input type="color" name="favcolor" id="color"> 
 	    </li>
       	<li class="filterClass"><i class="fa fa-text-height"></i>  Font Size: <input type="range" name="font" id="fontSize"  min="8" max="20" value="0" step="1"> 
       </li>
       	</ul>
     		</div> 
    	 </details> 
   </div>
</c:when>
<c:otherwise></c:otherwise>
</c:choose>
  </div>	           
                  
                  
</form> 
        
    
    </div> 
    
     <!--Col2 Ends -->
     
      <!--Col3  -->
   
    
     <div class="col-lg-5">
     
       <div id="obj1" style="border:1px solid;">	
       
        <input type="hidden" name="newLevel" id="newLevel" value="skin"/>   
        <div id="censorParentDiv">
    
        <img alt="" id="femaleCensor" src="img/black-strip.png" style="position: absolute; width: 15%; top:30%; left: 42%; height: 4%">
      
       <img alt="" id="maleCensor" src="img/black-strip.png" style="position: absolute; width: 15%; top:45%; left: 42%; height: 8%">
      </div>
       <div id="obj"></div>  
       
      <!--  skin level annotations -->
       <div id="skinDiv">
     
       	<svg id="svgElement1" style="width: 100%; height: 100%; position: absolute; top:0; left:0;">
  				
	  		 <c:set value="skin" var="levelX"/>     
	    	<%--       <jsp:setProperty name="levelX" property="levelX" value="${param.newLevel}" /> --%>
			
		<c:choose>

<c:when test="${fn:length(annotation) gt 0 }">
				<c:forEach begin="0" end="${fn:length(annotation)-1}" var="index">  
				
				   <c:if test="${annotation[index].getLevel() eq levelX  }">    <!-- //changed this  --> 
				 
				
				<a href="#" class="hover-shadow" id="annotationsLink" data-ot="Disease Name: ${annotation[index].getExtraDiseaseName()}. 
					 &#10;Disease Code: ${annotation[index].getDiseaseCode()}. 
					 &#10;Date of Diagnosis: ${annotation[index].getDateOfDiag()}" data-ot-hide-trigger="trigger" data-ot-target="true" > 
					 
					 <c:choose>
      				 <c:when test="${annotation[index].getDisplay()== 'FRONT'}">
      			<%-- 	 <input type="hidden" id="cx" value="${annotation[index].getX_Coord()}"><input id="cy" type="hidden" value="${annotation[index].getY_Coord()}">
      			 --%>			
      						<circle  cx="${annotation[index].getX_Coord()+15}" cy="${annotation[index].getY_Coord()+4}" r="6" fill="red" />
    			     </c:when>

      				<c:otherwise>
    					 <circle cx="${annotation[index].getX_Coord()+15}" cy="${annotation[index].getY_Coord()+4}" r="6" fill="steelblue" />
     				</c:otherwise>
					</c:choose>				   
					
					<text dx="${annotation[index].getX_Coord()+30}" dy="${annotation[index].getY_Coord()+12}" >${annotation[index].getExtraDiseaseName()}</text></a>
					
				  </c:if>   
				</c:forEach>
		</c:when>
<c:otherwise></c:otherwise>
</c:choose>
			
		</svg>	   	
		
		  </div> 
		  
		  
	<!-- 	  Organ Level Annotations -->
		   <div id="organDiv">
       	<svg id="svgElement2" style="width: 100%; height: 100%; position: absolute; top:0; left:0;">
  				
	  		 <c:set value="organ" var="levelX"/>     
	    	<%--       <jsp:setProperty name="levelX" property="levelX" value="${param.newLevel}" /> --%>
	    	<c:choose>
		<c:when test="${fn:length(annotation) gt 0 }">		
				<c:forEach begin="0" end="${fn:length(annotation)-1}" var="index">  
				
				   <c:if test="${annotation[index].getLevel() eq levelX  }">    <!-- //changed this  --> 
				 

				<a href="#" class="hover-shadow" id="annotationsLink" data-ot="Disease Name: ${annotation[index].getExtraDiseaseName()}. 
					 &#10;Disease Code: ${annotation[index].getDiseaseCode()}. 
					 &#10;Date of Diagnosis: ${annotation[index].getDateOfDiag()}" data-ot-hide-trigger="trigger" data-ot-target="true" > 
					 
					 <c:choose>
      				 <c:when test="${annotation[index].getDisplay()== 'FRONT'}">
      						<circle cx="${annotation[index].getX_Coord()+15}" cy="${annotation[index].getY_Coord()+4}" r="6" fill="red" />
    			     </c:when>

      				<c:otherwise>
    					 <circle cx="${annotation[index].getX_Coord()+15}" cy="${annotation[index].getY_Coord()+4}" r="6" fill="steelblue"/>
     				</c:otherwise>
					</c:choose>				   
					
					<text dx="${annotation[index].getX_Coord()+30}" dy="${annotation[index].getY_Coord()+12}">${annotation[index].getExtraDiseaseName()}</text></a>
				  </c:if>   
				</c:forEach>
				</c:when>
<c:otherwise></c:otherwise>
</c:choose>
		</svg>	   	
		  </div> 
		  
		  
		 <!--  Skeleton Level Annotations -->
	<div id="skelDiv">
       	<svg id="svgElement3" style="width: 100%; height: 100%; position: absolute; top:0; left:0;">
  				
	  		 <c:set value="skeleton" var="levelX"/>     
	    	<%--       <jsp:setProperty name="levelX" property="levelX" value="${param.newLevel}" /> --%>
			<c:choose>
		<c:when test="${fn:length(annotation) gt 0 }">		
				<c:forEach begin="0" end="${fn:length(annotation)-1}" var="index">  
				
				   <c:if test="${annotation[index].getLevel() eq levelX  }">    <!-- //changed this  --> 
				 

				<a href="#" class="hover-shadow" id="annotationsLink" data-ot="Disease Name: ${annotation[index].getExtraDiseaseName()}. 
					 &#10;Disease Code: ${annotation[index].getDiseaseCode()}. 
					 &#10;Date of Diagnosis: ${annotation[index].getDateOfDiag()}" data-ot-hide-trigger="trigger" data-ot-target="true" > 
					 
					 <c:choose>
      				 <c:when test="${annotation[index].getDisplay()== 'FRONT'}">
      						<circle cx="${annotation[index].getX_Coord()+15}" cy="${annotation[index].getY_Coord()+4}" r="6" fill="red" />
    			     </c:when>

      				<c:otherwise>
    					 <circle cx="${annotation[index].getX_Coord()+15}" cy="${annotation[index].getY_Coord()+4}" r="6" fill="steelblue" />
     				</c:otherwise>
					</c:choose>				   
					
					<text dx="${annotation[index].getX_Coord()+30}" dy="${annotation[index].getY_Coord()+12}" >${annotation[index].getExtraDiseaseName()}</text></a>
				  </c:if>   
				</c:forEach>
			</c:when>
<c:otherwise></c:otherwise>
</c:choose>
		</svg>	   	
		  </div> 
   
     <!--Col3 Ends  -->
    </div>
   
 </div><!--Page Wrapper  -->

    
     <!--Col3 Ends  -->
    </div>
 </div><!--Page Wrapper  -->
</div>
</div>
</div><!-- /.container -->
    
      <jsp:include page="FooterLayout.jsp" />
  </body>
  <script src="js/notify.js"></script>
   	 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
  <script type="text/javascript">
  
  /*   var skeletalLevel = document.getElementById("skeletalLevel");  */
    
    $(function() {  
  	  $("#skeletalLevel").click(function(e) {
    			/* flag='skeleton'; */
    			$("#svgElement1").hide();
      		    $("#svgElement2").hide();
      			 $("#censorParentDiv").hide();
    			/* $('#checkPast').attr('checked', false); */
    			$('#rangeBar').attr('disabled', true);
    			document.getElementById("obj").innerHTML = "";
    			/* document.getElementById("level").value='skeleton'; */
  		    var script = document.createElement("script");
  		    script.type = "text/javascript";
  		    script.src = "js/skeleton.js"; 
  		    document.getElementsByTagName("head")[0].appendChild(script);
  		 	 $("#skelDiv").show(); 
   			 $("#svgElement3").show();  
  		    
  	  });
   
     
  	    
  	    /* Function for Onclick of Skin Level Tab */
  	    
   
  	 		$("#skinLevel").click(function(e) {	    	
  	     	var bid = document.getElementById("bid").innerHTML; 
  	     /* 	$('#checkPast').attr('checked', false); */
  	     	 $("#svgElement2").hide();
      		 $("#svgElement3").hide();
  	     	flag='skin';
  	     	 if(bid)
  	     	{     
  	     		var page ="view";    		
  		  		document.location.href="GetAllAnnotationsAction?bid="+bid+"&page="+page;	
  		
  		  		
  	     	}
  	     	else
  	     		{
  	     		
  	     		
  	     		} 
  	     		
  	     
  		 	 });  	    
  	 

  	        $("#organLevel").click(function(e) {
  	   			flag='organ';
  	   		/* 	$('#checkPast').attr('checked', false);	   			 */
  	   			 $("#svgElement1").hide();
      			 $("#svgElement3").hide();
      			 $("#censorParentDiv").hide();
      			 $('#rangeBar').attr('disabled', true);		
      			
  	        	 document.getElementById("obj").innerHTML = ""; 
  	         	/* document.getElementById("level").value='organ'; */
  	         	
  	        	var gender = document.getElementById("gender").innerHTML; 
  	      
  	        	if(gender=="M")
  	        	{
  	        		$('#obj').prepend('<img id="organImage" src="img/male.png" />');
  	        	}
  	        	else
  	        		{
  	        
  	        		$('#obj').prepend('<img id="organImage" src="img/female.png" />');
  	        	
  	        		}
  	        	 $("#organDiv").show(); 
      			 $("#svgElement2").show();
  	        	
  	        });  
  	        
  	       
  	         
  	        
  	    });
  
  
	 $("#color").bind("change", function(){
		 $('text').attr('fill',$("#color").val());
	       
	    });
 
	
	    
  
  
  </script>
</html>