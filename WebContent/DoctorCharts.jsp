<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Welcome to 2D Body Image Mapping on EHR, A website for annotating diseases on the human Body Map. This is the Charts Page" />
	<meta name="keywords" content="Body Mapping, Image Mapping, Mapper, EHR, Two Dimensional Human Body, 2D, Body Annotation, Pie Chart, Disease Chart" />
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

    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">  
    <link rel="stylesheet" href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">    
 

       	<script src="js/opentip-jquery.js"></script><!-- Change to the adapter you actually use -->
	<link href="css/opentip.css" rel="stylesheet" type="text/css" />
      <script src="js/d3.v3.min.js" charset="utf-8"></script>

    
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        var dCount = [];
        var index;
        
        dCount = JSON.parse('${chart}');
    	
        /* for(index=0; index<dCount.length;index++){
        	alert("prim >>>>"+dCount[index].count);
        	alert(" prim >>>> " +dCount[index].diseaseName);
        } */

        data.addColumn('string', 'Disease Code');
        data.addColumn('number', 'Number of people');
        for(index=0; index < dCount.length; index++){
            data.addRows([
              [dCount[index].diseaseCode, parseInt(dCount[index].count)]
            ]);
        }

        // Set chart options
        var options = {'width':600,
                       'height':500,
                       'align' : "center",
                       'is3D': true,
                       'fontSize': 12,
                       backgroundColor : "transparent",
                       'chartArea': {width:"80%", height: "80%"}};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
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
 
	  <div class="col-lg-5" style="padding-left: 2%">
	  
	   <h2>Diseases <small>Pie Chart</small></h2>
            <ol class="breadcrumb">
              <li class="active"><i class="fa fa-bar-chart-o	"></i> Charts</li>
            </ol>
            
      <p>This chart contains the classification of the various disease that are prevalent among patients in our bodymap database.</p>
	  
	  
	  </div>	
    
    <div class="col-lg-7">
  <div id="chart_div" style="border:1px solid; width: 100%"></div>
    
       
       </div>
    
     <!--Col3 Ends  -->
    </div>
 </div><!--Page Wrapper  -->
</div>
</div>
</div><!-- /.container -->
    
      <jsp:include page="FooterLayout.jsp" />
  </body>
</html>