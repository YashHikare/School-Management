/**
 * 
 */
 
 $(document).ready(function() {
	$("#email").blur( function(){
		var email=$(this).val();
		$.get("email_verification_server.jsp",{uemail:email},function(data,status){
			$("#resemail").text(data);
		});
	});
	$("#user").blur(function() {
		var username=$("#user").val();
		$.get("user_verification_server.jsp",{user:username},function(data,status){
			$("#resuser").text(data);
		});
	});
	$("#btn").click(function() {
		$.get("table_View.jsp",function(data,status){
			$("#table").html(data);
		});
	});
});
