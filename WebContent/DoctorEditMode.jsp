<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Welcome to 2D Body Image Mapping on EHR, A website for annotating diseases on the human Body Map. This is the doctor Edit Mode Page" />
<meta name="keywords" content="Body Mapping, Image Mapping, Mapper, EHR, Two Dimensional Human Body, 2D, Body Annotation, Edit Mode" />
   
    <meta name="author" content="">
 	<link rel="icon" type="image/png" href="img/icon.PNG">
    <title>Doctor Edit Mode</title>
	<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


    <!-- Bootstrap core CSS -->
 	<link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet"> 
    <link href="css/business-casual.css" rel="stylesheet">
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.js"></script>
 	<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script> 
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />   
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">   
    <link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">   
	<script src="js/Three.js"></script> 	
	<script src="js/ColladaLoader.js"></script>
	<script src="js/Detector.js"></script>
	<script src="js/stats.min.js"></script>    
    <script src="js/OBJLoader.js"></script>
    <script src="js/d3.v3.min.js"></script>
    <script>
    	var x_Offset = 0;
		var y_Offset = 0;				
	</script>
	<script type="text/javascript" src="js/script.js"></script>    
    <script type="text/javascript" src="js/Email.js"></script> 
    <script type="text/javascript" src="js/BP.js"></script> 
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<script src="js/opentip-jquery.js"></script><!-- Change to the adapter you actually use -->
	<link href="css/opentip.css" rel="stylesheet" type="text/css" />
	
    
    <script type="text/javascript">   
    function pastLink(bid){
		 
    	 var page ="edit";          	
	  		document.location.href="GetAllAnnotationsAction?bid="+bid+"&page="+page;    
	 } 
    
    $(function() {
    $("#rangeBar").change(function () {     
  	  var newValue = $('#rangeBar').val();
  	  skinMesh.rotation.y += (newValue - skinMesh.rotation.y);
  	 /* document.getElementById("orientation").innerHTML =newValue; */
  	 
  	  if(newValue=="0" || newValue < "1.5")
  		 {
  			document.getElementById("orientation").innerHTML ='FRONT VIEW';
  			document.getElementById("display").value='FRONT';
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
  	  		document.getElementById("display").value='LSIDE';
  	  		$("#svgElement1").hide();
  			  
  			  }
  		  else
  			  {
  			document.getElementById("orientation").innerHTML ='BACK VIEW';
  	  		document.getElementById("display").value='BACK';
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
    /* 	var UA = "User-agent header sent: " + navigator.userAgent; */
  	/*   alert(UA); */
    	var patientGender = '${patient.gender}';
  		var patientGender1 = '${reg.gender}';
  		$("#backgroundPopupBP").css("display","none");
  		$("#backgroundPopupEmail").css("display","none");
  		$("#backgroundPopup").css("display","none");
  		
  		if($('#bid').is(':empty')){  			
  			$("#countId").hide();
  			$("#filters").hide();
  		}
  		
  		
  		$("#skinDiv").hide();
  		$("#skelDiv").hide();
  		$("#organDiv").hide();
  	
  
 
	if(patientGender=="M" || patientGender1=="M" )
		{
		   $("#nobody").remove();
		   $("#femaleCensor").remove();
		   $.getScript("js/Male.js");
		   
		/*  if (UA.toLowerCase().indexOf("android") >= 0){
			 
		    renderer = new THREE.WebGLRenderer();
			 
		  camera = new THREE.PerspectiveCamera( 24, 350 / 450, 1, 8000 ); 
			 renderer.setSize( 350, 450 );
			 
			
	 
		 }	
		 else
			 {
		    renderer = new THREE.WebGLRenderer();
			 camera = new THREE.PerspectiveCamera( 18, 450 / 570, 1, 8000 );  
			 renderer.setSize( 450, 570 );
			
  	  
			 } */
			
		}
	
	else if (patientGender=="F" || patientGender1=="F")
		{
		 $("#nobody").remove();
		 $.getScript("js/Female.js");
			/* if (UA.toLowerCase().indexOf("android") >= 0){
			 
			 camera = new THREE.PerspectiveCamera( 24, 350 / 450, 1, 8000 );
			 
			 
			
				
			 
		 }	 */
		}
	


	$('input[name=diseaseDB]').blur(function() { 		
	
		var diseaseString=$("#diseaseDB").val();
		var code= diseaseString.substring(diseaseString.lastIndexOf(",") + 1).trim();		
		document.getElementById("diseaseCode").value=code;
		
	});
 
	

		 $("#color").bind("change", function(){
			 $('text').attr('fill',$("#color").val());
		       
		    });
	  
	  
	 		
	 	 $("#recentDetails").click(function(e) {    
        	   
	 		 if(localStorage.getItem("bid")!=null)
	 			 {
	 			localStorage.removeItem("bid");
		 		localStorage.removeItem("fName");
		 		localStorage.removeItem("lName");	 			 
	 			 }
	 		
	 		
	 		var info = [];	
		 	var bid=$("#bid").text();
	
		 		info.push({"fname":$("#fname").text(), "lname":$("#lname").text(), "bid": bid});	     
			 	localStorage.setItem('info'+bid, JSON.stringify(info));
			 	var archive = [],
		        keys = Object.keys(localStorage),
		        i = 0;

		    for (; i < keys.length; i++) {
		    	
		 
		    	var z=JSON.parse(localStorage.getItem(keys[i]));
		    	//alert(z[0].bid);    //Working
		        archive.push(z);
		    	
		    }
		   
		      
		   //Creating Table based on the number of entries in Local storage 
		    var theader = "<table id='table1'>";
		    var tbody = "";

		    for(var i = 0; i < 5; i++)
		    {
		    for (var name in archive[i]) {
		    	
		    	if(archive[i][name].bid!="")
		    		{
		    		
		    		  tbody += "<tr>";				      
			          tbody += "<td>";
			          tbody += "<ul class='recentPatULClass' >";
			          if(bid==archive[i][name].bid)
			        	  {
			        	  tbody += "<li class='recentpatClass'><a href='#' onclick='pastLink("+archive[i][name].bid+")' id="+archive[i][name].bid+" title='Current Patient' style='text-decoration: none; color: #000000' >"+archive[i][name].fname+ ".. - " +archive[i][name].bid+" (C)";
			        	  tbody +="  <img src='img/tick.png' class='tickIMG'";   
			        	  }
			          else
			        	  {
			        	  tbody += "<li class='recentpatClass'><a href='#' onclick='pastLink("+archive[i][name].bid+")' id="+archive[i][name].bid+" style='text-decoration: none; color: #000000'>"+archive[i][name].fname+ ".. - " +archive[i][name].bid;		         
			        	  }
			        /*   tbody += "<li class='recentpatClass'><a href='#' onclick='pastLink("+archive[i][name].bid+")' id="+archive[i][name].bid+">"+archive[i][name].lname+ "," +archive[i][name].fname+ " - " +archive[i][name].bid+"</a></li>";
			        */   
			       	  tbody += "</a></li>";
			          tbody += "</ul>";
			          tbody += "</td>";			      
			     	  tbody += "</tr>";		
			     	  var tfooter = "</table>";
					  document.getElementById('recentPatients').innerHTML = theader + tbody + tfooter;
					  
				
		    		}
		    	else {	
		    			
		    			var errorMsg ="";
				 		errorMsg +="<div class='alert alert-dismissable alert-danger'> No Recent Patients!! </div>";
				 		document.getElementById('recentPatients').innerHTML= errorMsg;
		    		}
		    	
		    	
		    	
		       
		    
		    }
		    }
		
		
		 	

           });   
	
	/*To hide the Censor gluphicon when no patient is loaded  */
	 if($('#fname').text()=="")
		 {
		 
		 $('#banID').hide();
		 }
	
	
	/* Send EMail */
	 $("#sendEmail").click(function(e) {		 
		 
			var firstName=$('#fname').text();
			var lastName=$('#lname').text();
			var email=$('#email').text();
			var bid=$('#bid').text();
			var age=$('#age').text();
			var gender=$('#gender').text();
			
			var subject=$('#emailSub').val();
			var emailContent=$('#emailBody').val();
			var success='Success';
			
			if(subject=="")
				{
				$('#emailSub').val('Subject Cannot be Empty');
				$('#emailSub').select();
				$('#emailSub').focus();
				}
			else if (emailContent=="")
				{
				$('#emailBody').val('Body Cannot be Empty');	
				$('#emailBody').select();
				$('#emailBody').focus();
				}
			else
				{
			function sending() {
				$("div.sendingEmail").show();  
			}
			
			sending();
			
			  $.ajax ({
	    			url : "EmailPatient?firstName="+firstName+"&lastName="+lastName+"&email="+email+"&bid="+bid+"&sub="+subject+"&content="+emailContent+"&age="+age+"&gender="+gender,
	    			type : "POST",       		
	                async: true,
	             
	               			
					    success: function(data) {	 
					 
					    	if(data=success)
					    		{
					    		$("div.sendingEmail").fadeOut('normal');  
					    		$('#patientEmailID').text("Email Sent to patient!"); 
					    		$('#popup_contentEmail').remove();
					    		var $cancelBtn = $( "<input type='button' id='cancelBtn' class='btn btn-success' value='Return to Edit Mode' onclick='closePopUpEmail()'/> <br> <br>" );
					    		var $alertmsg= $("<div class='alert alert-dismissable alert-info' ><strong> Heads Up! </strong> To Send Email again, refresh the previous Page and click on 'Email this Patient' Link </div> ");	
					    		$( "#headerEmailDiv" ).append($cancelBtn);
					    		$( "#headerEmailDiv" ).append($alertmsg);
					    		}
					         		         
	    		 },
	    		        error: function() {
	    		        	
	    		       alert("Cannot Send Email Now! Try again Later!!");
	    		            
	    		        }
	    		        
	    		        
	    			
	  		 });
				}   
			
		
		   }); 
	
	
	/* Updating BP, Temp, Height, Weight */
	 $("#update").click(function(e) {	
		 var bid=$('#bid').text();
		  $("#update").html('Updating...'); 
		  var success='Success';
		  var bp=$('#bp').val();
		  var height=$('#height').val();
		  var weight=$('#weight').val();
			var temp=$('#temp').val();
			var date=$('#dateofdiagInfo').val();		  
		  $.ajax ({
  			url : "updatePatientDetails?BID="+bid+"&bp="+bp+"&heig="+height+"&weig="+weight+"&temp="+temp+"&dateofdiag="+date,
  			type : "POST",       		
              async: true,
           
             			
				    success: function(data) {	 
				    	if(data=success)
			    		{				    
				    		/* $("div.sendingEmail").fadeOut('normal');   */
				    		$('#headingForDetails').text("Patient Details Updated!"); 
				    		$('#popup_contentBP').remove();
				    		var $cancelBtn = $( "<input type='button' id='cancelBtn' class='btn btn-success' value='Return to Edit Mode' onclick='closePopUpBP()'/> <br> <br>" );
				    		var $alertmsg= $("<div class='alert alert-dismissable alert-info' ><strong> Heads Up! </strong> To Update again, refresh the previous Page and click on Update Patient Link </div> ");
				    		$( "#headerBPDiv" ).append($cancelBtn);
				    		$( "#headerBPDiv" ).append($alertmsg);
			    		}
				    
				         		         
  		 },
  		        error: function() {
  		        	
  		       alert("ERROR");
  		            
  		        }
  		        
  		        
  			
		 });
		 
	
	 });
		

	if($('#bpHidden').val()=="0.0" && $('#errorMessage').text()!="Incorrect BID. No such patient Exists in our records")
		{
		Opentip.styles.myErrorStyle = {			  
				   extends: "alert",	
				
				  target: true, 
				  showEffectDuration: 0.5,
				  hideEffectDuration:0.3,
				  borderRadius: 2,
		 		  stem: true, 
		 		 shadow:true,
		 	
		 		 shadowBlur:0,
		 		    offset: [0, -10],  
				/*    background: "#028482",  */ /* [[0,"white"],[1,"black"]] */
				  hideTrigger: "trigger", 
				  hideTriggers:["closeButton","trigger", "tip", "target", "closeButton"],
				  closeButtonRadius: 7,
				  closeButtonCrossSize: 7,
				  closeButtonCrossColor:"#FFFFFF",
				  
				  showOn: "creation"
				};

		new Opentip("#updatePatient", "You have not updated the patient's Blood Pressure, Temperature etc.. Update details by cliking on this link", "Warning!", {  style: "myErrorStyle" });
		}
	
	
	 
 	});    
    
    function closePopUpEmail()
    {
    	
    	$("#toPopupEmail").fadeOut("normal");  
		$("#backgroundPopupEmail").fadeOut("normal");  
    }
    
    function closePopUpBP()
    {
    	
    	$("#toPopupBP").fadeOut("normal");  
		$("#backgroundPopupBP").fadeOut("normal");  
    }


    
    </script>

    <script type="text/javascript">    
    
    $(function() {  
    	
    	$("#diseaseInfo").click(function(e) {
         	
         	var bid = document.getElementById("bid").innerHTML; 
         	var fName= $("#fname").text();
         	var lName= $("#lname").text();
         	window.localStorage.setItem("fName", fName);
    		window.localStorage.setItem("lName", lName);
    		window.localStorage.setItem("bid", bid);	
         
          	document.location.href="status?bid="+bid;   
         
         	
    	});
    	
    	
    }); 
    
    </script>
    

  </head>

  <body>
  <jsp:include page="HeaderLayout.jsp" />
  
      <div class="container">
      <div class="row" > <!-- style="overflow: auto;" -->
      <div class="box" style="height: auto;">    
  	  <jsp:include page="DoctorMenuLayout.jsp" />

 
 <div id="page-wrapper">

 <!--Col1  -->
 <div class="row">
 
<!--  col 1 -->
   <div class="col-lg-3" style="margin-top:0;">
            <div class="panel panel-info" style="width: 100%; height: 615px;">
              <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center"><i class="fa fa-user"></i> Patient Info</h3>
              </div>
      <div class="panel-body">
                <div class="list-group">                  
                  <a class="list-group-item">                    
                    <i class="fa fa-user"></i> <label> First Name: </label> <label id="fname" style="font-weight:normal;">${patient.firstName}${reg.firstName}</label>
                  </a>
                  <a class="list-group-item">                 
                    <i class="fa fa-user"></i> <label> Last Name: </label> <label id="lname" style="font-weight:normal;">${patient.lastName}${reg.lastName}</label>
                  </a>
                  <a class="list-group-item">                 
                    <i class="fa fa-check"></i> <label> Age: </label> <label id="age" style="font-weight:normal;">${patient.age}${reg.age}</label>
                  </a>
                   <a class="list-group-item">                 
                    <i class="fa fa-male"></i> <label> Gender: </label> <label id="gender" style="font-weight:normal;">${patient.gender}${reg.gender}</label>
                  </a>
                   <a class="list-group-item">                 
                    <i class="fa fa-envelope"></i> <label> Email: </label> <label id="email" style="font-weight:normal;">${patient.email}${reg.email}</label>
                  </a>
                   <a class="list-group-item">                 
                    <i class="fa fa-tag"></i> <label >Body Map ID: </label> <label id="bid" style="font-weight:normal;">${patient.BID}${reg.BID}</label>
                  </a>
                              
				  <input type="hidden" name="bpHidden" id="bpHidden" value="${patientExtra.getBloodPressure()}"/>           		            
                  <!-- </form>
 -->                  
                  
                <!--   annotationCount -->
           
                
                </div>     
                <div id="countId">
                	<h4 style="float: left">Quick Links</h4>
                	<a href="#" id="diseaseInfo" style="float: left"><i class="fa fa-table"></i> Disease Manager </a>       
					<a href="#" id="updatePatient" style="float: left"><i class="fa fa-pencil"></i> Update Patient </a>              		
                	<a href="#" id="emailBtn" style="float: left"><i class="fa fa-envelope"></i> Email this Patient </a><br>
		  </div>
	<br><br><br><br><br>
		<details id="recentDetails">        
       <summary><b>Recently Viewed Patients </b></summary>
       <div id="recentPatients">          	
       </div> 
       </details>
		  
		  
		  
              </div>
              
             
                
            </div>

        
            
          
    <span id="result"></span>
    
 
            </div>
 
 
 <!-- col 2 -->
 
  	<div class="col-lg-4" style="margin-top:0; padding-left: 1%">
            <h2>Body Map <small>Edit Mode</small></h2>
            <ol class="breadcrumb">
              <li class="active"><i class="fa fa-edit"></i> Edit Mode</li>
            </ol>
            
        
             
             
	<form role="form" id="myForm1">
     <div class="form-group">
         <label>Body Map ID</label>
       
        <input id="bodyIDEditInput" class="form-control" title="Patient Body Map ID" placeholder="Enter Body Map ID" autocomplete="on" autofocus="autofocus" required> 

     </div>
     
     
     <div class="form-group">
       <button type="button" id="searchPatientEditMode" class="btn btn-primary" >Search Patient</button> <br>   <br>
       <label id="errorMessage" >${error}</label>
     </div>       
        <br>
        
         
        
        
        
<div id="filters">
<c:choose>
<c:when test="${fn:length(annotationCount) gt 0 }">	
<c:forEach begin="0" end="${fn:length(annotationCount)-1}" var="index"> 
	   
    <div id="levelDiv">
    	<label>Select a Level</label>
			<ul class="nav nav-tabs">
					<li class="active" style="height: 43px" id="skinLi"><a href="#" data-toggle="tab" id="skinLevel">Skin<span class="badge" id="skinSpan">	${annotationCount[index].getSkinCount()}</span></a></li>
					<li class="" style="height: 43px" id="orgLi"><a href="#" data-toggle="tab" id="organLevel" >Organ<span class="badge" id="organSpan">	${annotationCount[index].getOrganCount()}</span></a></li>
					<li class="" style="height: 43px" id="skelLi"><a href="#" data-toggle="tab" id="skeletalLevel">Skeleton<span class="badge" id="skeletonSpan">	${annotationCount[index].getSkeletonCount()}</span></a></li>
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
       	<li class="filterClass"><i class="fa fa-eye"></i>  View Diseases
       		<input  type="checkbox" onclick=" toggle(this)" value="" id="checkPast"></li>
       	<li class="filterClass"><i class="fa fa-tint"></i>   Annotation Color: <input type="color" name="favcolor" id="color" disabled="disabled"> 
 	    </li>
       	<li class="filterClass"><i class="fa fa-text-height"></i>  Font Size: <input type="range" name="font" id="fontSize"  min="8" max="20" value="0" step="1" disabled="disabled"> 
       </li>
       <li class="filterClass">
       <a href="#" style="text-decoration: none; color: #000000" id="banID" title="Toggle Censor"><i class="fa fa-ban" style="color: red"></i> Toggle Censor</a> 
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
  
   
     <!--Col3  -->   
      <div class="col-lg-5">

       <div id="obj1" style="border:1px solid;">	
       
        <input type="hidden" name="newLevel" id="newLevel" value="skin"/>   
        
       <div id="censorParentDiv">
    <!-- 	<a href="#" id="banID" title="Toggle Censor" style="margin-left: 428px; "><i class="fa fa-ban" style="position: absolute; font-size: 30px; color: red"></i></a> 
       
    -->     <img alt="" id="femaleCensor" src="img/black-strip.png" style="position: absolute; width: 15%; top:30%; left: 42%; height: 4%">
      
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
		  
		   
		  	  
    <div class="loader"></div>
    <div id="backgroundPopup"></div>
	<div class="loaderEmail"></div>
    <div id="backgroundPopupEmail"></div>
 	<div class="loaderBP"></div>
    <div id="backgroundPopupBP"></div>
    
     <!--Col3 Ends  -->
    </div>
     
 </div><!--Page Wrapper  -->
    
</div> 

<!--  <div class="list-group" id="patientsWithDiseaseParentDiv">
                <div class="list-group-item">
                  <h4 class="list-group-item-heading">List of patients having 
                  <input type="text" value="" id="diseaseSearch">
                  <button type="button" class="btn btn-success" id="goID">Go</button>
                  </h4>
                 <div id="patientsWithDisease">  </div>  
                 
                 </div>
              </div>    -->

</div> 
</div><!-- /.container -->

<div id="toPopup">
				<div class="close"></div>
				<span class="ecs_tooltip">Press Esc to close <span class="arrow"></span></span>
				<div id="popup_content">
					<form name="test" id="test" action="AddAnnotationAction" method="post">
					<h5 align="center">Disease Information</h5>
						<table style="width: 100%;">
							<tr>
								<td>Disease Name</td>
								<td>
								<!-- <input type="text" id="diseaseDD" name="diseaseDD" class="input_text"/> -->
									<%-- <c:if test="${listOfDiseases ne null }">
										<select name="diseaseName" id="diseaseDD">
											<c:forEach begin="0" end="${fn:length(listOfDiseases)-1}"
												var="index">
												<option value="${listOfDiseases[index].getDiseaseCode()}">${listOfDiseases[index].getDiseaseName()}</option>
											</c:forEach>
										</select>
									</c:if>  --%>
								 <input type="text" id="diseaseDB" name="diseaseDB" value="" />
							
										
									
									
								</td>
							</tr>
							<tr>
								<td>Disease Description</td>
								<td>
									<textarea name="diseaseDesc" rows="10" cols="21" id="diseaseDescript"></textarea>
								</td>
							</tr>
							<tr>
								<td>Date</td>
								<td>
									<input type="text" name="dateofdiag" id="dateofdiag" style="position:relative; z-index:100000;" placeholder="mm/dd/yyyy" readonly="readonly" required />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="hidden" name="x_Offset" id="x_Offset" value=""/>
									<input type="hidden" name="diseaseCode" id="diseaseCode" />
									<input type="hidden" name="y_Offset" id="y_Offset" value=""/>
									<input type="hidden" name="BID" id="BID" value="${patient.BID}${reg.BID}"/>
									<input type="hidden" name="level" id="level" value="skin"/>
									<input type="hidden" name="display" id="display" value="FRONT"/>
									<input type="hidden" name="status" id="status" value="active"/>
									<br><div align="center"><button type="submit" id="saveDat" class="btn btn-primary">Save Details</button></div><br>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>   
			
			<!-- Email -->			
			<div id="toPopupEmail">
				<div class="closeEmail"></div>
				<span class="ecs_tooltipEmail">Press Esc to close <span class="arrow"></span></span>
				<div align="center" id="headerEmailDiv">
				<h5 id="EmailTO" style="font-weight: bold;"><label id="patientEmailID"><i class="fa fa-envelope"></i> Email to ${reg.firstName} - ${reg.email}</label></h5></div>
				 <div class="sendingEmail"></div>
				<div id="popup_contentEmail">
					<form name="test" id="test" action="" method="post">					
						<table style="width: 100%;">							
						<tr>
							<td style="font-weight: bold;">Subject</td>								
						</tr>
						<tr>
							<td>		
							 <input type="text" id="emailSub" name="emailSub" value="" placeholder="Enter Subject" />										
							</td>
						</tr>
						<tr>
							<td  style="font-weight: bold;">Email Body</td>
						</tr>
						<tr>
							<td>
								<textarea name="emailBody" rows="10" cols="21" id="emailBody" placeholder="Type Your Content Here"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2">								
								<br><div align="center"><button type="button" class="btn btn-success" id="sendEmail">Send Email</button></div><br>
							</td>
						</tr>
						</table>
					</form>
				</div>
			</div>   
			
			
			<!-- BP - Temp - Weight Pop Up -->
			<div id="toPopupBP">
				<div class="closeBP"></div>
				<span class="ecs_tooltipBP">Press Esc to close <span class="arrow"></span></span>		
				<div id="headerBPDiv" align="center">	
				<h5 id="BPHeading"><label id="headingForDetails"><i class="fa fa-pencil"></i> Enter Details</label></h5></div>
				<div id="popup_contentBP">
					<form name="test" id="test" action="" method="post">					
						<table style="width: 100%;">							
						<tr>
							<td id="labelTD">BID: </td>	
							<td><label>${patientExtra.getBID()}</label></td>														
						</tr>
							
						<tr>
							<td id="labelTD">Temperature: </td>	
							<td>
							<c:choose>
                 				<c:when test="${patientExtra.getTemperature() eq 0 }">
                  			 	<input type="text" id="temp" name="temp" placeholder="Enter Body Temperature" autofocus="true" required>
	              			 	</c:when>
	             			 	<c:otherwise>
	               			 	<input type="text" id="temp" value="${patientExtra.getTemperature()}" name="temp" placeholder="Enter Body Temperature" autofocus="true" required>              
	              			 	</c:otherwise>
	              			</c:choose>							
							</td>
						</tr>
						
						<tr>
							<td id="labelTD">Blood Pressure: </td>	
							<td>
							<c:choose> 
	             				<c:when test="${patientExtra.getBloodPressure() eq 0 }">
                    			<input type="text" id="bp" name="bp" placeholder="Enter Blood Pressure" required>
	              				</c:when>
	              			<c:otherwise>
	                			<input type="text" id="bp" value="${patientExtra.getBloodPressure()}" name="bp" placeholder="Enter Blood Pressure" required>            
 	              			</c:otherwise>
	              			</c:choose>
	              			</td>
						</tr>
						
						<tr>
							<td id="labelTD">Weight: </td>	
							<td>
							 <c:choose>
	              				<c:when test="${patientExtra.getWeight() eq 0 }">
                    				<input type="text" id="weight" name="weig" placeholder="Enter Weight" required>
	             				 </c:when>
	              			<c:otherwise>
	               					<input type="text" id="weight" value="${patientExtra.getWeight()}" name="weig" placeholder="Enter Weight" required>
	              			</c:otherwise>
	             			</c:choose>
	            			</td>
						</tr>
						
						<tr>
							<td id="labelTD">Height: </td>
							<td>
							<c:choose>
	              				<c:when test="${patientExtra.getHeight() eq 0 }">
                  					<input type="text" id="height" name="heig" placeholder="Enter Height" required>
	              				</c:when>
	              				<c:otherwise>
	               					<input type="text" id="height" value="${patientExtra.getHeight()}"  name="heig" placeholder="Enter Height" required>
	             			 </c:otherwise>
	              			 </c:choose>							
							</td>
						</tr>
						
						<tr>
						<td id="labelTD">Date: </td>
						<td>
						<c:choose>
	             			 <c:when test="${patientExtra.getDateOfDiag() == 'zero' }">
                   				<input type="date" name="dateofdiag" id="dateofdiagInfo"  placeholder="mm/dd/yyyy"  required >  
	             		 </c:when>
	              		<c:otherwise>
	              				<input type="date" name="dateofdiag" id="dateofdiagInfo" value="${patientExtra.getDateOfDiag()}"  placeholder="mm/dd/yyyy" required>
	             		 </c:otherwise>
	              		</c:choose>					
						</td>
						</tr>
						
						
						
						<tr>
						  <%-- <input type="hidden" name="BID" id="BID" value="${patientExtra.getBID()}"/> --%><!--  Pass as param -->
							<td colspan="2">								
								<br><div align="center"><button type="button" class="btn btn-success" id="update"> Update</button></div><br>
							</td>
						</tr>
					 </table>
					 
					</form>
				</div>
			</div>  
			
			
		</div>    
    </div>
  <!--    <script src="three.js"></script> -->

      <jsp:include page="FooterLayout.jsp" />
   
  </body>
  	 <script src="js/notify.js"></script>
   	 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script> 
   	 <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>  
	 <script src="js/jquery.autocomplete.js"></script>	  
	 
	 <script>
	jQuery(function(){
		$("#diseaseDB").autocomplete("list.jsp");
	});
   </script> 
   	 	 
   	 
   	 <script type="text/javascript">
   	 
   	 $(function() {	 
   	if($('#checkPast').is(':checked'))
	{
	
	$("#checkPast").notify(
			  "Uncheck to make Annotations!", 
			  { position:"right bottom", className: "info" }
			);
	
	}
   	 });
   	
   	</script>
	

      <script type="text/javascript">
  	
      $(function() {
           $("#searchPatientEditMode").click(function(e) {      	  
           	
           	var bid = document.getElementById("bodyIDEditInput").value; 
           
           	
           	if(bid)
           		{
           		var page ="edit";          	
      	  		document.location.href="GetAllAnnotationsAction?bid="+bid+"&page="+page;      	  		
           		}
           	else
           		{
           		
           		
           		}
           	

        });  
           
           
           
 });   	
    	    
     
     
      
      
      
      
      
      
      
      
  var flag='skin';
/*   var skeletalLevel = document.getElementById("skeletalLevel");  */
  
  $(function() {  
	  $("#skeletalLevel").click(function(e) {
  			flag='skeleton';
  			 $("#svgElement1").hide();
  			 $("#censorParentDiv").hide();
    		 $("#svgElement2").hide();
  			$('#checkPast').attr('checked', false);
  			$('#rangeBar').attr('disabled', true);
  			document.getElementById("obj").innerHTML = "";
  			document.getElementById("level").value='skeleton';
		    var script = document.createElement("script");
		    script.type = "text/javascript";
		    script.src = "js/skeleton.js"; 
		    document.getElementsByTagName("head")[0].appendChild(script);
		     return flag;
	  });
 
   
	    
	    /* Function for Onclick of Skin Level Tab */
	    
 
	 		$("#skinLevel").click(function(e) {	    	
	     	var bid = document.getElementById("bid").innerHTML; 
	     	$('#checkPast').attr('checked', false);
	     	 $("#svgElement2").hide();
    		 $("#svgElement3").hide();
	     	flag='skin';
	     	 if(bid)
	     	{     
	     		var page ="edit";    		
		  		document.location.href="GetAllAnnotationsAction?bid="+bid+"&page="+page;	
		
		  		
	     	}
	     	else
	     		{
	     		
	     		
	     		} 
	     		
	     	return flag;
		 	 });  	    
	 

	        $("#organLevel").click(function(e) {
	   			flag='organ';
	   			$('#checkPast').attr('checked', false);	   			
	   			 $("#svgElement1").hide();
	   			 $("#censorParentDiv").hide();
    			 $("#svgElement3").hide();
    			 $("#censorParentDiv").hide();
    			 $('#rangeBar').attr('disabled', true);		
    			
	        	 document.getElementById("obj").innerHTML = ""; 
	         	document.getElementById("level").value='organ';
	         	
	        	var gender = document.getElementById("gender").innerHTML; 
	        	if(gender=="M")
	        	{
	        		$('#obj').prepend('<img id="organImage" src="img/male.png" />');
	        	}
	        	else
	        		{
	        
	        		$('#obj').prepend('<img id="organImage" src="img/female.png" />');
	        	
	        		}
	        	return flag;
	        });  
	        
	       
	         
	        
	    });//last close
	    function toggle(obj) {
	    	
	
        	
        	 var $input = $(obj);
        	 $("#color").removeAttr("disabled");
        	 $("#fontSize").removeAttr("disabled");
        	if(flag=='skeleton')
        	{      		 		 
        		
        		  if ($input.attr('checked')){
        			
        			 $("#skelDiv").show(); 
	        		 $("#svgElement3").show();  
        		 }
        			
 	     	     else{
 	     	    	 
 	     	    	 $("#skelDiv").hide(); 
	        		 $("#svgElement3").hide();  
        		 }
 	     	    	 
 	     	     
        	}
        	else if(flag=='organ')
        		{        	
        		 if ($input.attr('checked'))
        		 {
        			 $("#organDiv").show(); 
        			 $("#svgElement2").show();
        		 }
        		else { 	     	    	 
 	     	    	 $("#organDiv").hide(); 
	        		 $("#svgElement2").hide();  
        		   }
 	     	    }
        		 
        	else
        		{
        		 if ($input.attr('checked'))
        		 {
        		 $("#skinDiv").show(); 
        		 $("#svgElement1").show();
        		
        		}
        		 else { 	     	    	 
 	     	    	 $("#skinDiv").hide(); 
	        		 $("#svgElement1").hide();  
        		   }
     	    }
        	
        	
        
        	
        	
        	
	    }
	    
	    $("#banID").click(function(e) {

	    	
	    	$( "#femaleCensor" ).toggle( "slow" );
	    	$( "#maleCensor" ).toggle( "slow" );
	    });
	    
		
    	
	  
 </script>
 
 
	

</html>