<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <%@ include file="../../include/header.jsp" %> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link rel="stylesheet" type="text/css" href="/resources/css/mycoupon.css">


<div class="coupon_all">
<div class="content_body">
<div class="plusmsg">
                <p>플러스 친구 할인쿠폰을 받으셨다면?</p>
                <a href='/shoppingmall/popup/registercoupon' target="new" onclick="openPop();" >쿠폰번호 등록하기</a>
             
                </div>
                
   
<div class="coupon_table">
     <table class="table begin">
			<thead>
				<tr>
					<th>쿠폰번호</th>
					<th>쿠폰이름</th>
					<th>사용가능금액</th>
					<th>할인액(률)/적립액(률)</th>
					<th>사용기간</th>
				</tr>
				
				<c:forEach var="list" items="${couponList }" varStatus="status">
						<tr>
							<td><c:out value="${status.count}" /></td>
							<td><c:out value="${list.cp_name}" /></td>
							<td><c:out value="${list.cp_possible}" /></td>
							<td><c:out value="${list.cp_discount}" /></td>
							<td><c:out value="${list.cpu_expire}" /></td>
						</tr>
					</c:forEach>
				
			</thead>
			<tbody>
			</tbody>

		</table>

</div>

</div>
</div>
<br/>
<br/>
<br/>


<script type="text/javascript">

function openPop(){
	var open = window.open('/shoppingmall/popup/registercoupon', "new", "scrollbars=no, resizable=no, width=500, height=300" );
}

</script>




<%@ include file="../../include/footer.jsp" %>


