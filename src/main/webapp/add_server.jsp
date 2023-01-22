
<%@page import="java.sql.*" %>
<%

String sr_no=request.getParameter("sr_no");

int id=(Integer)session.getAttribute("id");
String pname="",image="";
int cprice=0;
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");

try{
	String sql="select product_name,price,image from products where sr_no='"+sr_no+"' ";
	PreparedStatement pst=con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		pname=rs.getString("product_name");
		image=rs.getString("image");
		cprice=rs.getInt("price");
		
	}
	try{
		String sql3="insert into cart(id,pname,image,cost_price,total)values('"+id+"','"+pname+"','"+image+"','"+cprice+"','"+cprice+"')";
	PreparedStatement pst3=con.prepareStatement(sql3);
	int i=pst3.executeUpdate();
	if(i>0){
		 response.sendRedirect("index.jsp"); 
	
	} 

	}
	catch(Exception e){
	out.println(e);
	} 
	 
}
catch(Exception e){
	out.println(e);
}

%>