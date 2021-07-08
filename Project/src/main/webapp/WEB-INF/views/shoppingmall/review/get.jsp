<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp" %>


<link rel="stylesheet" type="text/css" href="/resources/css/review/review.css">



	<div class="total">
		<form>
			<div class="review"><b>리뷰 게시판</b></div>
			
			<div class="form-group">
				<label>글 번호</label>
				<input class="form-control" name="r_bno" value='<c:out value="${review.r_bno }"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>후기 이미지</label>
				<img src="/../resources/img/<c:out value="${review.p_image }"/>" style="width : 400px;">
			</div>
			<div class="form-group">
				<label>글 내용</label>
				<textarea class="form-control" name="r_content" rows="3" readonly="readonly"><c:out value="${review.r_content }"/></textarea>
			</div>
			<div class="form-group">
				<label>작성자</label>
				<input class="form-control" name="u_id" value='<c:out value="${review.u_id }"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>별점</label>
				<input class="form-control" name="r_score" value='<c:out value="${review.r_score }"/>' readonly="readonly">
			</div>
			<button data-oper="mod">후기 수정</button>
			<button data-oper="wri">후기 작성</button>
			<button data-oper="review">목록</button>
		</form>
		<form action="/shoppingmall/review/modify" method="get" id="operForm">
			<input id="r_bno" type="hidden" name="r_bno" value='<c:out value="${review.r_bno }"/>' />
		</form>
	</div>
</body>
<script type="text/javascript">
$(function(){
	var formObj = $("form");
	var operForm = $("#operForm");
	
	$("button").click(function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'mod'){
			formObj.attr("action", "/shoppingmall/review/modify")
			
		} else if(operation === 'wri'){
			formObj.attr("action", "/shoppingmall/review/register");
			formObj.attr("method", "get");
			
		} else if(operation === 'review'){
			operForm.find("#bno").remove();
			formObj.attr("action", "/shoppingmall/review/review");
			
		}
		
		formObj.submit();
	});
});
</script>
</html>
<%@ include file="../../include/footer.jsp" %>