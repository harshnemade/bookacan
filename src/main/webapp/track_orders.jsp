<style>
	body, html 
	{
  		height: 100%;
		background-image: url("images/custregbg.jpg");
		background-position: center;
  		background-repeat: no-repeat;
  		background-size: cover;
	}

	.btn
	{
		background:black;
		color:white;
		padding:10px;
		font-size:12pt;
	}

	td,th
	{
		padding: 15px;
	}

	.menu3
	{
		background: black;
		color: white;
		padding: 10px;
		text-decoration: none;
	}
</style>
<title>Track Orders</title>
<body>
<%@include file="dbconnect.jsp"%>
<%
	ResultSet rs = con.createStatement().executeQuery("select * from order_master where custid="+session.getAttribute("userid"));
%>
<center><button onclick="location.href='custhome.jsp'" class='btn'>HOME</button></center><br>
<form method='post' action='show_order.jsp'>
<table style='background:linen;padding:20px;' align='center'>
<tr>
	<td><b>Order No:</b></td>
	<td>
	<select name="oid" required>
	<option value="">Select Order ID</option>
	<%while(rs.next()){%>
	<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
	<%}%>
	</td>
	<td><input type='submit' value='Show' class='btn'></td>
</tr>
</table>
</form>
</body>
