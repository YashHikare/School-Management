<!DOCTYPE html>
<html lang="en">
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="css/admin_dashboard.css" />
   
   
    <!-- font awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    
    <title>Admin Dashboard</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <div class="bg-white" id="sidebar-wrapper">
            <div class="sidebar-heading text-center py-4 primary-text fs-4 fw-bold text-uppercase border-bottom"><i
                    class="fas fa-user-secret me-2"></i>ChickenWala</div>
            <div class="list-group list-group-flush my-3">
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text active"><i
                        class="fas fa-tachometer-alt me-2"></i>Dashboard</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold" id="carousel"><i
                        class="fas fa-paperclip me-2" ></i>Carousel</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold" id="customer">
                <i class="fa-solid fa-sack-dollar me-2"></i>Customer & Sales</a>
                <a href="logout.jsp" class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
                        class="fas fa-power-off me-2"></i>Logout</a>
            </div>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0">Dashboard</h2>
                </div>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

<% 
int id1=(Integer)session.getAttribute("id1");
String name=null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="select name from admin_signup where id='"+id1+"'";
	PreparedStatement pst=con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	if(rs.next()){
		name=rs.getString("name");		
	}
}catch(Exception e){
	out.println(e);
}

%>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle second-text fw-bold" href="#" id="navbarDropdown"
                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user me-2"></i><%=name%>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Profile</a></li>
                                <li><a class="dropdown-item" href="#">Settings</a></li>
                                <li><a class="dropdown-item" href="#">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="container-fluid px-4">
                <div class="row g-3 my-2">
                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2">720</h3>
                                <p class="fs-5">Products</p>
                            </div>
                            <i class="fas fa-gift fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2">4920</h3>
                                <p class="fs-5">Sales</p>
                            </div>
                            <i
                                class="fas fa-hand-holding-usd fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2">3899</h3>
                                <p class="fs-5">Delivery</p>
                            </div>
                            <i class="fas fa-truck fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2">%25</h3>
                                <p class="fs-5">Increase</p>
                            </div>
                            <i class="fas fa-chart-line fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div>
                </div>

                <div class="row my-5">
                  <section id="addproduct">
                    <h3 class="fs-4 mb-3">Recent Orders</h3>
                    <div class="col">
                   
                        <table class="table bg-white rounded shadow-sm  table-hover table-striped table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th scope="col">###</th>
                                    <th scope="col">Product</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Edit</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                
<% 
List list=new ArrayList();
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web_ykchicken","root","");
	String sql="select sr_no,image,product_name,price,text from products";
	PreparedStatement pst=con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		
		list.add(rs.getInt("sr_no"));
		list.add(rs.getString("image"));
		list.add(rs.getString("product_name"));		
		list.add(rs.getInt("price"));
		list.add(rs.getString("text"));
	}
}catch(Exception e){
	out.println(e);
}
Iterator itr=list.iterator();
while(itr.hasNext()){
%>
                                    <tr>                                  
                                    <%
                                    int sr_no=(Integer)itr.next();
                                    %>
                                    <td><img  src="img/<%=itr.next()%>" style="height: 100px; width: 100px;"></td>
                                    <td><%=itr.next()%></td>
                                    <td>Rs <%=itr.next()%></td>
                                    <td><%=itr.next()%></td>
                                    <td><a href="edit.jsp?sr_no=<%=sr_no%>"><i class="fa-solid fa-pen-fancy"></i></a></td>
                                    <td><a href="delete.jsp?sr_no=<%=sr_no%>"><i class="fa-solid fa-trash-can"></i></a></td>
                                </tr>
                                <%
}
                                %>
                            </tbody>
                        </table>
                    </div>
                     <div>
				<button type="button" class="btn btn-success"  id="addbtn"><i class="fa-solid fa-square-plus"></i>  ADD</button>
            </div>
                     </section>                  
                </div>
               
            </div>
           

           
        </div>
    </div>
    <!-- /#page-content-wrapper -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"></script>
	<script src="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script> 
    <script>
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };
        $(document).ready(function() {
			$("#addbtn").click(function() {
				$.get("add_product.jsp",function(data,status){
					$("#addproduct").html(data);
				})
			});
			$("#carousel").click(function() {
				$.get("carousel_table.jsp",function(data,status){
					$("#addproduct").html(data);
				})
				
			});
			$("#customer").click(function() {
				$.get("customer.jsp",function(data,status){
					$("#addproduct").html(data);
				})
				
			});
		});
    </script>
</body>

</html>