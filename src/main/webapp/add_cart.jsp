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

	table
	{
		background: white;
		padding: 10px;
	}
	
	td
	{
		padding: 15px;
	}
</style>
<title>Add Cart</title>
<body>
<center><button onclick="location.href='custhome.jsp'" class='btn'>HOME</button></center><br>
<%@include file="dbconnect.jsp"%>
<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	PreparedStatement ps = con.prepareStatement("select pid,pname,price,qty_in_hand,name from product, supplier where product.suppid = supplier.suppid and pid=?");
	ps.setInt(1,pid);
	ResultSet rs = ps.executeQuery();
	rs.next();
%>
<form method='post' action='add_cart1.jsp'>
<table style='padding:15px;background:linen;' align='center'>
<tr>
	<td colspan=2 style='padding:15px;text-align:center;'>
		<img src='<%="images/"+rs.getInt(1)+".jpg"%>' width=400 height=400/><br>
		<p style='font-size:14pt;font-weight:bold;'><%=rs.getString(2)%>(<%=rs.getString(5)%>)</p>
		<p>Rs.<%=rs.getFloat(3)%>/-</p>
	</td>
</tr>
<tr>
	<td><b>Qty:</b></td><td><input type='text' name='qty' required></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='ADD CART' class='btn'></td>
	<td align='center'><input type='reset' value='RESET' class='btn'></td>
</tr>
<input type='hidden' name='pid' value=<%=rs.getInt(1)%>>
</table>
</form>
</body>
