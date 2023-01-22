<%@page import="java.sql.*" %>
<%
String uemail=request.getParameter("uemail");
try{
	Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
		String sql="select email from signup where email='"+uemail+"'";
		PreparedStatement pst=con.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		if(rs.next()){
			out.println("email already registered and you can not register with this email");
		}
		else{
			out.println("");
		}
		
	}
	catch(Exception e){
		out.println(e);
	}
%>