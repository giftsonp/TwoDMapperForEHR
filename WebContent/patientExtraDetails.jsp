<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<body>
                    
                  <form name="form1" action=updatePatientDetails method="post" id="myform">  
                  <label> BID: </label> <label>${patientExtra.getBID()}</label><br>
                  
                  <c:choose>
                  <c:when test="${patientExtra.getTemperature() eq 0 }">
                   <label>Temperature</label>: <input type="text"  name="temp" placeholder="Enter Body Temperature" autofocus="true" required>
	               <br>
	              </c:when>
	              <c:otherwise>
	               <label>Temperature</label>: <input type="text" value="${patientExtra.getTemperature()}" name="temp" placeholder="Enter Body Temperature" autofocus="true" required>
	  			   <br>              
	              </c:otherwise>
	              </c:choose>
	             
	             <c:choose> 
	              <c:when test="${patientExtra.getBloodPressure() eq 0 }">
                   <label>Blood Pressure</label>: <input type="text" name="bp" placeholder="Enter Blood Pressure" required>
	               <br>
	              </c:when>
	              <c:otherwise>
	               <label>Blood Pressure</label>: <input type="text" value="${patientExtra.getBloodPressure()}" name="bp" placeholder="Enter Blood Pressure" required>
                   <br>	              
 	              </c:otherwise>
	              </c:choose>
	              
	              <c:choose>
	              <c:when test="${patientExtra.getWeight() eq 0 }">
                   <label>Weight</label>: <input type="text" name="weig" placeholder="Enter Weight" required>
                   <br>
	              </c:when>
	              <c:otherwise>
	               <label>Weight</label>: <input type="text" value="${patientExtra.getWeight()}" name="weig" placeholder="Enter Weight" required>
	               <br>
	              </c:otherwise>
	             </c:choose>
	             
	              <c:choose>
	              <c:when test="${patientExtra.getHeight() eq 0 }">
                   <label>Height</label>: <input type="text" name="heig" placeholder="Enter Height" required>
	               <br>
	              </c:when>
	              <c:otherwise>
	               <label>Height</label>: <input type="text" value="${patientExtra.getHeight()}"  name="heig" placeholder="Enter Height" required>
	               <br>
	              </c:otherwise>
	              </c:choose>
                  
                  <c:choose>
	              <c:when test="${patientExtra.getDateOfDiag() == 'zero' }">
                   <label>Date</label>: <input type="date" name="dateofdiag" id="dateofdiag"  placeholder="mm/dd/yyyy"  required >
	               <br>
	              </c:when>
	              <c:otherwise>
	               <label>Date</label>: <input type="date" name="dateofdiag" id="dateofdiag" value="${patientExtra.getDateOfDiag()}"  placeholder="mm/dd/yyyy" required>
	               <br>
	              </c:otherwise>
	              </c:choose>
                    
                   
                   
								
                   
                  <input type="hidden" name="BID" id="BID" value="${patientExtra.getBID()}"/>
			<button type="submit" >Update Details</button>  
                  
                  </form>
</body>
</html>