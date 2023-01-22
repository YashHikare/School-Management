<%@page import="java.sql.*" %>
<%
String user=request.getParameter("user");
try{
	Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
		String sql="select username from signup where username='"+user+"'";
		PreparedStatement pst=con.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		if(rs.next()){
			out.println("username already exists and you can not register with this username");
		}
		else{
			out.println("");
		}
		
	}
	catch(Exception e){
		out.println(e);
	}
%>