/*var x_Coord = 0;
var y_Coord = 0;*/

jQuery(function($) {	
	
	/*$("html").click(function(event) {
		
		x_Coord = event.pageX - window.scrollX;
		y_Coord = event.pageY - window.scrollY;
		
		alert("html x = "+x_Coord+" y = "+y_Coord);
	});*/
	
    $(function() {
        $( "#dateofdiag" ).datepicker();
    });
	
	$("#popup_content").click(function(event) {
			event.stopPropagation();
	});
	
	$("#obj").click(function(event) {
		
			/*x_Coord = event.pageX - window.scrollX;
			y_Coord = event.pageY - window.scrollY;*/
			
			// Get click coordinates with respect to the element
			x_Offset = event.pageX - $(this).offset().left;
			y_Offset = event.pageY - $(this).offset().top;
			
			if((x_Offset>=208 && x_Offset<= 245 && y_Offset>=50 && y_Offset<=112) || (x_Offset>=183 && x_Offset<=266 && y_Offset>=115 && y_Offset<= 278)
					|| (x_Offset>=14 && x_Offset<= 181 && y_Offset>=121 && y_Offset <= 148) || (x_Offset>=273 && x_Offset<= 447 && y_Offset>=121 && y_Offset<=148) 
					|| (x_Offset>=180 && x_Offset<= 220 && y_Offset>=282 && y_Offset<= 498) || (x_Offset>=230 && x_Offset<= 267 && y_Offset>=282 && y_Offset<= 498)){
				loading(); // loading
				
				setTimeout(function(){ // then show popup, deley in .5 second
					loadPopup(event); // function show popup 
				}, 500); // .5 second
				event.stopPropagation();
			}
	return false;
	});
	
	/* event for close the popup */
	$("div.close").hover(
		function() {
			$('span.ecs_tooltip').show();
		},
		function () {
			$('span.ecs_tooltip').hide();
		}
	);
	
	$("div.close").click(function(event) {
		disablePopup();
		event.stopPropagation();
	});
	
	$(this).keyup(function(event) {
		if (event.which == 27) { // 27 is 'Ecs' in the keyboard
			disablePopup();
		}  	
	});
	
	$("div#backgroundPopup").click(function(event) {
		disablePopup();  // function close pop up
	});	

	
	function loading() {
		$("div.loader").show();  
	}
	function closeloading() {
		$("div.loader").fadeOut('normal');  
	}
	
	var popupStatus = 0; // set value
	
	function loadPopup(event) { 
		if(popupStatus == 0) { // if value is 0, show popup
			closeloading();
			/*$('#toPopup').css('left',x_Coord);
			$('#toPopup').css('top',y_Coord);*/
			
			// Add the coordinates with the offset of element 
			var x_OffsetVal = ($("#obj").offset().left + x_Offset - window.scrollX);
			var y_OffsetVal = ($("#obj").offset().top + y_Offset);
			$('#toPopup').css('left', x_OffsetVal);
			$('#toPopup').css('top',y_OffsetVal);
			$("#x_Offset").val(x_Offset);
			$("#y_Offset").val(y_Offset);
			$("#toPopup").fadeIn(0500);
			$("#backgroundPopup").css("opacity", "0.7");
			$("#backgroundPopup").css("display", "block");
			$("#backgroundPopup").fadeIn(0001);
			popupStatus = 1;
		}	
	}
		
	function disablePopup() {
		if(popupStatus == 1) { // if value is 1, close popup
			$("#toPopup").fadeOut("normal");  
			$("#backgroundPopup").fadeOut("normal");  
			popupStatus = 0;  // and set value to 0
		}
	}
}); // jQuery End