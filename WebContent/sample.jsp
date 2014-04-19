<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="js/jquery.js"></script>
<style>
form .zip {
  display: block !important;
}
</style>
<script>
$( document ).ready(function() {
	
	$(".f div > div").hide();
	$(".ze").hide();
	 
	$("#zip").keyup(function() {
		
		  var el = $(this);
		  if ((el.val().length == 5)) {
		 $.ajax({
		  url: "http://zip.elevenbasetwo.com",
		  cache: false,
		  dataType: "json",
		  type: "GET",
		  data: "zip=" + el.val(),
		  success: function(result, success) {

		    $(".f div > div").slideDown(); 
		    $("#c").val(result.city); 
		    $("#s").val(result.state);
		    $(".ze").hide(); 
		    $("#a1").focus();
		  },
		  error: function(result, success) {
		    $(".ze").show();
		  }
		 }); 
		  } 
		  else
			  {
			  $(".ze").hide();
			  }
		}); 

});

</script>
</head>

<body>
<form action="#" method="post" class="f">

    <label>Address</label>

    <div>
      <div>
        <input type="text" name="a1" id="a1">
        <label>Street #1</label>
      </div>
    </div>
    <div>
      <div>
        <input type="text" name="a2" id="a2">
        <label>Street #2</label>
      </div>
    </div>
    <div>
      <div class="city">
        <input type="text" name="c" id="c">
        <label>City</label>
      </div>
       <div class="state">
        <input type="text" name="s" id="s">
        <label>State</label>
      </div>
       <div class="zip">
        <input type="text" pattern="[0-9]*" name="zip" id="zip" maxlength="5">
        <label>Zip-Code</label>
        <p class="ze">Not a real zip code.</p>
      </div>
    </div>

 </form>
</body>
</html>