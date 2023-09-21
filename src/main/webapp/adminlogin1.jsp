<%@page import="java.sql.*" %>
<%@include file="dbconnect.jsp"%>

<% 
	String emailid=request.getParameter("emailid");
	String pwd=request.getParameter("pwd");
        
	PreparedStatement ps = con.prepareStatement("select * from admin where admin_email=? and admin_pwd=?");

	ps.setString(1, emailid);
	ps.setString(2, pwd);

	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		session.setAttribute("adminname",rs.getString(4));
%>
<script>
	alert("Admin login successful");
	location.href = "adminhome.jsp";
</script>
<%
	}
	else{
%>
<script>
	alert("Admin login failed. Invalid email/password.");
	location.href = "adminlogin.jsp";
</script>
<%
	}
%>