<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>


<div class="findPasswordAll" style="width : 300px; margin: auto; margin-bottom: 5%; ">
<p style="font-size: 15px;">비밀번호 찾기</p>

<form method="post" class="form-signin" action="findPassword"
	name="findform">
	<div class="form-label-group">
		<label for="id">ID</label> <input type="text" id="id" name="u_id"
			class="form-control" />
	</div>

	<div class="form-label-group">
		<label for="name">name</label> <input type="text" id="name"
			name="u_name" class="form-control" />
	</div>

	<div class="form-label-group">
		<label for="phone">phone</label> <input type="text" id="phone"
			name="u_phone" class="form-control" />
	</div>

	<div class="form-label-group" style="margin-top: 3%;">
		<input class="btn btn-lg btn-secondary btn-block text-uppercase"  style="background-color: black; color : white; "
			type="submit" value="check">
	</div>
</form>
<!-- 정보가 일치하지 않을 때-->
<c:if test="${check == 1}">
	<script>
		opener.document.findform.u_id.value = "";
		opener.document.findform.u_name.value = "";
		opener.document.findform.uphone.value = "";
	</script>
	<label style="font-size: 15px; color:#b60d1e">일치하는 정보가 존재하지 않습니다.</label>
</c:if>

<!-- 이름과 비밀번호가 일치하지 않을 때 -->
<c:if test="${check == 0 }">
	<div>
		<label style="font-size: 15px; color:#b60d1e">비밀번호를 변경해주세요.</label>
	</div>

	<form action="updatePassword" method="post" id="updatePassword">
		<div class="form-label-group">
			<input type="hidden" name="u_id" value="${id }">
			 <label	for="password">password</label> 
			 <input type="password" id="u_pw" name="updatePw" class="form-control" />
		</div>

		<div class="form-label-group">
			<label for="confirmpassword">confirm password</label> 
			<input type="password" id="confirmpwd" name="confirmpwd"
				class="form-control" />
		</div>

		<div class="form-label-group">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase" style="background-color: black; color : white; margin-top: 3%; "
				type="button" id="updatebutton"  value="update password">
		</div>
	</form>
</c:if>
</div>


<script type="text/javascript">
	$(function() {
		var formobj = $("#updatePassword");
	/* 	var u_pw = $("#u_pw");
		var confirmpwd = $("#confirmpassword"); */
		var regExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
		
			$("#updatebutton").click(function(e) {
				e.preventDefault();
	            var u_pw= document.getElementById("u_pw").value;
	            var confirmpwd= document.getElementById("confirmpwd").value;
	            if(u_pw===""){
					alert("비밀번호를 입력해주세요.");
					document.getElementById("u_pw").focus();
				} else if(u_pw != confirmpwd){
					alert("비밀번호가 일치하지 않습니다.");
					document.getElementById("confirmpwd").focus();
				} else {
					if(regExp.test(u_pw) == true) {
						alert('변경이 완료 되었습니다.')
						formobj.attr("action", "/login/updatePassword");
				        formobj.attr("method", "post");
						formobj.submit();
					}else {
						alert('8자-10자 사이의 대소문자, 숫자와 특수문자를 사용해 주세요');
						document.getElementById("u_pw").focus();
					}
					
					
					
				}
			});
	});
</script>


<%@ include file="../include/footer.jsp"%>