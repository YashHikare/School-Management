<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%
String path = "C:/Users/ASUS/eclipse-workspace/YkChickenShop/src/main/webapp/img"; 
if (ServletFileUpload.isMultipartContent(request)) 
{
		try
		{

			String fname = null;
			String fsize = null;
			String ftype = null;
            String fpath=null;
            List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            for (FileItem item : multiparts) {
				if (!item.isFormField()) {
					fname = new File(item.getName()).getName();
					fsize = new Long(item.getSize()).toString();
					ftype = item.getContentType();
					item.write(new File(path + File.separator+fname));
					               
				}
            }
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="insert into carousel(images)values('"+fname+"')";
	PreparedStatement pst=con.prepareStatement(sql);
	int i=pst.executeUpdate();
	if(i>0){
		response.sendRedirect("admin_dashboard.jsp");
	}
}
catch(Exception e){
	out.print(e);
}
		}
		catch(Exception e){
			out.print(e);
		}
}
%>