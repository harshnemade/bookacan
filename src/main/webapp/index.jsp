<style>
	body, html 
	{
  		height: 100%;
		background-image: url("images/background.jpg");
		background-position: center;
  		background-repeat: no-repeat;
  		background-size: cover;
	}

	.btn
	{
		background:black;
		color:white;
		padding:10px;
		font-size:14pt;
	}
</style>
<title>BOOKACAN</title>
<body>
<h1 align="center" style="padding:20px;">BOOKACAN - ONLINE  WATER  SUPPLY  SYSTEM</h1>
<br>
<center>
	<button onclick="location.href='adminlogin.jsp'" class='btn'>ADMIN</button>
	<button onclick="location.href='custlogin.jsp'" class='btn'>CUSTOMER</button>
	<button onclick="location.href='about.jsp'" class='btn'>ABOUT</button>
	<button onclick="location.href='contact.jsp'" class='btn'>CONTACT</button>
</center>
<jsp:include page="footer.jsp"></jsp:include>
</body>

