<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add product</title>
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  
<div class="container">
    <div class="card card-login mx-auto text-center bg-dark">
        <div class="card-header mx-auto bg-dark">
         <!--    <span> <img src="https://amar.vote/assets/img/amarVotebd.png" class="w-75" alt="Logo"> </span><br/> -->
                        <span class="logo_title mt-5"> Add Product Dashboard </span>
<!--            <h1>--><?php //echo $message?><!--</h1>-->

        </div>
        <div class="card-body">
            <form action="add_product_server.jsp" method="POST" enctype="multipart/form-data">
            
             <div class="input-group form-group"> 
              <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-signature"></i></i></span>
                    </div>
                   <input type="text" name="pname" id="pname" class="form-control" placeholder="Product Name">
                </div>
                <div class="input-group form-group"> 
                <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                    </div>
                    <input type="" name="desc" id="desc" class="form-control" placeholder="Description">
                </div>
                <div class="input-group form-group"> 
                <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-map"></i></i></span>
                    </div>
                   <input type="text" name="price" class="form-control" placeholder="Price">
                </div>
                <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                    </div>
                   <input type="file" name="file" class="file form-control">
                </div>   
                <div class="form-group">
                    <input type="submit" name="btn" value="ADD" class="btn btn-outline-danger float-right login_btn">
                </div>

            </form>
        </div>
        </div>
    </div>
</body>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"> </script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js" integrity="sha512-6S5LYNn3ZJCIm0f9L6BCerqFlQ4f5MwNKq+EthDXabtaJvg3TuFLhpno9pcm+5Ynm6jdA9xfpQoMz2fcjVMk9g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
</body>
</html>