

jQuery(function($) {	
	
	$("#popup_contentBP").click(function(event) {
			event.stopPropagation();
	});
	
	$("#updatePatient").click(function(event) {
		loading(); // loading
						
				setTimeout(function(){ // then show popup, deley in .5 second
					loadPopup(event); // function show popup 
				}, 500); // .5 second
				
				event.stopPropagation();
		
	return false;
	});
	
	/* event for close the popup */
	$("div.closeBP").hover(
		function() {
			$('span.ecs_tooltipBP').show();
		},
		function () {
			$('span.ecs_tooltipBP').hide();
		}
	);
	
	$("div.closeBP").click(function(event) {
		disablePopup();
		event.stopPropagation();
	});
	
	$(this).keyup(function(event) {
		if (event.which == 27) { // 27 is 'Ecs' in the keyboard
			disablePopup();
		}  	
	});
	
	$("div#backgroundPopupBP").click(function(event) {
		disablePopup();  // function close pop up
	});	

	
	function loading() {
		$("div.loaderBP").show();  
	}
	function closeloading() {
		$("div.loaderBP").fadeOut('normal');  
	}
	

	
	var popupStatus = 0; // set value
	
	function loadPopup(event) { 
		if(popupStatus == 0) { // if value is 0, show popup
			closeloading();
			
			$("#toPopupBP").fadeIn(0500);
			$("#backgroundPopupBP").css("opacity", "0.7");
			$("#backgroundPopupBP").css("display", "block");
			$("#backgroundPopupBP").fadeIn(0001);
			popupStatus = 1;
		}	
	}
		
	function disablePopup() {
		if(popupStatus == 1) { // if value is 1, close popup
			$("#toPopupBP").fadeOut("normal");  
			$("#backgroundPopupBP").fadeOut("normal");  
			popupStatus = 0;  // and set value to 0
		}
	}
	
	 

	
}); // jQuery End