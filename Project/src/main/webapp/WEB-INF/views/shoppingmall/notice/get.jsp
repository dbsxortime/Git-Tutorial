<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined"
	rel="stylesheet" >

<link rel="stylesheet" type="text/css" href="/resources/css/notice/list.css">

<body>
	<div class="total">
		<form>
		<div class="notice"><b>NOTICE</b></div>
		
		<div class="form-group">
			<label>글 번호</label>
			<input class="form-control" name="n_num" value='<c:out value="${notice.n_num }"/>' readonly="readonly">
		</div>
		<div class="form-group">
			<label>글 제목</label>
			<input class="form-control" name="n_title" value='<c:out value="${notice.n_title }"/>' readonly="readonly">
		</div>
		<div class="form-group">
			<label>글 내용</label>
			<textarea class="form-control" name="n_context" rows="3" readonly="readonly" style="resize:none; height: 250px;"><c:out value="${notice.n_context }"/></textarea>
		</div>
		<div class="form-group">
			<label>작성자</label>
			<input class="form-control" name="admin_id" value='<c:out value="${notice.admin_id }"/>' readonly="readonly">
		</div>
		
		<div class="buttonarea" style="margin-left: 87%;">
		<button data-oper="wri" class="btn btn-dark">글쓰기</button>
		<button data-oper="list" class="btn btn-dark">목록</button>
		<button data-oper="mod" class="btn btn-dark">수정</button>
        </div>
  
		</form>
		<form action="/board/modify" method="get" id="operForm">
			<input id="bno" type="hidden" name="n_num" value='<c:out value="${notice.n_num }"/>' />
		</form>
	</div>
	

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
$(function(){
	var formObj = $("form");
	var operForm = $("#operForm");
	
	$("button").click(function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'mod'){
			formObj.attr("action", "/shoppingmall/notice/modify");
			
		}else if(operation === 'wri'){
			formObj.attr("action", "/shoppingmall/notice/register");
			formObj.attr("method", "get");
			
		}else if(operation === 'list'){
			operForm.find("#bno").remove();
			formObj.attr("action", "/shoppingmall/notice/list");
			

		}
		
		// form 태그 전송(register or remove)
		formObj.submit();
	});
});


</script>



</html>
<%@ include file="../../include/footer.jsp" %>