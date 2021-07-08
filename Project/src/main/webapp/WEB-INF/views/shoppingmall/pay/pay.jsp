<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="../../include/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link rel="stylesheet" type="text/css" href="/resources/css/pay.css">	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
 <!-- pay body -->
<div class="pay_all">
	<p class="tit_img">주문/결제</p>
	<br />
<form action="/shoppingmall/pay/doorder" method="post">
	<div class="order_list">
		<p>주문/리스트</p>
		<hr />
		<table class="order_table">
			<thead>
				<tr>
					<td>번호</td>
					<td>사진</td>
					<td>제품명</td>
					<td>수량</td>
					<td>적립</td>
					<td>가격</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${cart }" varStatus="status">
					<tr>
						<!-- CartVO  -->
						<td>${status.count}</td>
						<td><img
							src="/resources/images/<c:out value="${list.p_image}"/>"
							id="p_image" /></td>
						<td><c:out value="${list.p_name}" /></td>
						<td><c:out value="${list.c_quantity}" /></td>
						<td><c:out value="${list.save}" />P</td>
						<td><c:out value="${list.p_price * list.c_quantity}" />원</td>
						</tr>
						<input type="hidden" value="${list.c_quantity}" name="op_quantity"/>
						<input type="hidden" value="${list.c_size}" name="op_size"/>
						<input type="hidden" value="${list.p_num}" name="p_num"/>
						<input type="hidden" value="${list.c_num}" name="c_num"/>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<br /> <br /> <br />


		<div class="userinfo">
			<p>주문자정보</p>
			<!-- UserVO to OrderVO -->
			<hr />
			<ul>
				<li>이름&nbsp;&nbsp;&nbsp;&nbsp; :  <input type="text" value="${user.o_name }"
					name="o_name" style="width:200px;" readonly="readonly" ></li>
				<li>이메일 : <input type="text" value="${user.o_email }"
					name="o_email" style="width:200px;" readonly="readonly" ></li>
				<li>연락처 : <input type="text" value="${user.o_phone }"
					name="o_phone" style="width:200px;" readonly="readonly" ></li>
			</ul>
		</div>

		<br /> <br />

		<div class="orderinfo">
			<p>배송 정보</p>
			<!-- UserVO to OrderVO  -->
			<hr/>
			<ul>
				<li >이름&nbsp;&nbsp;&nbsp;&nbsp; : <input type="text" value="${user.o_name }"
					name="d_name" style="width:200px;" readonly="readonly" ></li>
				<li >연락처 :  <input type="text" value="${user.o_phone }"
					name="d_phone" style="width:200px;" readonly="readonly"></li>
				<li >주소&nbsp;&nbsp;&nbsp;&nbsp; : <input type="text" value="${user.o_addr }"
					name="d_addr" style="width:200px;" readonly="readonly"></li>
				<!-- text area -->
				<li><div>주문메세지 :</div><textarea
						cols="40" rows="3" placeholder="메세지를 입력하세요" name="o_msg" style="resize:none;"></textarea></li>
			</ul>
		</div>
		
		<br /> <br /> <br />
		<div class="product_discount">
			<p>주문 상품 할인정보</p>
			<hr />
			
			<%@ include file="../../include/coupon_modal.jsp"%>
			<%@ include file="../../include/save_modal.jsp"%>
			
			<table class="product_order_discount">
				<tr>
					<td colspan='5'>상품금액</td>
					<td >배송비</td>
					<td style="color : #dc061a" >할인금액</td>
					<td >결제 예정금액</td>
				</tr>
				<tr>
					<td colspan='5'>
						<c:set var="pay" value="${pay}" />
						<input type="number" value="${pay }" readonly="readonly" name="o_pay" /> 원 <span>&nbsp;+&nbsp;</span>
					</td>
					<td>
						<c:set var="fee" value="${user.delievery_fee}" />
						<input type="number" value="${fee }" readonly="readonly" name="delievery_fee" /> 
						원 <span>&nbsp;-&nbsp;</span>
					</td>
					<td>
						<input type="hidden" value="0" name="couponed">
						<input type="hidden" value="0" name="couponed_num">
						<input type="hidden" value="0" name="saved">
						<input type="number" value="0" readonly="readonly" name="discount">원&nbsp;=&nbsp;
					</td>
					<td>
						<c:set var="total" value="${pay + fee}" />
						<input type="number" value="${total }" readonly="readonly" name="final_price" id="final"/>원
					</td>
				</tr>
			</table>
			<div class="buttonarea">
			<button type="button" id="couponBtn" class="btn btn-lg btn-secondary btn-block text-uppercase">쿠폰 조회</button>
			<button type="button" id="saveBtn" class="btn btn-lg btn-secondary btn-block text-uppercase">적립금 조회</button>
		</div>
		</div>

<script type="text/javascript">
	function usecoupon(cpu_num){
		$.ajax({
			type: "POST",
			url: "/shoppingmall/pay/checkcoupon",
			data:  {
				"cpu_num":cpu_num
			},
				success: function(result) {
					var coupon = Number(result);
					
					var discount = couponed + saved;
					document.getElementsByName("discount")[0].value = discount;
					
					var final_price =  o_pay + delievery_fee - discount;
					document.getElementsByName("final_price")[0].value = final_price;
					
					var o_pay = Number(document.getElementsByName("o_pay")[0].value);
					var delievery_fee = Number(document.getElementsByName("delievery_fee")[0].value);
					var couponed = Number(document.getElementsByName("couponed")[0].value);
					var saved = Number(document.getElementsByName("saved")[0].value);
					
					var discount = saved + couponed;
					var final_price =  o_pay + delievery_fee - discount;
					
					document.getElementsByName("couponed_num")[0].value = cpu_num;
					
					document.getElementsByName("couponed")[0].value = coupon;
					document.getElementsByName("discount")[0].value = discount;
					document.getElementsByName("final_price")[0].value = final_price;
					document.getElementsByName("final_price2")[0].value = final_price;
				},
				error:function(result){
					alert("failed");
				}
		});
	}
