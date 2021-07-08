<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../include/header.jsp" %>



<link rel="stylesheet" type="text/css" href="/resources/css/QandA/list.css">


<body>
<div class="modify_all">
<div class="row">
		<h1 class="page-header" style="text-align: center;">Q&A 수정/삭제</h1>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form action="/shoppingmall/QandAl/modify" method="post" name="qandamodi">
					<div class="form-group">
						<label>글 번호</label>
						<input class="form-control" name="q_bno" value='<c:out value="${QandA.q_bno }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>글 제목</label>
						<input class="form-control" name="q_title" value='<c:out value="${QandA.q_title }"/>'>
					</div>
					<div class="form-group">
						<label>글 내용</label>
						<textarea class="form-control" name="q_content" rows="3" style="resize:none; height: 250px;"><c:out value= "${QandA.q_content }"/></textarea>
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control" name="u_id" value='<c:out value="${QandA.u_id }"/>' readonly="readonly">
					</div>
					
					<div class="buttonarea" style="margin-left: 85%;">
					   <button type="submit" data-oper="modify" class="btn btn-dark" onclick="modifyconfirm();">수정 확인</button>
					   <button type="submit" data-oper="remove" class="btn btn-dark">글 삭제</button>
					   <button type="submit" data-oper="list" class="btn btn-dark">목록</button>
				    </div>
				</form>
			</div>	
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
		
		if(operation === 'remove'){
			alert("글이 삭제되었습니다.");
			formObj.attr("action", "/shoppingmall/QandA/remove");
		}else if(operation === 'list'){
			formObj.attr("action", "/shoppingmall/QandA/list");
			formObj.attr("method", "get");

			formObj.empty();	
		}else if(operation === 'modify'){
			alert("수정이 완료되었습니다.");
			formObj.attr("action", "/shoppingmall/QandA/modify");
			formObj.attr("method", "post");
		}
		formObj.submit();
	});
});
</script>

<script type="text/javascript">
	function modifyconfirm(){
		var qaTitle = document.forms.qandamodi.q_title
		if(qaTitle.value == ''){
			alert("Q&A 제목을 입력해주세요.")
			qaTitle.focus();
			return false;
		}
		
		var qaContent = document.forms.qandamodi.q_content
		if(qaContent.value == ''){
			alert("Q&A 내용을 입력해주세요.")
			qaContent.focus();
			return false;
		}
	}
</script>

<%@ include file="../../include/footer.jsp" %>