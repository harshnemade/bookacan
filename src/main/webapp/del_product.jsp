<%@include file="dbconnect.jsp"%>
<%
	int pid = Integer.parseInt(request.getParameter("pid"));

	PreparedStatement ps = con.prepareStatement("delete from product where pid=?");
	ps.setInt(1,pid);
	ps.executeUpdate();
	response.sendRedirect("add_products.jsp");
%>