</script>
<script type="text/javascript">
	//coupon modal
	var coupon_modal = $(".coupon_modal");
	var couponInputBtn = $("#couponInputBtn");
	var couponCloseBtn = $("#couponCloseBtn");
	
	$("#couponBtn").click(function (e) {
		e.preventDefault();
		coupon_modal.modal("show");
	});
	
	$("#couponInputBtn").click(function (e) {
		e.preventDefault();
		coupon_modal.modal("hide");
	});
	
	$("#couponCloseBtn").click(function (e) {
		e.preventDefault();
		coupon_modal.modal("hide");
		usecoupon("cancel");
	});
	
	//save modal
	var save_modal = $(".save_modal");
	var saveInputBtn = $("#saveInputBtn");
	var saveCloseBtn = $("#saveCloseBtn");
	
	$("#saveBtn").click(function (e) {
		e.preventDefault();
		
		save_modal.modal("show");
	});
	
	$("#saveInputBtn").click(function (e) {
		e.preventDefault();
		
		var o_pay = Number(document.getElementsByName("o_pay")[0].value);
		var delievery_fee = Number(document.getElementsByName("delievery_fee")[0].value);
		var couponed = Number(document.getElementsByName("couponed")[0].value);
		var saved = Number(document.getElementsByName("saved")[0].value);
		
		var calcsave = Number(document.getElementsByName("calcsave")[0].value);
		var discount = couponed + calcsave;
		var final_price =  o_pay + delievery_fee - discount;
		
		document.getElementsByName("saved")[0].value = calcsave;
		document.getElementsByName("discount")[0].value = discount;
		document.getElementsByName("final_price")[0].value = final_price;
		document.getElementsByName("final_price2")[0].value = final_price;
		
		save_modal.modal("hide");
	});
	
	$("#saveCloseBtn").click(function (e) {
		e.preventDefault();
		save_modal.modal("hide");
	});
	
	


</script>
		<br /> <br /> <br />
	
		<div class="pay_info">
			<p>결제 정보</p>
			<hr />
			<table>
				<tr>
					<!-- <td colspan='2'><span>KG Inicis 에스크로</span> 고객님은 안전거래를 위해 현금으로
						결제하실 때 저희 쇼핑몰에 가입한 이니시스의 구매안전서비스를 이용할 수 있습니다.</td> -->
					<td colspan='2'>결제방법
					   
			
						<ul>
							<li><input type="radio" class="chk rdo1" name="o_option"
								checked="checked" value="무통장입금" required="required">무통장 입금</li>
							<li><input type="radio" class="chk rdo2" name="o_option" value="신용카드" required="required">신용카드</li>
							<li><input type="radio" class="chk rdo3" name="o_option" value="계좌이체" required="required">실시간
								계좌이체</li>
							<li><input type="radio" class="chk rdo4" name="o_option" value="에스크로" required="required">에스크로</li>
							<li><input type="radio" class="chk rdo5" name="o_option" value="휴대폰" required="required">휴대폰
								결제</li>
						</ul>
				             증빙신청
						<ul>
							<li><input type="radio" class="chk info1"
								name="chk information" required="required" checked="checked">신청안함</li>
							<li><input type="radio" class="chk info2"
								name="chk information" required="required">현금영수증</li>
						</ul>
					</td>
					
				</tr>
			</table>
		</div>
		<br/>
		
		<div class="agree">
			<p>주문자 동의</p>
		
			<hr />
			<ul>
				<li style="font-size: 12px;">청약철회 방침 :<br/> - 반품 및 교환은 상품수령일부터 7일 이내로만 가능합니다.<br /> - 고객님의
					사유로 상품의 멸실 및 훼손된 경우, 상품 고유의 포장이 훼손되어 상품가치가 상실된 경우 반품 불가합니다.<br />
					- 제품하자 및 판매자의 과실로 인한 오배송은 판매자 부담으로 교환이 이루어지며, 단순변심으로 인한 반품/교환은
					고객님께서 왕복 배송비를 부담하셔야 합니다.<br /><br/> <input type="radio" name="checkbok"
					value="동의합니다" required="required" checked="checked"><label>동의합니다</label> <input type="radio"
					name="checkbok" value="동의하지 않습니다." required="required"><label>동의하지 않습니다</label>
				</li>
				<li style="font-size: 12px;">주문동의 &nbsp; <input type="checkbox" name="user_agree" required="required">상기
					결제정보를 확인하였으며, 구매진행에 동의합니다
				</li>
			</ul >
		</div>

		<hr />
		<input type="hidden" name="total_save" value="${user.total_save }" />
		
		<p><strong>결제 금액</strong> :
		<input type="number" value="${total }" readonly="readonly" name="final_price2" id="final"/>
		원 / <strong>최종 적립 금액</strong> :
		${user.total_save }원</p>
		<hr />
		<div class="button-area">
			<button type="submit"id="doOrder" class="btn btn-lg btn-secondary btn-block text-uppercase"  >주문하기</button>
			<input type="button" value="취소하기" class="btn btn-lg btn-secondary btn-block text-uppercase" style="width:8%; margin-top: -1px; background-color: black; color : white;" onclick="ordercancel();" />
		</div>
	</form>
</div>

<script type="text/javascript">
function ordercancel(){
	alert("주문을 취소했습니다.");
	 window.location = "/shoppingmall/homepage";
}
</script>

<%@ include file="../../include/footer.jsp"%>