<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link rel="stylesheet" type="text/css"
	href="/resources/css/login/register.css">

<div id="content">
	<p class="tit_join">회원가입</p>
	<br />
	<br />

	<form action="/login/doRegister" method="post">
		<div id="registerInfo">
			<table class="table begin">
				<tbody>
					<tr>
						<th >아이디</th>
						<th><input type="text" name="u_id" onkeyup="checkU_id();" placeholder="아이디는 4자 이상 입력해 주세요." style="width:200px;"></th>
						<th><input type="hidden" id="check_id" value="0"
							readonly="readonly" style="width:250px;  border:none;" /></th>
					</tr>
					<tr>
						<th >비밀번호</th>
						<th><input type="password" name="u_pw" onkeyup="checkU_pw();" placeholder="8~16 대소문자, 숫자 및 특수문자" style="width:200px;"></th>
						<th><input type="hidden" id="check_pw" value="0"
							readonly="readonly" style="width:200px; border:none;" /></th>
					</tr>
					<tr>
						<th >비밀번호 확인</th>
						<th><input type="password" name="confirmpassword" onkeyup="confirmPassword();" placeholder="비밀번호를 다시 입력해주세요." style="width:200px;"></th>
						<th><input type="hidden" id="check_confirmpassword" value="0"
							readonly="readonly" style="width:200px; border:none;" /></th>
					</tr>
					<tr>
						<th>이름</th>
						<th><input type="text" name="u_name" onkeyup="checkU_name();" placeholder="ex)홍길동" style="width:200px;"></th>
						<th><input type="hidden" id="check_name" value="0"
							readonly="readonly" style="width:200px; border:none;" /></th>
					</tr>
					<tr>
						<th >주민등록번호</th>
						<th><input type="text" name="u_pid" onkeyup="checkU_pid();" placeholder="ex)123456-7890123" style="width:200px;"></th>
						
						<th><input type="hidden" id="check_pid" value="0"
							readonly="readonly" style="width:200px;border:none;" /></th>
					</tr>
					<tr>
						<th >주소</th>
						<th><input type="text" name="u_addr" onkeyup="checkU_addr();" placeholder="ex)서울 금천구 독산동" style="width:200px;"></th>
						<th><input type="hidden" id="check_addr" value="0"
							readonly="readonly" style="width:200px;  border:none;" /></th>
					</tr>
					<tr>
						<th >이메일</th>
						<th><input type="email" name="u_email"
							onkeyup="checkU_email();" placeholder="ex)hongildong@naver.com" style="width:200px;"></th>
						<th><input type="hidden" id="check_email" value="0"
							readonly="readonly" style="width:200px;  border:none;" /></th>
					</tr>
					<tr>
						<th >핸드폰번호</th>
						<th><input type="tel" name="u_phone"
							onkeyup="checkU_phone();" placeholder="01012345678" style="width:200px;"></th>
						<th><input type="hidden" id="check_phone" value="0"
							readonly="readonly" style="width:200px;  border:none;" /></th>
					</tr>
				</tbody>
			</table>

		</div>
		<br /> <input type="hidden" id="check_phone" value="0"
			readonly="readonly" /> <input type="button" id="register" class="btn btn-lg btn-secondary btn-block text-uppercase"
			onclick="doReg(this.form);" value="회원가입"/>
	</form>
</div>
<input type="hidden" id="confirmId" value="0" readonly="readonly" />
<input type="hidden" id="confirmPw" value="0" readonly="readonly" />
<input type="hidden" id="confirm_confirmPw" value="0" readonly="readonly" />
<input type="hidden" id="confirmName" value="0" readonly="readonly"/>
<input type="hidden" id="confirmPid" value="0" readonly="readonly" />
<input type="hidden" id="confirmAddr" value="0" readonly="readonly"/>
<input type="hidden" id="confirmEmail" value="0" readonly="readonly" />
<input type="hidden" id="confirmPhone" value="0" readonly="readonly" />
<script>

function checkU_id(){
   var u_id =  document.getElementsByName('u_id')[0].value;
   var checker = document.getElementById('check_id');
   var confirmId = document.getElementById('confirmId');
   
   if(u_id.length<4){
      checker.type='text';
      checker.value='아이디가 너무 짧습니다. 4자 이상입력해 주세요.';
      checker.style.color = 'red';
      confirmId.value=0;
   }else {
      $.ajax({
            type: "get",
           url: "/login/checkU_id", //url 설정
           data:  {
              "u_id" : u_id
         },
         success : function(result){
                if(result==0){
                   checker.type='text';
                   checker.value='사용가능한 아이디 입니다.';
                  
                   checker.style.color = 'blue';
                   confirmId.value=1;
                   
                
                }else {
                   checker.type='text';
                   checker.value='사용불가능한 아이디 입니다.';
                   
                   checker.style.color = 'red';
                   confirmId.value=0;
                }
            },
            error : function(result){
               alert(result)
            }
      });
   }
}

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

