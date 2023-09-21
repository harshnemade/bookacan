<style>
	body, html 
	{
  		height: 100%;
		background-image: url("images/adminhome.jpg");
		background-position: center;
  		background-repeat: no-repeat;
  		background-size: cover;
  		background-attachment: fixed;
	}

	.btn
	{
		background:black;
		color:white;
		padding:10px;
		font-size:14pt;
	}

	table
	{
		background:white;
		color:black;
		width: 1000px;
	}
	
	td,th
	{
		padding: 10px;	
		border: 1px solid black;
	}

	a
	{
		text-decoration:none;
		padding: 10px;
		background: black;
		color: white;
	}
</style>
<title>Add Product</title>
<body>
<br>
<h1 align="center" style='background:black;color:white;padding:10px;'>WELCOME ADMIN - <%=session.getAttribute("adminname")%></h1>
<center><button onclick="location.href='adminhome.jsp'" class='btn'>HOME</button></center><br>

<%@include file="dbconnect.jsp"%>
<%
	ResultSet rs = con.createStatement().executeQuery("SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'product';");
	rs.next();
	int pid = rs.getInt(1);
	rs = con.createStatement().executeQuery("select * from supplier");
%>
<form method='post' action='AddProductServlet' enctype="multipart/form-data">
<br><br>
<table align='center'>
<tr>
	<td>Product ID:</td>
	<td><input type='text' name='pid' value="<%=pid%>" readOnly></td>
</tr>
<tr>
	<td>Product Name:</td>
	<td><input type='text' name='proddesc' required></td>
</tr>
<tr>
	<td>Rate:</td>
	<td><input type='text' name='rate' required></td>
</tr>
<tr>
	<td>Stock Qty:</td>
	<td><input type='text' name='qty' required></td>
</tr>
<tr>
	<td>Image URL:</td>
	<td><input type='file' name='imgurl'></td>
</tr>
<tr>
	<td>Supplier:</td>
	<td>
	<select name="sid" required>
	<option value="">Select Supplier</option>
	<%while(rs.next()){%>
	<option value="<%=rs.getString(1)%>"><%=rs.getString(4)%></option>
	<%}%>	
	</td>
</tr>
<tr>
	<td><input type='submit' value='Add' class='btn'></td>
	<td><input type='reset' value='Clear' class='btn'></td>
</tr>
</table>
</form>
<br>
<%
	rs = con.createStatement().executeQuery("select pid,pname,name,price,qty_in_hand from product,supplier where product.suppid = supplier.suppid order by pid");
%>
<table align='center'>
<tr bgcolor='red'>
	<th>Product ID</th>
	<th>Name</th>
	<th>Supplier</th>
	<th>Rate</th>
	<th>Qty In Hand</th>	
	<th>Image</th>
	<th>Delete</th>
	<th>Update</th>
</tr>
<%
	while(rs.next()){
%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><img src='images/<%=rs.getString(1)%>.jpg' width='100px' height='100px'/></td>
			<td><a href='del_product.jsp?pid=<%=rs.getInt(1)%>'>Delete</a></td>
			<td><a href='update_product.jsp?pid=<%=rs.getInt(1)%>'>Update</a></td>
		</tr>
<%
	}
%>
</table>

