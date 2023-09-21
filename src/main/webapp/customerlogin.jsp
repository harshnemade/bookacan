<%@page import="java.sql.*" %>
<%@include file="dbconnect.jsp"%>
<% 
	String email=request.getParameter("loginid");
	String pwd=request.getParameter("pwd");

	PreparedStatement ps=con.prepareStatement("select * from customer where email=? and password=?");
	ps.setString(1, email);
	ps.setString(2, pwd);

	ResultSet rs = ps.executeQuery();

	if(rs.next()){
		session.setAttribute("userid",rs.getString(1));
		session.setAttribute("username",rs.getString(4));
%>
<script>
	alert("Customer login successful");
	location.href = "custhome.jsp";
</script>
<%
	}
	else{
%>
<script>
	alert("Customer login failed. Invalid ");
	location.href = "custhome.jsp";
</script>
<%
	}
%>
