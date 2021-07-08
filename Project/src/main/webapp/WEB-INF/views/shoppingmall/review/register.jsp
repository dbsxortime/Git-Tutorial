<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp" %>



	<h1>register 페이지</h1>
	<div class="row">
		<div class ="col-lg-12">
			<h1 class="page-header">후기 등록</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">후기 등록</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<form action="/shoppingmall/review/review" method="post" role="form">
						<div class="form-group">
							<label>아이디</label>
							<input class="form-control" name="u_id">
						</div>
						<div class="form-group">
							<label>제목</label>
							<input class="form-control" name="u_id">
						</div>
						<div class="form-group">
							<label>제품 후기</label>
							<textarea class="form-control" rows="3" name="r_content"></textarea>
						</div>
						<div class="form-group">
							<label>첨부파일</label>
							<img src="/../resources/img/<c:out value="${review.p_image }"/>" style="width : 400px;">
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
						<button type="button" data-oper="register" class="btn btn-primary">등록</button>
						<button type="button" data-oper="review" class="btn btn-warning">목록</button>
					</form>
				</div>
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
			
			if(operation === 'register'){
				
				formObj.attr("action", "/shoppingmall/review/register");
				
			}else if(operation === 'review'){
				
				formObj.attr("action", "/shoppingmall/review/review");
				formObj.attr("method", "get");
				
				formObj.empty();
			}
			
			formObj.submit();
		});
	});
</script>
</html>
<%@ include file="../../include/footer.jsp" %>