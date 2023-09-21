<%
	session.removeAttribute("adminname");
	session.removeAttribute("username");
	session.invalidate(); 
%>
<script>
	alert('Logged out successfully');
	location.href = 'index.jsp';
</script>

