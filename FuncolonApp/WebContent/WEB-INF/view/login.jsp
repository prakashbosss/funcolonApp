<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<form action="login" method="post">
		<table>
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="userName"/></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="userPwd"/></td>
			</tr>
			<tr>
				<td><button type="submit">Submit</button></td>
				<td><button type="reset">Reset</button></td>
			</tr>

		</table>


	</form>
</body>
</html>