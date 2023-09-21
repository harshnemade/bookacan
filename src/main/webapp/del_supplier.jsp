<%@include file="dbconnect.jsp"%>
<%
	int sid = Integer.parseInt(request.getParameter("sid"));

	PreparedStatement ps = con.prepareStatement("delete from supplier where suppid=?");
	ps.setInt(1,sid);
	ps.executeUpdate();
	response.sendRedirect("add_suppliers.jsp");
%>


