<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 수정-삭제 화면</title>
</head>
<body>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">후기 수정-삭제 화면</h1>
	</div>
</div>

<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">리뷰 수정-삭제 화면</div>
		<div class="panel-body">
			<form action="/shoppingmall/review/review" method="post">
				<div class="form-group">
					<label>글 번호</label>
					<input class="form-control" name="r_bno" value='<c:out value="${review.r_bno }"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>후기 이미지</label>
					<input type="file" name="p_image" value='<c:out value="${review.p_image}"/>'>
				</div>
				<div class="form-group">
					<label>글 내용</label>
					<textarea class="form-control" name="r_content" rows="3"><c:out value="${review.p_image }"/></textarea>
				</div>
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="u_id" value='<c:out value="${review.u_id }"/>' readonly="readonly">	
				</div>
				<div class="form-group">
					<label>별점</label>
					<select name="star rating">
								<option value="5">★★★★★</option>
								<option value="4">★★★★☆</option>
								<option value="3">★★★☆☆</option>
								<option value="2">★★☆☆☆</option>
								<option value="1">★☆☆☆☆</option>
					</select>
				</div>
				<div>
				<button type="submit" data-oper="modify">후기 수정</button>
				<button type="submit" data-oper="remove">후기 삭제</button>
				<button type="submit" data-oper="review">후기 목록</button>	
				</div>
			</form>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
$(function(){
	var formObj = $("form");
	
	$("button").click(function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'remove'){
			formObj.attr("action", "/shoppingmall/review/remove");
			
		} else if (operation === 'list'){
			formObj.attr("action", "/shoppingmall/review/review");
			formObj.attr("method", "get");
			
			formObj.empty();
		} else if (operation === 'modify'){
			formObj.attr("action", "/shoppingmall/review/modify");
			formObj.attr("method", "post");
		}
		formObj.submit();
	});
});
</script>
</html>
<%@ include file="../../include/footer.jsp" %>