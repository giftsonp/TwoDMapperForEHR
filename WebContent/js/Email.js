

jQuery(function($) {	
	
	
	
	$("#popup_contentEmail").click(function(event) {
			event.stopPropagation();
	});
	
	$("#emailBtn").click(function(event) {
		loading(); // loading
				
				setTimeout(function(){ // then show popup, deley in .5 second
					loadPopup(event); // function show popup 
				}, 500); // .5 second
				
				event.stopPropagation();
		
	return false;
	});
	
	/* event for close the popup */
	$("div.closeEmail").hover(
		function() {
			$('span.ecs_tooltipEmail').show();
		},
		function () {
			$('span.ecs_tooltipEmail').hide();
		}
	);
	
	$("div.closeEmail").click(function(event) {
		disablePopup();
		event.stopPropagation();
	});
	
	$(this).keyup(function(event) {
		if (event.which == 27) { // 27 is 'Ecs' in the keyboard
			disablePopup();
		}  	
	});
	
	$("div#backgroundPopupEmail").click(function(event) {
		disablePopup();  // function close pop up
	});	

	
	function loading() {
		$("div.loaderEmail").show();  
	}
	function closeloading() {
		$("div.loaderEmail").fadeOut('normal');  
	}
	

	
	var popupStatus = 0; // set value
	
	function loadPopup(event) { 
		if(popupStatus == 0) { // if value is 0, show popup
			closeloading();
			
			$("#toPopupEmail").fadeIn(0500);
			$("#backgroundPopupEmail").css("opacity", "0.7");
			$("#backgroundPopupEmail").css("display", "block");
			$("#backgroundPopupEmail").fadeIn(0001);
			popupStatus = 1;
		}	
	}
		
	function disablePopup() {
		if(popupStatus == 1) { // if value is 1, close popup
			$("#toPopupEmail").fadeOut("normal");  
			$("#backgroundPopupEmail").fadeOut("normal");  
			popupStatus = 0;  // and set value to 0
		}
	}
	
	 

	
}); // jQuery End