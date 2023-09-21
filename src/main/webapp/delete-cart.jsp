<%@page import="java.util.*"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	Vector v = (Vector)session.getAttribute("prodlist");
	v.remove(id);
	session.setAttribute("prodlist",v);
	response.sendRedirect("view_cart.jsp");
%>