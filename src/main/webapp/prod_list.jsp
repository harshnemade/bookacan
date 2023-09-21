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
<title>Product List</title>
<body>
<center><button onclick="location.href='custhome.jsp'" class='btn'>HOME</button></center><br>
<%@page import="java.sql.*"%>
<%@include file="dbconnect.jsp"%>
<%
	PreparedStatement ps = con.prepareStatement("select pid,pname,price,qty_in_hand,name from product, supplier where product.suppid = supplier.suppid order by pid");
	ResultSet rs = ps.executeQuery();
	int i=0;
	while(rs.next()){
%>
<table width='50%' align='center' style='padding:15px;'>
<tr>
<td style='padding:15px;text-align:center;'>
<img src='<%="images/"+rs.getInt(1)+".jpg"%>' width=200 height=200/><br>
<p style='font-size:14pt;font-weight:bold;'><%=rs.getString(2)%>(<%=rs.getString(5)%>)</p>
<p>Rs.<%=rs.getFloat(3)%>/-</p>
<a href='add_cart.jsp?pid=<%=rs.getInt(1)%>' style='font-size:12pt;padding:5px;background:red;color:white;border-radius:5px;text-decoration:none;box-shadow:5px 5px 5px #444444;'>Buy Now</a>
</td>
</tr>
</table><br>
<%
	}
%>
</table>
</body>	
