<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<title>login</title>


<!-- login css file -->
<link href="css/login.css" rel="stylesheet">
</head>
<body>
<%
if(session.getAttribute("resp2")!=null)
{
String resp=(String)session.getAttribute("resp2");
%>
<script>
swal("Alert !", "<%=resp%>", "error");
</script>
<%
}
session.invalidate();
%> 

<div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="login_server.jsp" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            
                            <div class="form-group">
                                <input type="hidden" name="usertype" value="user" id="username" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="username" class="text-info">Username:</label><br>
                                <input type="text" name="username" id="username" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="text" name="password" id="password" class="form-control">
                            </div>
                            <p id="resp1"></p>
                            <div class="form-group">
                                <label for="remember-me" class="text-info"><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="submit"></input>
                            </div>
                            <div id="register-link" class="text-right">
                                <a href="signup.jsp" class="text-info">Register here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"> </script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js" integrity="sha512-6S5LYNn3ZJCIm0f9L6BCerqFlQ4f5MwNKq+EthDXabtaJvg3TuFLhpno9pcm+5Ynm6jdA9xfpQoMz2fcjVMk9g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
$(document).ready(function() {
	$.validator.addMethod("strongPassword",function(value){
		 return /(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/.test(value);
	 },"please enter a strong password");
	 
	rules:{
		username:{
			required:true,
			minlength:8,
			alphanumeric:true,
		},
		password:{
			required:true,
			strongPassword:true,
			
		},
	} ,
	highlight:function(element){
		 $(element).css("border","2px red ridge");
	 },
	 unhighlight:function(element){
		 $(element).css("border-color","black");
	 },
 messages:{
	 
	password:{
		required:"enter password",
	},
 }
 });
</script>

</html>