<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>this is test pay page</h1>
	<br/>
	<h2>id:'<sec:authentication property="principal.username"/>'</h2>
	<br/>
	<br/>
	<a href="/shoppingmall/homepage">move back to homepage</a> <br/>
	<a href="/login/customLogout">logout</a> <br/>
</body>
</html> 