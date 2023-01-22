<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<!doctype html>
<html lang="en">
  <head>
  <title>Chicken shop</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<!-- font awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<!-- footer cdn -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- custom css file -->
<link href="css/uidev.css" rel="stylesheet">

<!-- card css file -->
<link href="css/card.css" rel="stylesheet">

<!-- responsive css file -->
<link href="css/responsive.css" rel="stylesheet">

<!-- footer css file -->
<link href="css/footer.css" rel="stylesheet">

<!-- js file -->
 <link href="js/uidev.js" rel="stylesheet"> 
    
  </head>
  <body>
   <!-- navbar -->
   <nav class="navbar navbar-expand-lg navbar-light bg-light" style="position:fixed;">
  <a class="navbar-brand" href="#">
 <img src="img/logo1.jpg" alt="logo">
</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
  <div class="offcanvas-header mt-3">
  <button type="button" class="btn-close float-left"><i class="fas fa-times"></i></button>
  </div>
  <!-- <h5 class="text-white py-2">Menu</h5> -->
    <ul class="navbar-nav mr-auto">
    
    <!-- welcome code -->
    <li class="nav-item hide">
        <a class="nav-link"  href="tel:07038438005"><i class="fa-solid fa-phone phone"></i>+917038438005</a>
      </li>
      <li class="nav-item hide">
        <a class="nav-link" href="mailto:yashhikare1999@gmail.com"><i class="fa-solid fa-envelope email"></i>yashhikare1999@gmail.com</a>
      </li>
     
        
      <!-- <li class="nav-item">
        <a class="nav-link" href="#">Videos</a>
      </li> -->
      
    </ul>
    
    <ul class="navbar-nav mr-auto">
    
    </ul>
    
     <ul class="navbar-nav">
     
     <%
     if(session.getAttribute("id")!=null){
     int id=(Integer)session.getAttribute("id");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="select name from signup where id='"+id+"'";
	PreparedStatement pst=con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		%>
		
		
		
		<li class="nav-item">
        <p style="color:#5B2C6F;">hello  <b style="color:#DE3163 ;"><%=rs.getString("name") %></b></p>
      </li>
	    <% 
	}
}catch(Exception e){
	out.println(e);
}
     }
%>
	&nbsp
      &nbsp
     <li class="nav-item">
        <a class="nav-link"  href="#" ><i class="fa-solid fa-location-dot"></i></a>
      </li>     
      &nbsp
     <li class="nav-item">
     <a href="cart.jsp" id="cart" class="nav-link"><i class="fa fa-shopping-cart"></i> Cart</a>
     </li>
     &nbsp
      &nbsp
     <li class="nav-item">
        <a class="nav-link" href="login.jsp" id="login">Log In</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="signup.jsp" id="signup">Sign Up</a>
      </li>
    </ul>
  </div>
</nav>

<!-- searchbar -->
<section class="search-bar">
<div class="container">
<div class="row">
<div class="col-lg-10 mx-auto">
<form>
<div class="p-1 bg-light shadow-sm">
<div class="input-group">
<input type="search" placeholder="search anything" id="search" class="form-control border=0 bg-light">
<div class="input-group-append">

<div class="input-group-append">
<button type="button" id="btn" class="btn btn-link"><i class="fa-solid fa-magnifying-glass"></i></button>
</div>

</div>
</div>
</div>
</form>
</div>
</div>
</div>
</section>

<!-- carousel -->
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
   <div class="carousel-item active">
      <img src="img/boneless.jfif" class="d-block w-100" alt="c1">
    </div>
  <%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="select images from carousel";
	PreparedStatement pst=con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		%>
		<div class="carousel-item">
	      <img src="img/<%=rs.getString("images") %>" class="d-block w-100" alt="c1">
	    </div>
	    <% 
	}
}catch(Exception e){
	out.println(e);
}
%>
    
    
  <!--   <div class="carousel-item">
      <img src="img/portrait1.jfif" class="d-block w-100" alt="c1">
    </div> -->
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <!-- <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span> -->
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
   <!--  <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span> -->
  </a>
</div>

<br>
<!-- cards -->

<%
List list=new ArrayList();
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="select sr_no,product_name,image,text,price from products";
	PreparedStatement pst=con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		
		list.add(rs.getInt("sr_no"));
		list.add(rs.getString("image"));
		list.add(rs.getString("product_name"));		
		list.add(rs.getString("text"));
		list.add(rs.getInt("price"));
	}
}catch(Exception e){
	out.println(e);
}
Iterator itr=list.iterator();
%>
<hr>
<h5 style="text-align: center;color: #5B2C6F ;">OUR PRODUCTS</h5>
<hr>
<div class="section"  style="background-color: #E9F7EF;" id="cards">
    <div class="container">
    	<div class="row">
            <div class="col-md-12">
    	    </div>
    	</div>
    	<div class="row">
    		<%
    		while(itr.hasNext()){
    		%>
    		
    		<div class="col-md-4" >
    		    <div class="card profile-card-2" style="height: 100%; width:100%;" >  
                 <a href="add.jsp?sr_no=<%=itr.next()%>">
                 <img src="img/<%=itr.next()%>" class="card-img-top"  alt="product"/>
                 </a>
                    <div class="card-body pt-5" style="text-align: center;">
                      <h4 class="card-title" style="color: #27AE60;"><b><%=itr.next()%></b></h4>
    <p class="card-text" style="color:#117A65 ;"><%=itr.next()%></p>
 <label class="card-label" style="color: #C0392B   ;">MRP : <%=itr.next()%></label> 
 <br>
    <!-- <a href="#!" class="btn btn-primary" style="background-color: #AF7AC5 ;"></a> --></div>
                </div>
    		</div>
    	<%
    	}
    	%>
    	    
    	</div>
    </div>
</div>
<!-- card end -->




<!-- Footer -->
	<section id="footer">
		<div class="container">
			<div class="row text-center text-xs-center text-sm-left text-md-left">
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Quick links</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Home</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>About</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Get Started</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Videos</a></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Quick links</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Home</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>About</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Get Started</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Videos</a></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Quick links</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Home</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>About</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Get Started</a></li>
						<li><a href="https://wwwe.sunlimetech.com" title="Design and developed by"><i class="fa fa-angle-double-right"></i>Imprint</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
					<ul class="list-unstyled list-inline social text-center">
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-facebook"></i></a></li>
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-twitter"></i></a></li>
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-instagram"></i></a></li>
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-google-plus"></i></a></li>
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02" target="_blank"><i class="fa fa-envelope"></i></a></li>
					</ul>
				</div>
				<hr>
			</div>	
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
					<p><u><a href="https://www.nationaltransaction.com/">National Transaction Corporation</a></u> is a Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]</p>
					<p class="h6">© All right Reversed.<a class="text-green ml-2" href="https://www.sunlimetech.com" target="_blank">Sunlimetech</a></p>
				</div>
				<hr>
			</div>	
		</div>
	</section>
	<!-- ./Footer -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 
 
  </body>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"> </script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js" integrity="sha512-6S5LYNn3ZJCIm0f9L6BCerqFlQ4f5MwNKq+EthDXabtaJvg3TuFLhpno9pcm+5Ynm6jdA9xfpQoMz2fcjVMk9g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  
  
  <script>
  $(document).ready(function() {
	$("#search").keyup(function() {
		var search=$("#search").val();
		$.get("searchbar.jsp",{search:search},function(data,status){
			$("#cards").html(data);
		})
	})
})
  
  
  </script>
</html>