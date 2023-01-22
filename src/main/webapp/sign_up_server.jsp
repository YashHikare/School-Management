<%@page import="java.sql.*" %>
<%
String name=request.getParameter("name");
long mobile=Long.parseLong(request.getParameter("mobile"));
String add=request.getParameter("add");
String email=request.getParameter("email");
String user=request.getParameter("user");
String pass=request.getParameter("password");
String resp="";
String usertype=request.getParameter("usertype");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
try{
	//email check
	String sql1="select email from signup where email='"+email+"' or username='"+user+"'";
		PreparedStatement pst1=con.prepareStatement(sql1);
		ResultSet rs1=pst1.executeQuery();
		if(rs1.next()){
			
			
		}else{
			//insert into table
						try{
							String sql3="insert into signup(name,phone,address,email,username,password)values('"+name+"','"+mobile+"','"+add+"','"+email+"','"+user+"','"+pass+"')";
						PreparedStatement pst3=con.prepareStatement(sql3);
						int i=pst3.executeUpdate();
						if(i>0){
							resp="registered successfully";
							response.sendRedirect("index.jsp");
						}
						
					}
					catch(Exception e){
						out.println(e);
					}
					}
					
				}
				catch(Exception e){
					out.println(e);
				}
%>