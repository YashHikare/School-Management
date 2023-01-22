<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!--  css file -->
<link href="css/add.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/uidev.css" rel="stylesheet">

<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>

<div class="product-card">
  <div class="image-container">
   
   
   
	   <% 
	   
ArrayList list=new ArrayList();
String sr_no=request.getParameter("sr_no");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="select product_name,image,price,text,sr_no from products where sr_no='"+sr_no+"'";
	PreparedStatement pst=con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		list.add(rs.getString("image"));
		list.add(rs.getString("product_name"));		
		list.add(rs.getInt("price"));
		list.add(rs.getString("text"));
		list.add(rs.getInt("sr_no"));
	}
}catch(Exception e){
	out.println(e);
}
Iterator itr=list.iterator();
while(itr.hasNext()){
%>

      <img src="img/<%= itr.next()%>" alt="">
    
    
  </div>
  <div class="product-info">
    <a href="#" class="free-shipping">Free shipping</a>
    <h3 class="product-name"><%= itr.next()%></h3>
   <!--  <p class="regular-price">1599$</p> -->
    <p class="discount-price">Rs: <%= itr.next()%></p>
    <p class="offer-info"><%= itr.next()%></p>   
    <% 
    int sid=(Integer)itr.next();
	   if(session.getAttribute("id")==null){
		   %>
		<script>
		alert(Please login First);
		</script>
		<% 
		}
	   else{
		   %>
		   <a href="add_server.jsp?sr_no=<%=sid%>">
		   <button type="button" class="add-to-cart" >
      <ion-icon name="add-outline"></ion-icon> Add to cart
    </button>
    </a>
    <% 
	   }
    %>
    
    <br>
    <div class="stock">
      <div class="stock-status"></div>
      <p class="stock-info">50+ pcs. in stock.</p>
    </div>
    <div class="buttons">
      <a href="#" class="button">
        <ion-icon name="bag-add-outline"></ion-icon> Add to cart
      </a>
      <a href="#" class="button">
        <ion-icon name="heart-outline"></ion-icon> Add to wishlist
      </a>
    </div>
  </div>
  <%
  }
  %>
</div>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>