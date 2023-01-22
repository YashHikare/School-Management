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
                        <form id="login-form" class="form" action="admin_login_server.jsp" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            
                            <div class="form-group">
                                <input type="hidden" name="usertype" value="admin" id="username" class="form-control">
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
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>  
<script>

$(document).ready(function() {
	$("form").submit(function() {
		var user=$("#username").val();
		/* var pass=$("#password").val(); */
		$.get("login_server.jsp",{username:user},function(data,status){
			$("#resuser").text(data);
			return;
	});
});

</script> -->

</html>