function confirmPassword(){
	var u_pw = document.getElementsByName('u_pw')[0].value;
	var confirmpassword = document.getElementsByName('confirmpassword')[0].value;
	var checker = document.getElementById('check_confirmpassword');
	var confirm_confirmPw = document.getElementById('confirm_confirmPw');
	
	
	if(confirmpassword === ""){
		checker.type='text';
		checker.value = '비밀번호를 입력해주세요.';
		checker.style.color = 'red';
	    confirm_confirmPw.value=0;
	}else if(u_pw === confirmpassword){
		checker.type='text';
		checker.value = '비밀번호가 일치합니다.';
		checker.style.color = 'blue';
		confirm_confirmPw.value = 1;
	}else {
		checker.type='text';
        checker.value='비밀번호가 일치하지않습니다.';
         checker.style.color = 'red';
         confirm_confirmPw.value=0;
	}
	
}


function checkU_name(){
	var u_name   = document.getElementsByName('u_name')[0].value;
	var checker = document.getElementById('check_name');
	var confirmName = document.getElementById('confirmName');
	
	if(u_name === ""){
		checker.type='text';
		checker.value = '이름을 입력해주세요.';
		checker.style.color = 'red';
		confirmName.value=0;
	}else{
		checker.type='hidden';
		confirmName.value=1;
	}
	
	
}

function checkU_pid(){
   var u_pid =  document.getElementsByName('u_pid')[0].value;
   var checker = document.getElementById('check_pid');
   var confirmPid = document.getElementById('confirmPid');
   
   var regExp = /^\d{6}-\d{7}$/;
   
   if (regExp.test(u_pid) == true) {
      $.ajax({
            type: "get",
           url: "/login/checkU_pid", //url 설정
           data:  {
              "u_pid" : u_pid
         },
         success : function(result){
                if(result==0){
                   checker.type='text';
                   checker.value='사용 가능한 주민등록번호 입니다.';
                   checker.style.color = 'blue';
                   confirmPid.value=1;
                }else {
                   checker.type='text';
                   checker.value='가입 되어있는 주민등록번호 입니다.';
                   checker.style.color = 'red';
                   confirmPid.value=0;
                }
            },
            error : function(result){
               alert(result)
            }
      });
   }else {
      checker.type='hidden';
      confirmPid.value=0;
   }
}

function checkU_phone(){
   var u_phone =  document.getElementsByName('u_phone')[0].value;
   var checker = document.getElementById('check_phone');
   var confirmPhone = document.getElementById('confirmPhone');
   
   var regExp = /^\d{11}$/;

   if (regExp.test(u_phone) == true) {
      $.ajax({
            type: "get",
           url: "/login/checkU_phone", //url 설정
           data:  {
              "u_phone" : u_phone
         },
         success : function(result){
                if(result==0){
                   checker.type='text';
                   checker.value='사용 가능한 번호 입니다.';
                   checker.style.color = 'blue';
                   confirmPhone.value=1;
                }else {
                   checker.type='text';
                   checker.value='가입 되어있는 번호 입니다.';
                   checker.style.color = 'red';
                   confirmPhone.value=0;
                }
            },
            error : function(result){
               alert(result)
            }
      });
   }else {
      checker.type='hidden';
      confirmPhone.value=0;
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

</script>
<script>
function doReg(f){
//    e.preventDefault();

   var formObj = $("form");
   var checkId = document.getElementById('confirmId').value;
   var checkPw = document.getElementById("confirmPw").value;
   var check_confirmPw = document.getElementById("confirm_confirmPw").value;
   var checkName = document.getElementById("confirmName").value;
   
   var checkPid = document.getElementById('confirmPid').value;
   var checkAddr = document.getElementById("confirmAddr").value;
   var checkPhone = document.getElementById('confirmPhone').value;
   var checkEmail = document.getElementById('confirmEmail').value;

   if(checkId!=1) {
      alert('아이디를 확인하세요.');
      $("input[name='u_id']").focus();
   }else if(checkId==1&&checkPw!=1){
	   alert('최소 8 자 및 최대 10 자, 하나 이상의 대문자, 하나의 소문자, 하나의 숫자 및 하나의 특수 문자를 입력해주세요.');
	   $("input[name='u_pw']").focus();
   }else if(checkId==1&&check_confirmPw!=1){
	   alert("비밀번호가 일치하지않습니다.");
	   $("input[name='confirmpassword']").focus();
   }
   else if(checkId==1&&checkPw==1&&checkName!=1){
	   alert('이름을 입력해주세요.');
	   $("input[name='u_name']").focus();
   }
   else if(checkId==1&&checkPid!=1){
      alert('주민등록번호를 확인하세요.');
      $("input[name='u_pid']").focus();
   }else if(checkId==1&&checkPid==1&&checkAddr!=1){
	   alert('주소를 입력해주세요.');
	   $("input[name='u_addr']").focus();
   }
   else if(checkId==1&&checkPid==1&&checkEmail!=1) {
      alert('이메일을 확인하세요.');
      $("input[name='u_email']").focus();
   }else if(checkId==1&&checkPid==1&&checkEmail==1&&checkPhone!=1) {
      alert('전화번호를 확인하세요.');
      $("input[name='u_phone']").focus();
   }else {
      alert('회원가입이 완료 되었습니다.');
      formObj.submit();
   }
};
</script>

<%@ include file="../include/footer.jsp"%>