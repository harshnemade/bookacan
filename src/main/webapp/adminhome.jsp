<style>
	body, html 
	{
  		height: 100%;
		background-image: url("images/adminhome.jpg");
		background-position: center;
  		background-repeat: no-repeat;
  		background-size: cover;
	}

	.btn
	{
		background:black;
		color:white;
		padding:10px;
		font-size:14pt;
	}
</style>
<title>Admin Home</title>
<body>
<br>
<h1 align="center" style='background:black;color:white;padding:10px;'>WELCOME ADMIN - <%=session.getAttribute("adminname")%></h1>
<br><br><br>
<center>
	<button onclick="location.href='add_products.jsp'" class='btn'>MANAGE PRODUCTS</button>&nbsp;
	<button onclick="location.href='add_suppliers.jsp'" class='btn'>MANAGE SUPPLIERS</button>&nbsp;
	<button onclick="location.href='manage_orders.jsp'" class='btn'>MANAGE ORDERS</button>
	<button onclick="location.href='view_all_customers.jsp'" class='btn'>VIEW CUSTOMERS</button>
	<button onclick="location.href='logout.jsp'" class='btn'>LOGOUT</button>
</center>

<jsp:include page="footer.jsp"></jsp:include>
</body>

