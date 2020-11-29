<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//w3c//DTD XHTML 1.0 Transitional// EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String loginid=request.getParameter("loginid");
	String password=request.getParameter("password");
	String type=request.getParameter("type");
	boolean flag=false;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:San","scott","tiger");
	Statement stmt= con.createStatement();
	String query="select * from login where loginid='"+ loginid + "' and type='"+type+"'";
	ResultSet rs=stmt.executeQuery(query);
	while (rs.next())
	{
		String pass= rs.getString(3);
		if(pass.equals(password))
		{
			flag=true;
			break;
		}
	}if(!flag)
	{
		requestDispatcher rd=request.getRequestDispatcher("loginfail.jsp");
		rd.forward(request, response);
	}
	else
	{
		session.setAttribute("login", rs.getstring(1));
		session.setAttribute("type", rs.getstring(5));
		session.setAttribute("user", rs.getstring(2));
		session.setAttribute("loginid", rs.getstring(1));
	}
%>
	<head>
	<meta charset="ISO-8859-1">
	<title>Continuous Evaluation-<%=session.getAttribute("type").equals("Admin")?"Adminstrator Console":"Teacher Console"?"University Co-Ordinator Console":"Student Console" %>></title>
	</head>
	<body>
		<table width="700" height="500" border="0" align="center" cellspacing="0" bgcolor="#476BC0">
		<tr>
		<td width="200" rowspan="2" valign="top">
		<%@ include file="menu.jsp" %>
		</td>
		<td height="328" bgcolor="#476BC0" valign="top">
		<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
		<div allign="center"><font size="+2">Welcome,<%=session.getAttribute("user") %></font></div>
		<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
		<table align="center" width="200" cellpadding="5" cellspacing="3">
		<%
		if ("Admin".equals(type))
		{
			%>
			<tr>
			<td height="30" bgcolor="#728DCF">
			<a href="addteacher.jsp">Add Teacher</a></td></tr>
			<tr>
			<td height="30" bgcolor="#728DCF">
			<a href="addcoordinator.jsp">Add University Coordinator</a></td></tr>
			<tr>
			<td height="30" bgcolor="#728DCF">
			<a href="Pub_results.jsp">Publish Results</a></td></tr>
			<tr>
			<td height="30" bgcolor="#728DCF">
			<a href="logout.jsp">Logout and Return to Homepage</a></td></tr>
			<%
		}
		else if ("Teacher".equals(type))
		{
			%>
				<tr>
			<td height="30" bgcolor="#728DCF">
			<a href="Setpaper.jsp">Create Test Paper</a></td></tr>
			<tr>
			<td height="30" bgcolor="#728DCF">
			<a href="logout.jsp">Logout and Return to Homepage</a></td></tr>
			<%
		}
		else if ("Coordinator".equals(type))
		{
			%>
				<tr>
			<td height="30" bgcolor="#728DCF">
			<a href="addstudent.jsp">Add Students</a></td></tr>
			<tr>
			<td height="30" bgcolor="#728DCF">
			<a href="logout.jsp">Logout and Return to Homepage</a></td></tr>
			<%
		}
		else
		{
				%>
				<tr>
			<td height="30" bgcolor="#728DCF">
			<a href="testpage.jsp">Click to give test</a></td></tr>
			<tr>
			<td height="30" bgcolor="#728DCF">
			<a href="result.jsp">Click to check Result and Performance</a></td></tr>
			<tr>
			<td height="30" bgcolor="#728DCF">
			<a href="logout.jsp">Logout and Return to Homepage</a></td></tr>
			<% }%>
			</table>
	
	</td></tr>
	<tr><td>&nbsp;</td></tr>		
		</table>
	</body>
	</html>
	