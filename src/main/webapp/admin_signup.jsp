<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Sign-Up</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- css file -->
<link href="css/signup.css" rel="stylesheet">

<!-- css file -->
<link href="js/signup.js" rel="stylesheet">
 
 <style>
  p {
        color:#52BE80;
        }
 </style>
 
 </head>
<body>

<div class="container">
    <div class="card card-login mx-auto text-center bg-dark">
        <div class="card-header mx-auto bg-dark">
         <!--    <span> <img src="https://amar.vote/assets/img/amarVotebd.png" class="w-75" alt="Logo"> </span><br/> -->
                        <span class="logo_title mt-5"> Sign-Up Dashboard </span>
<!--            <h1>--><?php //echo $message?><!--</h1>-->

        </div>
        <div class="card-body">
            <form action="admin_signup_server.jsp" method="post">
            
            <div class="input-group form-group"> 
              <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-signature"></i></i></span>
                    </div>
                    <input type="hidden" name="usertype" value="admin" class="form-control" placeholder="Name">
                </div>
             <div class="input-group form-group"> 
              <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-signature"></i></i></span>
                    </div>
                    <input type="text" name="name" class="form-control" placeholder="Name">
                </div>
                <div class="input-group form-group"> 
                <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                    </div>
                    <input type="text" name="mobile" class="form-control" placeholder="Phone Number">
                </div>
                <div class="input-group form-group"> 
                <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-map"></i></i></span>
                    </div>
                    <input type="text" name="add" class="form-control" placeholder="Enter address">
                </div>
                <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="text" name="email" id="email" class="form-control" placeholder="Email">
                </div>
                  <b><p id="resemail"></p></b>
                <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="text" name="user" id="user" class="form-control" placeholder="Username">
                </div>
                <b><p id="resuser"></p></b>

                <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                    </div>
                    <input type="password" name="password" class="form-control" placeholder="Password">
                </div>
                 <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                    </div>
                    <input type="password" name="password" class="form-control" placeholder=" Confirm Password">
                </div>
                

                <div class="form-group">
                    <input type="submit" name="btn" value="Sign-Up" class="btn btn-outline-danger float-right login_btn">
                </div>

            </form>
        </div>
    </div>
</div>
</body>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"> </script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js" integrity="sha512-6S5LYNn3ZJCIm0f9L6BCerqFlQ4f5MwNKq+EthDXabtaJvg3TuFLhpno9pcm+5Ynm6jdA9xfpQoMz2fcjVMk9g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script>
 /* $(document).ready(function() {
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
	}); */
 </script>

</html>