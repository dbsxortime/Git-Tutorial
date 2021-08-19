<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">

	<div class="page-body">
		<div class="t_box">
			<p class="t_box_msg">
				"<strong>${u_id}</strong>"님! 루스코를 이용해주셔서 감사합니다.
			</p>
			<div class="page_list_top">
			    <button class="btn btn-lg btn-secondary btn-block text-uppercase" id="updateinfo" onclick="location.href='/shoppingmall/mypage/updateuser'">회원정보 수정</button>
				<button class="btn btn-lg btn-secondary btn-block text-uppercase" id="couponlist" onclick="location.href='/shoppingmall/mypage/mycoupon'">쿠폰내역</button>
				<button class="btn btn-lg btn-secondary btn-block text-uppercase" id="QandA" onclick="location.href='/shoppingmall/QandA/listWithUser'">Q&A</button>
				<button class="btn btn-lg btn-secondary btn-block text-uppercase" id="deleteinfo" onclick="location.href='/shoppingmall/mypage/userout'">회원탈퇴</button>
			</div>
		</div>
		
		
			<table class="table begin table_begin">
				<tr>
					<th>번호</th>
					<th>주문일자</th>
					<th>상품명</th>
					<th>결제금액</th>
					<th>주문상세</th>
					<th>배송현황</th>
				</tr>
				<c:forEach var="list" items="${myPageList }" varStatus="status">
					<tr>
						<td><c:out value="${list.o_num}" /></td>
						<td><fmt:formatDate value="${list.o_date}"
	 							pattern="yyyy-MM-dd" /></td> 
	 					<td><c:out value="${list.p_name}" /></td> 
	 					<td><c:out value="${list.total_price}" />원</td> 
	 					<td> 
		 					<button id="search" onclick="window.open('/shoppingmall/popup/order?o_num=${list.o_num}','childForm', 'width=600, height=600, resizable = no, scrollbars = no')"
							class="btn btn-lg btn-secondary btn-block text-uppercase">주문조회</button>
	 					</td> 
	 					<td><c:out value="${list.delievery_status}" /></td> 
	 				</tr> 
	 			</c:forEach>
			</table>


	</div>
	<div class="foot">
		<ul class="foot_msg">
			<li><strong>상품명 또는 주문상세의 조회 버튼을 클릭하시면, 주문상세 내역을 확인하실 수 있습니다.</strong></li>
		</ul>
	</div>

	<script type="text/javascript">
		
		
	</script>



	<%@ include file="../../include/footer.jsp"%>