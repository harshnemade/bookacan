<%
	if(session.getAttribute("adminname")==null){
		response.sendRedirect("index.jsp");
	}
%>

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
<title>Add Supplier</title>
<body>
<br>
<h1 align="center" style='background:black;color:white;padding:10px;'>WELCOME ADMIN - <%=session.getAttribute("adminname")%></h1>
<center><button onclick="location.href='adminhome.jsp'" class='btn'>HOME</button></center><br>

<%@include file="dbconnect.jsp"%>
<%
	if(request.getParameter("submit")!=null){
		String sid = request.getParameter("sid");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		PreparedStatement ps = con.prepareStatement("insert into supplier values(?,?,?,?,?,?)");
		ps.setInt(1, Integer.parseInt(sid));
		ps.setString(2, email);
		ps.setString(3, "test");
		ps.setString(4, name);
		ps.setString(5, addr);
		ps.setString(6, phone);
		ps.executeUpdate();
	}


	ResultSet rs = con.createStatement().executeQuery("SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'supplier';");
	rs.next();
	int sid = rs.getInt(1);
%>
<form method='post' action='add_suppliers.jsp'>
<br><br>
<table align='center'>
<tr>
	<td>Supplier ID:</td>
	<td><input type='text' name='sid' value="<%=sid%>" readOnly></td>
</tr>
<tr>
	<td>Email:</td>
	<td><input type='email' name='email' required></td>
</tr>
<tr>
	<td>Name:</td>
	<td><input type='text' name='name' required></td>
</tr>
<tr>
	<td>Address:</td>
	<td><input type='text' name='addr' required></td>
</tr>
<tr>
	<td>Phone:</td>
	<td><input type='text' name='phone' required pattern="^[6789]\d{9}$"></td>
</tr>
<tr>
	<td><input type='submit' name="submit" value='Add' class='btn'></td>
	<td><input type='reset' value='Clear' class='btn'></td>
</tr>
</table>
</form>
<br>
<%
	rs = con.createStatement().executeQuery("select * from supplier order by suppid");
%>
<table align='center'>
<tr bgcolor='red'>
	<th>Supplier ID</th>
	<th>Email</th>
	<th>Name</th>
	<th>Address</th>
	<th>Phone</th>	
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
			<td><a href='del_supplier.jsp?sid=<%=rs.getInt(1)%>'>Delete</a></td>
			<td><a href='update_supplier.jsp?sid=<%=rs.getInt(1)%>'>Update</a></td>
		</tr>
<%
	}
%>
</table>

