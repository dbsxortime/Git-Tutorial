<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <%@ include file="../../include/header.jsp" %> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="utf-8">    

<link rel="stylesheet" type="text/css" href="/resources/css/updateuser.css">


<div id="content">
 <p class="tit_join">회원정보 입력</p><br/><br/>



<form action="/shoppingmall/mypage/updateuser" name="form" method="post">
<div id="personInfo">
   <table class="table begin">
      <tbody>
          <tr>
						<th >이름</th>
						<th><input type="text" name="u_name" value="${user.u_name }" readonly="readonly"></th>
						<th></th>
					</tr>
					<tr>
						<th >아이디</th>
						<th><input type="text" name="u_id" value="${user.u_id }" readonly="readonly"></th>
						<th></th>
					</tr>
					<tr>
						<th >패스워드</th>
						<th><input type="password" name="u_pw" onkeyup="checkU_pw();" placeholder="8~16 대소문자, 숫자 및 특수문자"></th>
						<th><input type="hidden" id="check_pw" value="0"
							readonly="readonly" style="width:200px; text-align: center; border:none;" /></th>
						
						
					</tr>
					<tr>
						<th >주민등록번호</th>
						<th>
						<input type="text" name="pid1" value="${user.pid1 }" readonly="readonly" style="width:90px;">&nbsp;-&nbsp;
						<input type="password" name="pid2" value="${user.pid2 }" readonly="readonly" style="width:95px;"/>
						</th>
						<th></th>
						
					</tr>
					<tr>
						<th >주소</th>
						<th><input type="text" name="u_addr" value="${user.u_addr}"  onkeyup="checkU_addr();"/></th>
						<th><input type="hidden" id="check_addr" value="0"
							readonly="readonly" style="width:200px; text-align: center; border:none;" /></th>
					</tr>
					<tr>
						<th >휴대폰 번호</th>
						<th><input type="text" name="u_phone" value="${user.u_phone }" readonly="readonly"></th>
						<th></th>
					</tr>
					<tr>
						<th >이메일</th>
						<th><input type="email" name="u_email" value="${user.u_email}" onkeyup="checkU_email();"/></th>
						<th><input type="hidden" id="check_email" value="0"
							readonly="readonly" style="width:200px; text-align: center; border:none;"/></th>
					</tr>
                 
      
      </tbody>
   
   
    
   </table>

</div>

<input type="hidden" id="confirmPw" value="0" readonly="readonly" />
<input type="hidden" id="confirmAddr" value="1" readonly="readonly"/>
<input type="hidden" id="confirmEmail" value="1" readonly="readonly" />



<div class="btn_area" style="margin-left: 45%; margin-bottom: 5%;">

			<input type="button" class="btn btn-lg btn-secondary btn-block text-uppercase"  value="회원가입 수정" style="background-color: black; color : white; width:15%; margin-top: 5px;  font-size: 12px;" onclick="doReg(this.form);"/> 
			<input type="button" class="btn btn-lg btn-secondary btn-block text-uppercase"  value="취소하기" style="background-color: black; color : white; width:15%; font-size: 12px;" onclick="cancel()">
		</div>



</form>
</div>


<script>


function checkU_pw(){
	
	var u_pw = document.getElementsByName('u_pw')[0].value;
	var checker = document.getElementById('check_pw');
	var confirmPw = document.getElementById('confirmPw');
	
	var regExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
	
	if(regExp.test(u_pw) == true) {
          
                   checker.type='text';
                   checker.value='사용 가능한 비밀번호 입니다.';
                   checker.style.color = 'blue';
                   confirmPw.value=1;
		
                }else{
                	checker.type='text';
                      checker.value='사용 불가능한 비밀번호 입니다.';
                       checker.style.color = 'red';
                        confirmPw.value=0;
                }

}

function checkU_addr(){
	var u_addr   = document.getElementsByName('u_addr')[0].value;
	var checker = document.getElementById('check_addr');
	var confirmAddr = document.getElementById('confirmAddr');
	
	if(u_addr === ""){
		checker.type='text';
		checker.value = '주소를 입력해주세요.'
		checker.style.color = 'red';
		confirmAddr.value=0;
	}else{
		checker.type='hidden';
		confirmAddr.value=1;
	}
}


function checkU_email(){
	   var u_email =  document.getElementsByName('u_email')[0].value;
	   var checker = document.getElementById('check_email');
	   var confirmEmail = document.getElementById('confirmEmail');
	   
	   var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	   
	   
	   if (regExp.test(u_email) == true) { 
	         $.ajax({
	               type: "get",
	              url: "/login/checkU_email", //url 설정
	              data:  {
	                 "u_email" : u_email
	            },
	            success : function(result){
	                   if(result==0){
	                      checker.type='text';
	                      checker.value='사용 가능한 메일 입니다.';
	                      checker.style.color = 'blue';
	                      confirmEmail.value=1;
	                   }else {
	                      checker.type='text';
	                      checker.value='가입 되어있는 메일 입니다.';
	                      checker.style.color = 'red';
	                      confirmEmail.value=0;
	                   }
	               },
	               error : function(result){
	                  alert(result)
	               }
	         });
	   } else { 
	      checker.type='text';
	      checker.value='올바른 이메일 양식을 입력해 주세요';
	      checker.style.color = 'red';
	      confirmEmail.value=0;
	   }
	}


function doReg(f){
	
	 var formObj = $("form");
	 var checkPw = document.getElementById("confirmPw").value;
	 var checkAddr = document.getElementById("confirmAddr").value;
	 var checkEmail = document.getElementById('confirmEmail').value;
	 
	 if(checkPw!=1){
		   alert('최소 8 자 및 최대 10 자, 하나 이상의 대문자, 하나의 소문자, 하나의 숫자 및 하나의 특수 문자를 입력해주세요.');
		   $("input[name='u_pw']").focus();
	 }else if(checkAddr!=1){
		 alert('주소를 확인하세요.');
		   $("input[name='u_addr']").focus();
	 }else if(checkEmail!=1){
		 alert('이메일을 확인하세요.');
	      $("input[name='u_email']").focus();
	 }else{
		 alert('수정이 완료되었습니다.');
	      formObj.submit();
	 }
	

};

</script>

<script>
function cancel(){
	alert("회원수정이 취소되었습니다");
	window.location.href="/shoppingmall/mypage/mypage";
}


</script>


<%@ include file="../../include/footer.jsp" %>


