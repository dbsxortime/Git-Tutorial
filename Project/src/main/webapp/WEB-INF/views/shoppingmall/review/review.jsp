<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp" %>

<link rel="stylesheet" type="text/css" href="/resources/css/review/review.css">

	<div class="total">
		<h3 align="center">루스코 후기페이지 입니다.</h3>
		<div>
			<table class="reviewtable">
				<tr class="bg">
					<th scope="row">
						<div class="tb-center">분류별 선택</div>
					</th>
					<td>
						<div class = "tb-left">
							<select name="ctg1">
								<option disabled="disabled">대분류 선택</option>
								<option value="ctg1-1">ctg1-1</option>
								<option value="ctg1-2">ctg1-2</option>
							</select>
							<select name="ctg2">
								<option disabled="disabled">중분류 선택</option>
								<option value="ctg2-1">ctg2-1</option>
								<option value="ctg2-2">ctg2-2</option>
							</select>
							<select name="product">
								<option disabled="disabled"> 상품 선택 </option>
								<option value="product1">product1</option>
								<option value="product2">product2</option>
							</select>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<form>
			<div class="row">
				<div class="col-md-8"><button data-oper="wrig" type="button">후기쓰기</button></div>
				<div class="col-md-4 " style="text-align: left;">
				상품명 검색
				<input type="search" ><input type="button" value="검색" onclick="">
				</div>
				
				
				<table class = "table">
					<tr>
						<th>번호</th>
						<th>이미지</th>
						<th>내용</th>
						<th>작성자</th>
						<th>별점</th>
					</tr>
					<c:forEach var="review" items="${list }">
					<tr>
						<td>
							<c:out value="${review.r_bno }"></c:out>
						</td>
						<td>
							<img src="/../resources/img/<c:out value="${review.p_image }"/>" style="width : 400px;">
						</td>
						<td>
							<c:out value="${review.r_content }"></c:out>
						</td>
						<td>
							<c:out value="${review.u_id }"></c:out>
						</td>
						<td>
							<c:out value="${review.r_score }"></c:out>
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</form>
	</div>
<script type="text/javascript">
$(function(){
	var formObj = $("form");
	
	$("button").click(function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'wrig'){
			formObj.attr("action", "/shoppingmall/review/register");
			formObj.attr("method", "get");
			formObj.submit();
		}
		
	});
	
	$(".move").click(function(e){
		e.preventDefault();
		
		// <form> 에 추가
		var value = $(this).attr("href");
		
		formObj.append("<input type='hidden' name='n_num' value='" + value + "'>");
		formObj.attr("action", "/shoppingmall/review/get");
		formObj.submit();
	});
	
})
</script>


<%@ include file="../../include/footer.jsp" %>