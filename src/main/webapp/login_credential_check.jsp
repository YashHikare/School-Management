<%@page import="java.sql.*" %>
<%

String user=request.getParameter("username");
String pass=request.getParameter("password");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="select id from signup where username='"+user+"' and password='"+pass+"'";
	PreparedStatement pst=con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	if(rs.next()){
		out.println("either username or password is incorrect");
	}
}catch(Exception e){
	out.println(e);
}
%>