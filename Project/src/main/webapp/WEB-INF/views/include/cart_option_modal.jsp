<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link rel="stylesheet" type="text/css" href="/resources/css/include/cart_option_modal.css">	

<!-- Cart option Modal -->
<c:forEach var="list" items="${cart}">
	<div class="modal option_modal${list.c_num}" id='option_modal${list.c_num}' tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width:140%; text-align: center; float:center; margin: auto; height:200px; " >
				<table class="table begin" style="width:100%; text-align: center;"  >
					<tr style="border-bottom: 1px solid gray; float:center;">
						<td style="width:250px;">사진</td>
						<td >제품명</td>
						<td >수량</td>
						<td>사이즈</td>
						<td>가격</td>
						<td></td>
					</tr>
					<tr style="float:center;">
						<td onclick="goProduct(${list.p_num});">
						<img src="/resources/images/<c:out value="${list.p_image}"/>" id="p_image" style="width:35%;"  /></td>
						<td onclick="goProduct(${list.p_num});"><c:out value="${list.p_name}" /></td>
						<td >
							<input type="hidden" value="${list.p_num}" name="p_num" id="num${list.c_num}" />
							
							<input type="number" value="${list.c_quantity}" name='changequantity' id='qun${list.c_num}' min="1" style="width:35px;"/> 
						<td >
							<select name='changeoption' id='checksize${list.c_num}' class="option">
							</select>
						</td>
						
						<c:set var="price" value="${list.p_price * list.c_quantity}" />
						<c:set var="save" value="${price/100 }" />
						<td ><c:out value="${price}" />원</td>
						<td ><a
							href="/shoppingmall/cart/removeonecart?c_num=<c:out value='${list.c_num}'/>"><strong>삭제</strong></a>
						</td>
						<c:set var="total" value="${total + price}" />
					</tr>
				</table>
				
				<div class="button_area" style="postion : relative;">
				<input type="button" id="amount" value="수량 확정" class="btn btn-lg btn-secondary btn-block text-uppercase" onclick="updateoption(${list.c_num})">
				<input type="button" id="cancle" value="취소" onclick="closeBtn(${list.c_num});" class="btn btn-lg btn-secondary btn-block text-uppercase" style="margin-top: -2px;"/>
				</div>
				
			</div>
		</div>
	</div>
</c:forEach>