/**
 * Javascript code
*/
 $(function(){
	$(".dropdown-item").click(function(){
		var icon_text=$(this).html();
		$(".dropdown-toggle").html(icon_text);
	})
});
$(function(){
	$("[data-trigger]").on("click",function(){
		var targeet_id=$(this).attr('data-target');
		$(targeet_id).toggleClass("show");
		$('body').toggleClass("offcanvas-active");
		
		
	});
	//close button
	$(".btn-close").click(function(e){
		$(".navbar-collapse").removeClass("show");
		$("body").removeClass("offcanvas-active");
	});
	$("#product").click(function(){
	$(".section").focus();
});
$(".btn-close").click(function(e){
		$(".navbar-collapse").removeClass("show");
		$("body").removeClass("offcanvas-active");
	});
	$("#product").click(function(){
	$(".section").focus();
});
}) ;
