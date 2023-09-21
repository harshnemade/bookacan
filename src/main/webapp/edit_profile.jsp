<%@page import="java.sql.*"%>
<%@include file="dbconnect.jsp"%>
<body>
<%
	String id = request.getParameter("custid");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");

	PreparedStatement ps = con.prepareStatement("update customer set email=?, password=?, name=?, address=?, phone=? where custid=?");
	ps.setString(1, email);
	ps.setString(2, pwd);
	ps.setString(3, name);
	ps.setString(4, addr);
	ps.setString(5, phone);
	ps.setInt(6, Integer.parseInt(id));
	
	ps.executeUpdate();

%>
<script type="text/javascript">
	alert("Customer profile updated successfully");
	location.href = "custhome.jsp";
</script>
</body>

