<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem" %>

<%

String pname="";
String desc="";
int price=0;

	String path = "C:/Users/ASUS/eclipse-workspace/YkChickenShop/src/main/webapp/img"; 
	
	if (ServletFileUpload.isMultipartContent(request)) 
	{
		out.println("done");
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
						//out.println("uploaded successfully 1");                
					}
						if((item.getFieldName()).equalsIgnoreCase("pname")){
							pname=item.getString();
							//out.println("uploaded successfully 2");  
						}
						if((item.getFieldName()).equalsIgnoreCase("desc")){
							desc=item.getString();
							//out.println("uploaded successfully 3");  
						}
						if((item.getFieldName()).equalsIgnoreCase("price")){
							price=Integer.parseInt(item.getString());
							//out.println("uploaded successfully 4");  
						}
						
						
					}
                try{
                	Class.forName("com.mysql.jdbc.Driver");
                	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
                	String sql="insert into products(product_name,price,text,image)values('"+pname+"','"+price+"','"+desc+"','"+fname+"')";
                	PreparedStatement pst=con.prepareStatement(sql);
                	int i=pst.executeUpdate();
                	if(i!=0){
                		//session.setAttribute("resp", "Data uploaded successfully");
                        response.sendRedirect("admin_dashboard.jsp");
                	}
                }catch(Exception e){
                	out.println(e);
                }
                
			}catch(Exception ex)
			{
				out.println("Exception : "+ex);
			}
	}


%>