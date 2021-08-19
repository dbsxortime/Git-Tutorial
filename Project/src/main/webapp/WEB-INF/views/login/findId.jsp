<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="findidall" style="width : 300px; margin: auto;  margin-bottom: 5%; ">
<p style="font-size: 15px;">아이디 찾기</p>

<form method="post" class="form-signin" action="findId" name="findform">
<div class="form-label-group">
			<label for="name">name</label>
			<input type="text" id="name" name="u_name" class="form-control"/>
		</div>
		
		<div class="form-label-group">
			<label for="phone">phone</label>
			<input type="text" id="phone" name="u_phone" class="form-control"/>
		</div>

		<div class="form-label-group" style="margin-top: 3%;">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase" style="background-color: black; color : white; "
				type="submit" value="check">
		</div>

		<!-- 이름과 전화번호가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.findform.name.value = "";
				opener.document.findform.phone.value = "";
			</script>
			<label style="font-size: 15px;">일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<c:if test="${check == 0 }">
		<label style="font-size: 15px;">찾으시는 아이디는' ${id}' 입니다.</label>
		<div class="form-label-group">
				<input class="btn btn-lg btn-secondary btn-block text-uppercase" style="background-color: black; color : white; "
					type="button" value="OK" onclick="closethewindow()">
			</div>
		</c:if>
</form>
</div>

<script type="text/javascript">
		function closethewindow(){
			location.href="/login/customLogin"
		}
	</script>


</body>
</html>


<%@ include file="../include/footer.jsp"%>