<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../include/header.jsp" %>


<link rel="stylesheet" type="text/css" href="/resources/css/QandA/register.css">

<div class="register_all">
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header" style="text-align: center;">게시글 수정/삭제</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form action="/shoppingmall/notice/modify" method="post" name="noticemodi">
					<div class="form-group">
						<label>글 번호</label>
						<input class="form-control" name="n_num" value='<c:out value="${notice.n_num }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>글 제목</label>
						<input class="form-control" name="n_title" value='<c:out value="${notice.n_title }"/>'>
					</div>
					<div class="form-group">
						<label>글 내용</label>
						<textarea class="form-control" name="n_context" style="resize:none; height: 250px;" rows="3"><c:out value="${notice.n_context }"/></textarea>
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control" name="admin_id" value='<c:out value="${notice.admin_id }"/>' readonly="readonly">
					</div> 
					<input type="hidden"  name="regDate" value='<c:out value="${notice.n_regdate }"/>' readonly="readonly">
					
					
					<div class="buttonarea" style="margin-left: 85%;">
					<button type="submit" data-oper="modify" class="btn btn-dark" onclick="modifyconfirm();">수정 확인</button>
					<button type="submit" data-oper="remove" class="btn btn-dark">글 삭제</button>
					<button type="submit" data-oper="list" class="btn btn-dark">목록</button>
					</div>
					
				</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
</div>

<script type="text/javascript">
	$(function(){
		var formObj = $("form");	
		
		$("button").click(function(e){	
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			if(operation === 'remove'){
				alert("글이 삭제되었습니다.");
				formObj.attr("action", "/shoppingmall/notice/remove");
			}else if(operation === 'list'){
				formObj.attr("action", "/shoppingmall/notice/list");
				formObj.attr("method", "get");

				formObj.empty();	
			}else if(operation === 'modify'){
				alert("수정이 완료되었습니다.");
				formObj.attr("action", "/shoppingmall/notice/modify");
				formObj.attr("method", "post");

			}
			
			formObj.submit();
		});
	});
</script>

<script>
	function modifyconfirm(){
		var notTitle = document.forms.noticemodi.n_title
		if(notTitle.value == ''){
			alert("공지사항 제목을 입력해주세요.")
			notTitle.focus();
			return false;
		}
		
		var notContext = document.forms.noticemodi.n_context
		if(notContext.value == ''){
			alert("공지사항 내용을 입력해주세요.")
			notContext.focus();
			return false;
		}
	}
</script>

<%@ include file="../../include/footer.jsp" %>