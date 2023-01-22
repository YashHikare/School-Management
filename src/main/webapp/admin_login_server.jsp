<%@page import="java.sql.*" %>
<%

String user=request.getParameter("username");
String pass=request.getParameter("password");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="select id from admin_signup where username='"+user+"' and password='"+pass+"' ";
	PreparedStatement pst=con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	if(rs.next()){
			session.setAttribute("id1", rs.getInt("id"));
			response.sendRedirect("admin_dashboard.jsp");
		
	}
		else{
			session.setAttribute("resp2","Invalid credential");
			response.sendRedirect("admin_login.jsp"); 
		}
	
	
	
}catch(Exception e){
	out.println(e);
}
%>