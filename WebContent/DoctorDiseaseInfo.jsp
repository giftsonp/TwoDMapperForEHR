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
    <title>Disease Info Page</title>
	<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


    <!-- Bootstrap core CSS -->
 	<link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet"> 
    <link href="css/business-casual.css" rel="stylesheet">
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.js"></script>
  <!--  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>  -->
	 <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script> 
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">   
    <link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">   
 
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />   

<script type="text/javascript">
    $( document ).ready(function() {
    	
    	
    	var fName = window.localStorage.getItem("fName");
    	var lName = window.localStorage.getItem("lName");
    	var bid = window.localStorage.getItem("bid");
    	
    	$(".active").attr("title","Patient BID: "+bid);
 
    
    	
    	$("#fname").text(fName);
    	$("#lname").text(lName);
    	
    	if ($("#activeTable").length)
    		{   		
    		
    		//Do nothing
    		
    		}
    	
    	else
    		{
    		$("#saveBtn").remove();
    		
    		}
    	
    	  
    	$( "#backBtn" ).click(function() {
    		
    		var page ="edit";    		
	  		document.location.href="GetAllAnnotationsAction?bid="+bid+"&page="+page;
    		 
    		});

  	}); 
    
   
    
    </script>

    <script type="text/javascript">
    

    $(function() {
    
    	$( "#saveBtn" ).click(function() {
    		  $( "#myform" ).submit();
    		});
        
    });   
    
    $(function() {
      
        
    });   
    
    
  
    
    
    
    </script>
    

  </head>

<body>
<jsp:include page="HeaderLayout.jsp" />
<div class="container">
<div class="row" style="overflow: auto;"> 
<div class="box" style="height: auto;">    
<jsp:include page="DoctorMenuLayout.jsp" /> 
<div id="page-wrapper">

 <!--Col1  -->
 <div class="row">
 
<!--  col 1 -->
   <div class="col-lg-7" style="margin-top:-20px; left: 10px">
      <h2>Body Map <small>Disease Manager</small></h2>
         <ol class="breadcrumb">
           <li class="active"><i class="fa fa-table"></i> Information of <i><label id="fname"></label>, <label id="lname"></label> </i></li>
         </ol>  

<h4> List Of Active Diseases </h4> 
<form name="myform" action="deactiveStatus" method="post" id="myform">
<c:choose>

<c:when test="${fn:length(annotationActive) gt 0 }">
<table cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered" id="activeTable">
<thead>	
<tr>
<th>Disease Name</th>
<th>DIsease Code</th>
<th>Date Of Diagnosis</th>
<th>Disease Description</th>
<th>Status </th>
</tr>
</thead>
<tbody>
<c:if test="${annotationActive ne null }">
<c:forEach begin="0" end="${fn:length(annotationActive)-1}" var="index">
 <tr>
                    <td>${annotationActive[index].getExtraDiseaseName()} </td>
                    <td>${annotationActive[index].getDiseaseCode()}</td>
                    <td>${annotationActive[index].getDateOfDiag()} </td>
					<td>${annotationActive[index].getDiseaseDesc()}</td>
					<td>
					<label><input type="radio" name="sta[${index}]" value="active"  checked/> Active</label>
					<label><input type="radio" name="sta[${index}]" value="inactive"  /> Inactive</label>
					<input type="hidden" name="leng" id="leng" value="${fn:length(annotationActive)}"/>
					<input type="hidden" name="bid" id="bid" value="${annotationActive[index].getBID()}"/>
					<input type="hidden" name="aid[${index}]" value="${annotationActive[index].getAnnotationID()}"/>
					</td>
</tr>					
</c:forEach>
</c:if>
</tbody>	
</table>

</c:when>
<c:otherwise><p id="errorMsgPara">There are no active diseases</p></c:otherwise>
</c:choose>


</form>
<br>
<h4> History Of Diseases </h4>  
<c:choose>

<c:when test="${fn:length(annotationDeactive) gt 0 }">
<table cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered">
<thead>			
<tr>
<th>Disease Name</th>
<th>DIsease Code</th>
<th>Date Of Diagnosis</th>
<th>Disease Description</th>
</tr>
</thead>
<tbody>	
<c:forEach begin="0" end="${fn:length(annotationDeactive)-1}" var="index">
 <tr>
                    <td>${annotationDeactive[index].getExtraDiseaseName()} </td>
                    <td>${annotationDeactive[index].getDiseaseCode()}</td>
                    <td>${annotationDeactive[index].getDateOfDiag()} </td>
					<td>${annotationDeactive[index].getDiseaseDesc()}  </td>
					
</tr>					
</c:forEach>
</tbody>	
<tfoot></tfoot>
</table>
</c:when>

<c:otherwise>
<p id="errorMsgPara">There are no histroy of diseases</p>
</c:otherwise>
</c:choose>
 
           
 </div> <!-- Col 1 Close -->
     
     
 <!--Col3  -->  
 
  
 <div class="col-lg-3">
 <div class="buttonsDiv">
  <button type="submit" id="saveBtn" onclick="" class="btn btn-primary btn-lg" >Save Details</button>    <br> <br> 
  <button type="button" id="backBtn" class="btn btn-primary btn-lg" >Back to Edit Mode</button>    
  </div>
</div> <!-- Col 3 Close -->

</div>  <!-- Row Close -->
</div>  <!--  Page Wrapper Close -->
</div>  <!-- Box Close -->
</div>  <!--Outer Row Close -->
</div>	<!-- container Close -->
<jsp:include page="FooterLayout.jsp" />   

		<script src="//cdnjs.cloudflare.com/ajax/libs/datatables/1.9.4/jquery.dataTables.min.js"></script>
		<script src="js/datatables.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
		
			
			var interval = 1000 * 60 * 10;
			setInterval("ajaxd()",interval); 

			$('.datatable').dataTable({
				"sPaginationType": "bs_normal"
			});	
			$('.datatable').each(function(){
				var datatable = $(this);
				// SEARCH - Add the placeholder for Search and Turn this into in-line form control
				var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
				search_input.attr('placeholder', 'Search');
				search_input.addClass('form-control input-sm');
				// LENGTH - Inline-Form control
				var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
				length_sel.addClass('form-control input-sm');
			});	
		});	
		
		</script>
</body>
</html>