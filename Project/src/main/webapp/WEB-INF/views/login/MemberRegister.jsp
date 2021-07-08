<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/login/doRegister" method="post">
		<span>id</span>
		<input type="text" name="u_id"><br/>
		<span>pw</span>
		<input type="password" name="u_pw"><br/>
		<span>name</span>
		<input type="text" name="u_name"><br/>
		<span>pid</span>
		<input type="text" name="u_pid"><br/>
		
		<span>addr</span>
		<input type="text" name="u_addr"><br/>
		<span>email</span>
		<input type="text" name="u_email"><br/>
		<span>phone</span>
		<input type="text" name="u_phone"><br/>
		
		<input type="submit" value="register">
	</form>
</body>
</html>