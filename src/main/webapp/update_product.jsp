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

	table
	{
		background:white;
		color:black;
		width: 1000px;
	}
	
	td,th
	{
		padding: 10px;	
		border: 1px solid white;
	}
</style>
<body>
<br>
<h1 align="center" style='background:black;color:white;padding:10px;'>WELCOME ADMIN - <%=session.getAttribute("adminname")%></h1>
<center><button onclick="location.href='adminhome.jsp'" class='btn'>HOME</button></center><br>
<%@include file="dbconnect.jsp"%>
<%
	int pid = Integer.parseInt(request.getParameter("pid"));

	PreparedStatement ps = con.prepareStatement("select * from product where pid=?");
	ps.setInt(1,pid);
	ResultSet rs = ps.executeQuery();
	rs.next();
	
	ResultSet rs1 = con.createStatement().executeQuery("Select * from supplier");
%>
<form method='post' action='UpdateProductServlet' enctype="multipart/form-data">
<br><br>
<table align='center'>
<tr>
	<td>Product ID:</td>
	<td><input type='text' name='pid' value='<%=rs.getString(1)%>' readOnly></td>
</tr>
<tr>
	<td>Product Name:</td>
	<td><input type='text' name='proddesc' value='<%=rs.getString(2)%>' required></td>
</tr>
<tr>
	<td>Rate:</td>
	<td><input type='text' name='rate' value='<%=rs.getString(3)%>' required></td>
</tr>
<tr>
	<td>Stock Qty:</td>
	<td><input type='text' name='qty' value='<%=rs.getString(4)%>' required></td>
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
	<%while(rs1.next()){%>
	<option value="<%=rs1.getString(1)%>" <%if(rs.getInt(5)==rs1.getInt(1)){out.print(" selected");}%>><%=rs1.getString(4)%></option>
	<%}%>	
	</td>
</tr>
<tr>
	<td><input type='submit' value='Update' class='btn'></td>
	<td><input type='reset' value='Clear' class='btn'></td>
</tr>
</table>
</form>

