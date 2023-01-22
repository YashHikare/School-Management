<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body>
                        <table class="table bg-white rounded shadow-sm  table-hover table-striped table-bordered  table-striped table-bordered"  style="width:100%">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Contact</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Email</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                
<% 
List list=new ArrayList();
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="select id,name,phone,address,email from signup";
	PreparedStatement pst=con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		
		list.add(rs.getInt("id"));
		list.add(rs.getString("name"));
		list.add(rs.getString("phone"));		
		list.add(rs.getString("address"));
		list.add(rs.getString("email"));
	}
}catch(Exception e){
	out.println(e);
}
Iterator itr=list.iterator();
while(itr.hasNext()){
%>
                                    <tr>                                  
                                    <td><%=itr.next()%></td>
                                    <td><%=itr.next()%></td>
                                    <td><%=itr.next()%></td>
                                    <td><%=itr.next()%></td>
                                    <td><%=itr.next()%></td>
                                  
                                </tr>
                                <%
}
                                %>
                            </tbody>
                        </table>
</body>
</html>