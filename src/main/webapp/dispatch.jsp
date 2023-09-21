<%@include file="dbconnect.jsp"%>
<%
	int oid = Integer.parseInt(request.getParameter("oid"));

	PreparedStatement ps = con.prepareStatement("update order_master set status='Dispatched' where oid=?");

	ps.setInt(1, oid);

	ps.executeUpdate();

	response.sendRedirect("manage_orders.jsp");
%>
