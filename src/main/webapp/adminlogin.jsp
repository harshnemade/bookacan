<style>
	body, html 
	{
  		height: 100%;
		background-image: url("images/loginbg.jpg");
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
		height: 250px;
		width: 450px;
		top: 200px;
		left: 500px;
		position: fixed;
	}
</style>
<body>
<center><button onclick="location.href='index.jsp'" class='btn'>HOME</button></center>
<form method='post' action='adminlogin1.jsp'>
<table align='center'>
<tr>
	<td colspan=2 align='center'><b>ADMIN LOGIN</b></td>
</tr>
<tr>
	<td><b>EMAIL ID:</b></td>
	<td><input type='email' name='emailid' placeholder="Admin Email ID" required></td>
</tr>
<tr>
	<td><b>PASSWORD:</b></td>
	<td><input type='password' name='pwd' placeholder="Admin Password" required></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='LOGIN' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
</form>
<jsp:include page="footer.jsp"></jsp:include>

</body>

