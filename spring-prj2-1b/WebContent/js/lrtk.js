$(document).ready(function(){
	 $('.listimg').hover(function(){
		  $(".summary",this).stop().animate({top:'150px'},{queue:false,duration:180});},
		  
     function(){$(".summary",this).stop().animate({top:'350px'},{queue:false,duration:180});});});