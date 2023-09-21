<style>
	body, html 
	{
  		height: 100%;
		background-image: url("images/custregbg.jpg");
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
<title>View Order</title>
<body>
<center><button onclick="location.href='custhome.jsp'" class='btn'>HOME</button></center><br>
<%@include file="dbconnect.jsp"%>
<%
	int oid = Integer.parseInt(request.getParameter("oid"));
	
	PreparedStatement ps = con.prepareStatement("select oid, odate, name, address, phone, email, total, status, card_no, card_holder, bank_name from order_master,customer where order_master.custid = customer.custid and oid=?");

	ps.setInt(1,oid);

	ResultSet rs = ps.executeQuery();

	rs.next();
%>

<table width='40%' height='40%' align='center' style='background:black;color:white;'>
<tr>
	<td><b>Order ID:</b></td>
	<td><%=rs.getString(1)%></td>
</tr>
<tr>
	<td><b>Order Date:</b></td>
	<td><%=rs.getString(2)%></td>
</tr>
<tr>
	<td><b>Customer Name:</b></td>
	<td><%=rs.getString(3)%></td>
</tr>
<tr>
	<td><b>Address:</b></td>
	<td><%=rs.getString(4)%></td>
</tr>
<tr>
	<td><b>Phone:</b></td>
	<td><%=rs.getString(5)%></td>
</tr>
<tr>
	<td><b>Email ID:</b></td>
	<td><%=rs.getString(6)%></td>
</tr>
<tr>
	<td><b>Total:</b></td>
	<td>Rs.<%=rs.getString(7)%>/-</td>
</tr>
<tr>
	<td><b>Status:</b></td>
	<td><%=rs.getString(8)%></td>
</tr>
<tr>
	<td><b>Card No:</b></td>
	<td><%=rs.getString(9)%></td>
</tr>
<tr>
	<td><b>Card Holder:</b></td>
	<td><%=rs.getString(10)%></td>
</tr>
<tr>
	<td><b>Bank Name:</b></td>
	<td><%=rs.getString(11)%></td>
</tr>
</table><br>
<%
	ps = con.prepareStatement("select order_details.pid, pname, name, price, qty, qty*price from product, order_details, supplier where product.pid = order_details.pid and supplier.suppid = product.suppid and oid=?");
	ps.setInt(1, oid);
	rs = ps.executeQuery();
%>
<table width='80%' align='center' style='background:black;color:white;'>
<tr style='background:red;'>
	<th>Product ID</th>
	<th>Name</th>
	<th>Supplier</th>
	<th>Rate</th>
	<th>Qty</th>
	<th>Amount</th>
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
	<td><%=rs.getString(6)%></td>
</tr>
<%
	}
%>
</body>
