<%
	if(session.getAttribute("username")==null){
		response.sendRedirect("index.jsp");
	}
%>
<style>
	body, html 
	{
  		height: 100%;
		background-image: url("images/custbg.png");
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
<title>Customer Home</title>
<body>
<br>
<h1 align="center" style='background:black;color:white;padding:10px;'>WELCOME CUSTOMER - <%=session.getAttribute("username")%></h1>
<br><br><br>
<center>
	<button onclick="location.href='view_profile.jsp'" class='btn'>VIEW PROFILE</button>
	<button onclick="location.href='prod_list.jsp'" class='btn'>PLACE ORDER</button>
	<button onclick="location.href='track_orders.jsp'" class='btn'>VIEW ORDER</button>
	<button onclick="location.href='view_cart.jsp'" class='btn'>VIEW CART</button>
	<button onclick="location.href='logout.jsp'" class='btn'>LOGOUT</button>
</center>
<jsp:include page="footer.jsp"></jsp:include>
</body>

