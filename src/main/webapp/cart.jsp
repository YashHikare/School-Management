<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/cart.css" rel="stylesheet">
<!-- font awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<div class="container">
  <div class="navbar">
    <div class="logo">
      <a href="index.jsp"><img src="img/logo1.jpg" alt="Yk chicken" width="100%" /></a>
    </div>
    <nav>
      <ul id="MenuItems">
        <li><a href="index.jsp">Home</a></li>
        <!-- <li><a href="product.html">Products</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="account.html">Account</a></li> -->
      </ul>
    </nav>
    <a href="cart.html"><img src="https://i.ibb.co/PNjjx3y/cart.png" alt="" width="30px" height="30px" /></a>
    <img src="https://i.ibb.co/6XbqwjD/menu.png" alt="" class="menu-icon" onclick="menutoggle()" />
  </div>
</div>

<!-- cart items details -->
<%
if(session.getAttribute("id")!=null ){
%>


<%
int id=(Integer)session.getAttribute("id"); 
double cprice=0;
int sr_no=0;
ArrayList list=new ArrayList();
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
try{
	
	String sql="select image,pname,cost_price,sr_no,quantity,total from cart where id='"+id+"'";
	PreparedStatement pst=con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		list.add(rs.getString("image"));
		list.add(rs.getString("pname"));
		list.add(rs.getDouble("cost_price"));
		list.add(rs.getInt("sr_no"));
		list.add(rs.getDouble("quantity"));
		
		list.add(rs.getDouble("total"));
		
	}
}catch(Exception e){
	out.println(e);
}
if(!list.isEmpty()){
%>
<div class="small-container cart-page">
  <table>
    <tr>
      <th>Product</th>
      <th>Rs per kg</th>
      <th>Quantity</th>
      <th></th>
      <th>Subtotal</th>
    </tr>

<% 
Iterator itr=list.iterator();
while(itr.hasNext()){
%>

    <tr>
    <form action="quantity_change.jsp">
                  <td>
                  <img src="img/<%=itr.next()%>" alt="" />
                  <br>
                  <p><%=itr.next()%></p>
                  </td>
      			 <td>
            	<%
            	cprice=(Double)itr.next();
            	%>
            	<small id="cprice"> <%=cprice %></small>
            	<br />
            	 <%
      sr_no=(Integer)itr.next();
      %>
            <a href="remove.jsp?sr_no=<%=sr_no %>" id="remove">Remove</a>
           	 </td>
           
      <td><input type="text" id="qty" name="qty"  value="<%=itr.next()%>" style="border-color:gray; width:20%;"/>
     
      <br><input type="hidden" name="sr_no" value="<%=sr_no%>"><br><input type="hidden" name="cprice" value="<%=cprice%>"></td>
      
      <td><button type="submit"  class="btn btn-primary">confirm</button></td>
      <td id="total"><%=itr.next() %></td>
       </form>
    </tr>
    <%
}
    %>
   
  </table>

  <div class="total-price">
    <table>
      <tr>
      <td>Subtotal</td>
      <%
      double total=0;
      try{
    		
    		String sql="select sum(total) from cart where id='"+id+"' and status=0";
    		PreparedStatement pst=con.prepareStatement(sql);
    		ResultSet rs=pst.executeQuery();
    		while(rs.next()){  			
    			total=rs.getDouble(1);
    		}
    	}catch(Exception e){
    		out.println(e);
    	}
      %>
        
        <td><%=total %></td>
      </tr>
      <tr>
        <td>Tax</td>
        <td><%=total*0.1 %></td>
      </tr>
      <tr>
        <td>Total</td>
        <td><%=Math.round(total*1.1*100.0/100.0) %></td>
      </tr>
    </table>
  </div>
</div>
<%
}
else
{
	%>
	<h3 style="text-align: center; padding-top:10%; margin-bottom: 30%; color=red;">NO PRODUCT SELECTED</h3>
	<%	
}
}
else{
	
%>
<h3 style="text-align: center; padding-top:10%; margin-bottom: 30%; color=red;">LOGIN PLEASE</h3>
<%
}
%>



<!-- Footer -->
<div class="footer">
  <div class="container">
    <div class="row">
      <div class="footer-col-1">
        <h3>Download Our App</h3>
        <p>Download App for Android and iso mobile phone.</p>
        <div class="app-logo">
          <img src="https://i.ibb.co/KbPTYYQ/play-store.png" alt="" />
          <img src="https://i.ibb.co/hVM4X2p/app-store.png" alt="" />
        </div>
      </div>

      <div class="footer-col-2">
        <img src="img/logo1.jpg" style="width:40px; height:40px;" alt="" />
        <p>
          Our Purpose Is To Sustainably Make the Pleasure and Benefits of
          Sports Accessible to the Many.
        </p>
      </div>

      <div class="footer-col-3">
        <h3>Useful Links</h3>
        <ul>
          <li>Coupons</li>
          <li>Blog Post</li>
          <li>Return Policy</li>
          <li>Join Affiliate</li>
        </ul>
      </div>

      <div class="footer-col-4">
        <h3>Follow us</h3>
        <ul>
          <li>Facebook</li>
          <li>Twitter</li>
          <li>Instagram</li>
          <li>YouTube</li>
        </ul>
      </div>
    </div>
    <hr />
    <p class="copyright">Copyright &copy; 2021 - Red Store</p>
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>  
<script>
  var MenuItems = document.getElementById('MenuItems');
  MenuItems.style.maxHeight = '0px';

  function menutoggle() {
    if (MenuItems.style.maxHeight == '0px') {
      MenuItems.style.maxHeight = '200px';
    } else {
      MenuItems.style.maxHeight = '0px';
    }
  }
   /* $(document).ready(function() { 
		$("#qty").keyup( function(){
		var qty=$("#qty").val();
		var cprice=$("#cprice").text(); 
		$.get("qtyXprice.jsp",{quantity:qty,cprice:cprice},function(data,status){
			$("#total").text(data);
		});
	});
		$("#remove").click( function(){
			$.get("qtyXprice.jsp",{quantity:qty,cprice:cprice},function(data,status){
				$("#total").text(data);
			});
		});
   }); */
</script>
</body>
</html>