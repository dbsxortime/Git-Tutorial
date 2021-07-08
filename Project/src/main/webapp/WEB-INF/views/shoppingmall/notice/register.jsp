<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../include/header.jsp" %>


<link rel="stylesheet" type="text/css" href="/resources/css/QandA/register.css">

<div class="register_all">
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시글 등록</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">게시글 등록</div>
			<div class="panel-body">
				<form action="/shoppingmall/notice/register" method="post" role="form" name="noticeform">
					<div class="form-group">
						<label>제목</label>
						<input type="text" class="form-control" name="n_title" >
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea  class="form-control" rows="3" name="n_context" style="resize: none; height: 250px;" required></textarea>
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control" name="admin_id" value="관리자" readonly = "readonly"/>
					</div>
					
					 <div class="buttonarea" style="margin-left: 93%">
					   <button type="submit" data-oper="register" class="btn btn-dark">등록</button>
					   <button type="submit" data-oper="list" class="btn btn-dark">목록</button>
                    </div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>

<script type="text/javascript">	
	$(function(){
			
		var formObj = $("form");	
			
		$("button").click(function(e){	
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			if(operation === 'register'){
				alert("등록이 완료되었습니다.");
				formObj.attr("action", "/shoppingmall/notice/register");
					
			}else if(operation === 'list'){
					
				formObj.attr("action", "/shoppingmall/notice/list");
				formObj.attr("method", "get");
					
					
				formObj.empty();	
			}
				
			formObj.submit();
		});
	});
</script>
	



<%@ include file="../../include/footer.jsp" %>