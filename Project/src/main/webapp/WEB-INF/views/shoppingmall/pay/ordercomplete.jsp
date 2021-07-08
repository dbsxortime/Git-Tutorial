<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../../include/header.jsp"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<style>


.pro_order_complete{

width : 700px;
margin-left : 30%;
margin-bottom: 5%;
font-family: 'Do Hyeon', sans-serif;

}


.order_complete_table{
text-align: center;
font-size: 15px;
width : 500px;
}

.send_info_table{
text-align: center;
font-size: 15px;
width : 500px;
}

.post_info_table{
text-align: center;
font-size: 15px;
width : 500px;
}

.butt-area input{
background-color: black;
color : white;
}

h3{
font-size: 2.5em;
}


</style>





<div class="pro_order_complete">
	<h3>주문 목록</h3>
	<hr/>
	<table class= "order_complete_table">
		<tr>
			<th>번호</th>
			<th>상품 이름</th>
			<th>수량</th>
			<th>옵션</th>
		</tr>
		<c:forEach var="list" items="${cart }" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td><c:out value="${list.p_name}" /></td>
				<td><c:out value="${list.c_quantity}" /></td>
				<td><c:out value="${list.c_size}" /></td>
			</tr>
		</c:forEach>
	</table>
	<br/>

	<div class="sending_info">
		<h3>발송 정보</h3>
		<hr/>
		<table class = "send_info_table">
			<tr>
				<th>이름</th>
				<th>연락처</th>
			</tr>
			<tr>
				<td><c:out value="${order.o_name}" /></td>
				<td><c:out value="${order.o_phone}" /></td>
			</tr>
		</table>
	</div>
	<br/>
	<div class="reciever_info">
		<h3>배송 정보</h3>
		<hr/>
		<table class="post_info_table">
			<tr>
				<th>이름</th>
				<th>연락처</th>
				<th>주소</th>
				<th>주문메세지</th>
			</tr>

			<tr>
				<td><c:out value="${order.d_name}" /></td>
				<td><c:out value="${order.d_phone}" /></td>
				<td><c:out value="${order.d_addr}" /></td>
				<td><c:out value="${order.o_msg}" /></td>
			</tr>
		</table>
	</div>

	<div class="butt-area" style="margin-top: 50px;">
		<input type="button" value="확인" class="btn btn-lg btn-secondary btn-block text-uppercase" style="width : 10%;" onclick ='go_home();'/>
		<script type="text/javascript">
			function go_home() {
				location.href="/shoppingmall/homepage"
			}; 
		</script>
	</div>
</div>

<%@ include file="../../include/footer.jsp"%>