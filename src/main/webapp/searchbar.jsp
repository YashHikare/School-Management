<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String search =request.getParameter("search");
List list=new ArrayList();
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="select sr_no,product_name,image,text,price from products where product_name like '%"+search+"%' ";
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
</body>
</html>