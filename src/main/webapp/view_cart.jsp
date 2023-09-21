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
		text-decoration:none;
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
<title>View Cart</title>
<body>
<%@page import="java.util.*"%>
<center><button onclick="location.href='custhome.jsp'" class='btn'>HOME</button></center><br>
<%
	Vector v = (Vector)session.getAttribute("prodlist");
	if(v==null)
	{
		response.sendRedirect("custhome.jsp");
		return;
	}
%>
<%@include file="dbconnect.jsp"%>
<br><br>
<table border=1 style='background:black;color:white;' align='center'>
<tr style='background:red;'>
<th>Sr.No.</th>
<th>Product Name</th>
<th>Supplier</th>
<th>Rate</th>
<th>Qty</th>
<th>Amount</th>
<th></th>
</tr>
<%
	PreparedStatement ps = con.prepareStatement("select pid,pname,price,qty_in_hand,name from product, supplier where product.suppid = supplier.suppid and pid=?");

	int i=1;
	float tot=0;
	for(int j=0;j<v.size();j++){
		Vector rec = (Vector)v.get(j);
		int pid = Integer.parseInt(rec.get(0).toString());
		int qty = Integer.parseInt(rec.get(1).toString());
		ps.setInt(1,pid);
		ResultSet rs = ps.executeQuery();
		rs.next();
		float amt = qty*rs.getFloat(3);
		tot+=amt;
%>
<td><%=i%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getFloat(3)%></td>
<td><%=rec.get(1)%></td>
<td><%=amt%></td>
<td><a href="delete-cart.jsp?id=<%=j%>" class="btn">Delete</a></td>
</tr>
<%
		i++;
	}
%>
<tr>
	<td colspan=5 align='right'><b>Total:</b></td>
	<td>Rs.<%=tot%>/-</td>
</tr>
</table><br>
<table width='40%' align='center'>
<tr>
	<td align='center'><a href='prod_list.jsp' class='menu3'>Continue Shopping</a></td>
	<td align='center'><a href='check_out.jsp' class='menu3'>Checkout</a></td>
</tr>
</table>
<%
	session.setAttribute("tot",tot);
%>
</body>

