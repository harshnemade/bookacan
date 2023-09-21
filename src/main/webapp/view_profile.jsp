<script type='text/javascript'>
function validate()
{
	x = document.forms["reg"]["email"];

	if(!x.value.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/))
	{
		alert("Invalid email id.");
		x.focus();
		return false;
	}

	x = document.forms["reg"]["phone"];
	if(!x.value.match(/^\d{10}$/))
	{
		alert("Invalid phone number.");
		x.focus();
		return false;
	}

	
	return true;
}
</script>
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
<title>View Profile</title>
<body>
<center><button onclick="location.href='custhome.jsp'" class='btn'>HOME</button></center><br>

<%@page import="java.sql.*" %>
<%@include file="dbconnect.jsp"%>
<% 
	int custid = Integer.parseInt(session.getAttribute("userid").toString());

	PreparedStatement ps = con.prepareStatement("select * from customer where custid=?");
	ps.setInt(1, custid);
	ResultSet rs = ps.executeQuery();
	rs.next();
%>

<form method="POST" action ="edit_profile.jsp" name="reg" onsubmit="return validate()">
<table align='center'>
<tr>
	<td colspan=3 align="center"><b>CUSTOMER DETAILS</b></td>
</tr>
<tr>
	<td><b>CUSTOMER ID:</b></td>
	<td><input type="text" name="custid" value='<%=rs.getString(1)%>' readOnly></td>
</tr>
<tr>
	<td><b>EMAIL ADDRESS:</b></td>
	<td><input type="email" name="email" value='<%=rs.getString(2)%>' readOnly></td>
</tr>
<tr>
	<td><b>PASSWORD:</b></td>
	<td><input type="text" name="pwd" placeholder="Enter password" value='<%=rs.getString(3)%>' required></td>
</tr>
<tr>
	<td><b>NAME:</b></td>
	<td><input type="text" name="name" placeholder="Enter name" value='<%=rs.getString(4)%>' required></td>
</tr>
<tr>
	<td><b>ADDRESS:</b></td>
	<td><textarea rows="3" cols="23" name="addr" required placeholder="Enter address"><%=rs.getString(5)%></textarea></td>
</tr>
<tr>
	<td><b>CONTACT NUMBER:</b></td>
	<td><input type="text" name="phone" maxlength=10 value='<%=rs.getString(6)%>' placeholder="Enter 10 digit mobile" required></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='UPDATE' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
