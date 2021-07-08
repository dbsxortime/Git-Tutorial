<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/login/customLogin.css">



	<div class="wrap-div">
		 <p style="font-size: 30px; margin-left:20px;">LOGIN</p>
		<h2>
			<c:out value="${error }" />
		</h2>
	
		<h2>
			<c:out value="${logout}" />
		</h2>
		
		
		<div class="infoall">
        <div class="logininfo">
		<form role="form" method="post" action="/login">
			<fieldset>
				<div class="form-group">
					<input class="form-control" placeholder="userid" name="username"
						type="text" autofocus>
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="Password" name="password"
						type="password" value="">
				</div>
				<div class="checkbox">
					<label> <input name="remember-me" type="checkbox">아이디
						기억하기
					</label>
				</div>
				<!-- Change this to a button or input when using this as a form -->
				<button class="btn btn-lg btn-secondary btn-block text-uppercase" style="background-color: black; color : white; width:50%;">로그인</button>
                
                
				<!--  csrf 공격 방어를 위해 동적 생성 -->
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token }" />
			</fieldset>
		</form>
		</div>
		
		<div class="registerfindinfo">
		<form action="/login/register" method="get">
		    <p style="font-size: 30px;">JOIN</p>
		    <p style="font-size: 15px;">회원이 되어주세요</p>
			<button class="btn btn-lg btn-secondary btn-block text-uppercase" style="background-color: black; color : white; width:50%;">회원가입</button>
		</form>
		<br/>
		     <p style="font-size: 30px;">ID/PASSWORD</p>
		     <p style="font-size: 15px;">아이디와 비밀번호를 잃어버리셨나요?</p>
		     <p style="font-size: 15px;">간단한 정보입력으로 찾을 수 있습니다.</p>
		     
		     <form action="/login/findId" method="get">
		     <button class="btn btn-lg btn-secondary btn-block text-uppercase" style="background-color: black; color : white; width:50%;">아이디 찾기</button>
		     </form>
		     <br/>
		  
		     <form action="/login/findPassword" method="get">
		     <button class="btn btn-lg btn-secondary btn-block text-uppercase" style="background-color: black; color : white; width:50%; ">비밀번호 찾기</button>
		     </form>
		
		</div>
	</div>
	</div>
	<script type="text/javascript">
	    $(".btn-success").on("click", function(e){
	        e.preventDefault();
	        $("form").submit();
	    });
	</script>
<%@ include file="../include/footer.jsp"%>