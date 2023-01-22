<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<link href="css/carousel_table.css" rel="stylesheet">
</head>
<body>
<section class="hero-section">
  <div class="card-grid">
  <%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="select images,sr_no from carousel";
	PreparedStatement pst=con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		%>
		 <div class="card" >
      <div class="card__background" style="background-image: url(img/<%=rs.getString("images") %>)"></div>
      <div class="card__content">
        <a class="card__category" href="#" data-cid="<%=rs.getInt("sr_no") %>" >click here to <b>delete</b></a>
        
      </div>
     
    </div>
	    <% 
	}
}catch(Exception e){
	out.println(e);
}
%> 
<div>
 <form action="add_carousel.jsp" method="POST" enctype="multipart/form-data">
 <div class="form-group">
 <input type="file" class="file form-control" name="file">
 </div>
 <br>
 <div class="form-group">
 <button type="submit" class="btn btn-success"><i class="fa-solid fa-square-plus"></i>  ADD</button>
 </div>
 
 </form>
 </div>
  </div>
 
</section>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script> 
<script>
$(document).ready(function () {
	
	$(".card__category").click(function(evt){
			//alert($(this).data("cid"));	
			evt.preventDefault();
			var sr_no = $(this).data("cid");
			$.get("delete_carousel.jsp",{sr_no:sr_no},function(data,status){
				
			})
		});
})
</script>
</html>