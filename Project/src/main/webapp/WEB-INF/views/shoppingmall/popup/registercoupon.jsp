<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>

<div id="coupon_add" style="text-align: center;">
		<h1>쿠폰 번호 등록</h1>
		<span>지급 된 시리얼 번호를 입력하여 주세요.</span>
		<hr />

		<h2>쿠폰 번호 입력</h2>
				<input type="text" id="serial">
				<br/>
				<br/>
				<input type="button" value="쿠폰 등록" 
 				onclick="cuponregister();" style="background-color: black; color : white;">
 				<input type="button" value="닫기" 
 				onclick="cancel();" style="background-color: black; color : white;">
		<br /><br />
		<hr />
	</div>

<script type="text/javascript">
    	function cuponregister(){
			var serial = $("#serial").val();
	 
			if(confirm('작성된 쿠폰을 입력 하시겠습니까?')===true){
				
				$.ajax({
					type: "POST",
					url: "/shoppingmall/popup/registercoupon", //url 설정
					data:  {
						"serial" : serial
					},
					success: function(result) {
										
							alert("쿠폰이 등록되었습니다.")
							self.close();
							window.opener.location.href="/shoppingmall/mypage/mycoupon";
					},
					error:function(request,status,error){
							alert("쿠폰 번호를 다시 입력해주세요.")
					}
				});
				
			}else {
				alert('쿠폰 입력이 취소되었습니다.')
				self.close();
			}

	}
    	
 function cancel(){
	 alert("쿠폰 등록을 취소하였습니다");
	 window.close();
 }   	


</script>




</body>
</html>