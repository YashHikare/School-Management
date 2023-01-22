<%@page import="java.sql.*"%>
<%
int sr_no=Integer.parseInt(request.getParameter("sr_no"));
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="delete from carousel where sr_no='"+sr_no+"'";
	PreparedStatement pst=con.prepareStatement(sql);
	int i=pst.executeUpdate();
	if(i>0){
		response.sendRedirect("admin_dashboard.jsp");
	}
}
catch(Exception e){
	out.print(e);
}
%>
