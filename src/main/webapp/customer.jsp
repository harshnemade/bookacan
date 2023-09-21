<%@page import="java.sql.*"%>
<%@include file="dbconnect.jsp"%>

<%
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");

	PreparedStatement ps = con.prepareStatement("select * from customer where email=?");
	ps.setString(1, email);

	ResultSet rs = ps.executeQuery();

	if(rs.next()){
%>
<script type="text/javascript">
	alert("You are already a registred customer.");
	location.href = "custlogin.jsp";
</script>
<%
	}
	else{
		ps=con.prepareStatement("insert into customer(email, password, name, address, phone) values(?,?,?,?,?)");
		ps.setString(1, email);
		ps.setString(2, pwd);
		ps.setString(3, name);
		ps.setString(4, addr);
		ps.setString(5, phone);
		ps.executeUpdate();
%>
<script type="text/javascript">
	alert("You are registred successfully.");
	location.href = "custlogin.jsp";
</script>
<%
	}
%>
