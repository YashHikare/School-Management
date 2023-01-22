<%@page import="java.sql.*" %>
<%
double qty=Double.parseDouble(request.getParameter("qty")); 
int sr_no=Integer.parseInt(request.getParameter("sr_no")); 
double cprice=Double.parseDouble(request.getParameter("cprice"));


 try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="update cart set quantity='"+qty+"',total='"+qty*cprice+"' where sr_no='"+sr_no+"'";
	PreparedStatement pst=con.prepareStatement(sql);
	int i=pst.executeUpdate();
	if(i!=0){
		response.sendRedirect("cart.jsp");
	}
}catch(Exception e){
	out.println(e);
} 
%>
