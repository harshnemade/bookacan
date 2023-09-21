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
</style>
<title>Checkout</title>
<%@page import="java.util.*"%>
<%@include file="dbconnect.jsp"%>
<%
	int oid = Integer.parseInt(request.getParameter("oid"));
	String odate = request.getParameter("odate");
	float amt = Float.parseFloat(request.getParameter("amt"));
	String cardno = request.getParameter("cardno");
	String cardholder = request.getParameter("cardholder");
	String bname = request.getParameter("bname");
	String eid = session.getAttribute("userid").toString();

	PreparedStatement ps = con.prepareStatement("insert into order_master values(?,?,?,?,?,?,?,?)");
	ps.setInt(1,oid);
	ps.setString(2,odate);
	ps.setFloat(3,amt);
	ps.setString(4,"Pending");
	ps.setString(5,cardno);
	ps.setString(6,cardholder);
	ps.setString(7,bname);
	ps.setString(8,eid);
	
	ps.executeUpdate();

	ps = con.prepareStatement("insert into order_details values(?,?,?)");

	Vector prodlist = (Vector)session.getAttribute("prodlist");

	for(int i=0;i<prodlist.size();i++){
		Vector rec = (Vector)prodlist.get(i);
		int pid = Integer.parseInt(rec.get(0).toString());
		int qty = Integer.parseInt(rec.get(1).toString());

		ps.setInt(1,pid);
		ps.setInt(2,oid);
		ps.setInt(3,qty);
		ps.executeUpdate();
	}
%>
<body>
<center><button onclick="location.href='custhome.jsp'" class='btn'>HOME</button></center><br>
<h3>Your order is placed successfully.</h3>
<h4>Order No: <%=oid%></h4>
<h4>Your order will be delivered next morning.</h4>
<%
	session.removeAttribute("prodlist");
	session.removeAttribute("tot");
%>
</body>
	
	

