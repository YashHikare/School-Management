<%@page import="java.sql.*" %>
<%
int id=(Integer)session.getAttribute("id");
int sr_no=Integer.parseInt(request.getParameter("sr_no"));
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="delete from cart where id='"+id+"' and sr_no='"+sr_no+"'";
	PreparedStatement pst =con.prepareStatement(sql);
	int i=pst.executeUpdate();
	if(i>0){
		response.sendRedirect("cart.jsp");
	}
}catch(Exception e){
	out.println(e);
}
%>