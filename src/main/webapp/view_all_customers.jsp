<%
	if(session.getAttribute("adminname")==null){
		response.sendRedirect("index.jsp");
	}
%>
<style>
	body, html 
	{
  		height: 100%;
		background-image: url("images/adminhome.jpg");
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
		font-size:14pt;
	}

	table
	{
		background:black;
		color:white;
		width: 1000px;
	}
	
	td,th
	{
		padding: 10px;	
		border: 1px solid white;
	}
</style>
<title>View All Customers</title>
<body>
<br>
<h1 align="center" style='background:black;color:white;padding:10px;'>WELCOME ADMIN - <%=session.getAttribute("adminname")%></h1>
<center><button onclick="location.href='adminhome.jsp'" class='btn'>HOME</button></center><br>
<table align='center'>
<tr>
	<th>ID</th>
	<th>Email</th>
	<th>Name</th>
	<th>Address</th>
	<th>Phone</th>
</tr>

<%@include file="dbconnect.jsp"%>
<%
	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select * from customer");

	while(rs.next()){
%>
<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td>
</tr>
<%
	}
%>
</table>	
</body>

