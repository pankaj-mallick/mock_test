<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="ISO-8859-1" />
<title>ContinuousEvaluation</title>
</head>
<body background ="22779_sky_night_sky.jpg">
	<table Width="700" height="500" border="0" align="center" cellspacing="0" bgcolor="#476BC0">
	<tr>
		<td width="200" rowspan="2" vallign="top">
		<%@ include file="menu.jsp"%>
		</td>	
		<td height="328" bgcolor="#476BC0" valign="top">
		<p>&nbsp;</p><p>&nbsp;</p>
		<div align="center">
		<table align="center"><tr>
		<td height="25" width="120" bgcolor="#993366">Add User</td>
		<td height="25" width="120" bgcolor="#728DCF">
		<a href="Pub_results.jsp">Publish Results</a></td>
		<td height="25" width="120" bgcolor="#728DCF">
		<a href="logout.jsp">Logout</a></td></tr></table>
		<br /><br />Enter User Information</div>
		<form name="form" method="post" action="addteacherhandler.jsp">
		<table align="center">
		<tr>
		<td>Type</td><td>
			<select name="type" Class="smalltext">
			<option value="Admin">Administrator</option>
			<option value="Teacher">Teacher</option>
			<option value="Coordinator">Coordinator</option>
			</select></td></tr>
		<tr>
		<td>Enter Name</td><td><input type="text"size="25" name="Teacher_Name" Class="smalltext"/></td>
		</tr>
		<tr>
		<td>Create Login_ID</td><td><input type="text"size="25" name="Teacher_ID" Class="smalltext"/></td>
		</tr>
		<tr>
		<td>Create Password</td><td><input type="text"size="25" name="passwd" Class="smalltext"/></td>
		</tr>
		<tr>
		<td>Enter College Code</td><td><input type="text"size="25" name="Coll_code" Class="smalltext"/></td>
		</tr>
		<tr>
		<td>Subject 1</td><td><input type="text"size="25" name="Sub1" Class="smalltext"/></td>
		</tr>
		<tr>
		<td>Subject 2</td><td><input type="text"size="25" name="Sub2" Class="smalltext"/></td>
		</tr>
		<tr>
			<td colspan="2" allign="center">
			<input type="submit" name="Submit" value="Submit" />
			<input type="reset" name="reset" value="Reset" />
		</td></tr>
		</table>
		</form>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	</table>
</body>
</html>