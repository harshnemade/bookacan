<script type='text/javascript'>
function validate()
{
	x = document.forms["login"]["loginid"];

	if(!x.value.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/))
	{
		alert("Invalid email id.");
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
		background-image: url("images/custbg.jpg");
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
<title>Customer Sign In</title>
<body>
<center><button onclick="location.href='index.jsp'" class='btn'>HOME</button></center>
<form method='post' action='customerlogin.jsp' name="login" onsubmit="return validate()">
<table align='center'>
<tr>
	<td colspan=2 align='center'><b>CUSTOMER LOGIN</b></td>
</tr>
<tr>
	<td><b>EMAIL ID:</b></td>
	<td><input type='text' name='loginid' required placeholder='Enter email ID'></td>
</tr>
<tr>
	<td><b>PASSWORD:</b></td>
	<td><input type='password' name='pwd' required placeholder='Enter password'></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='LOGIN' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
<tr>
	<td colspan=2 align='center'>Not registered yet? Click <a href='custreg.jsp'><b>here</b></a> to register.</td>
</tr>
</table>
</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>

