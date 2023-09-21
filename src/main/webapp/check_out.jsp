<script type='text/javascript'>
function validate()
{
	x = document.forms["order"]["cardno"];

	if(!x.value.match(/\d{4}-\d{4}-\d{4}-\d{4}/))
	{
		alert("Invalid card no");
		x.focus();
		return false;
	}

	return true;
}
</script>

<%@include file="dbconnect.jsp"%>
<%
	ResultSet rs = con.createStatement().executeQuery("select current_date");
	rs.next();
	String odate = rs.getString(1);
	
	rs = con.createStatement().executeQuery("SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'water' AND TABLE_NAME = 'order_master';");
	rs.next();
	int oid = rs.getInt(1);

	float tot = Float.parseFloat(session.getAttribute("tot").toString());
%>
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
<title>Checkout</title>
<body>
<center><button onclick="location.href='custhome.jsp'" class='btn'>HOME</button></center><br>
<form method='post' action='checkout1.jsp' name='order' onsubmit='return validate()'>
<table width='40%' height='40%' align='center' style="background:white;">
<tr>
	<td><b>Order ID:</b></td>
	<td><input type='text' name='oid' value=<%=oid%> readOnly></td>
</tr>
<tr>
	<td><b>Order Date:</b></td>
	<td><input type='text' name='odate' value=<%=odate%> readOnly></td>
</tr>
<tr>
	<td><b>Total Amount:</b></td>
	<td><input type='text' name='amt' value=<%=tot%> readOnly></td>
</tr>
<tr>
	<td><b>Card No:</b></td>
	<td><input type='text' name='cardno' required placeholder="xxxx-xxxx-xxxx-xxxx"></td>
</tr>
<tr>
	<td><b>Card Holder Name:</b></td>
	<td><input type='text' name='cardholder' required></td>
</tr>
<tr>
	<td><b>Bank Name:</b></td>
	<td><input type='text' name='bname' required></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='Pay Now' class='btn'></td>
	<td align='center'><input type='reset' value='Clear' class='btn'></td>
</tr>
</table>
</form>
</body>
	
	

