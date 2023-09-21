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

	td
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
<title>Cart</title>
<body>
<center><button onclick="location.href='custhome.jsp'" class='btn'>HOME</button></center><br>
<%@page import="java.util.*"%>
<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	int qty = Integer.parseInt(request.getParameter("qty"));

	Vector rec = new Vector();
	rec.add(pid);
	rec.add(qty);

	Vector prodlist = (Vector)session.getAttribute("prodlist");

	if(prodlist==null)
		prodlist = new Vector();

	prodlist.add(rec);

	session.setAttribute("prodlist",prodlist);
%>
<h3>Product added to cart successfully.</h3>
<table width='60%'>
<tr>
	<td><a href='view_cart.jsp' class='menu3'>View Cart</a></td>
	<td><a href='prod_list.jsp' class='menu3'>Continue Shopping</a></td>
	<td><a href='check_out.jsp' class='menu3'>Checkout</a></td>
</tr>
</table>
</body>
