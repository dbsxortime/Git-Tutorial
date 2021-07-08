<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="../../include/header.jsp" %>

<link rel="stylesheet" type="text/css" href="/resources/css/QandA/list.css">


	<div class="total">
		<form>
		<div class="QandA"><b>Q&A 게시판</b></div>
		
		<div class="form-group">
			<label>글 번호</label>
			<input class="form-control" name="q_bno" id="bno" value='<c:out value="${QandA.q_bno }"/>' readonly="readonly">
		</div>
		<div class="form-group">
			<label>글 제목</label>
			<input class="form-control" name="q_title" value='<c:out value="${QandA.q_title }"/>' readonly="readonly">
		</div>
		<div class="form-group">
			<label>글 내용</label>
			<textarea class="form-control" name="q_content" rows="3" readonly="readonly" style="resize:none;"><c:out value="${QandA.q_content }"/></textarea>
		</div>
		<div class="form-group">
			<label>작성자</label>
			<input class="form-control" name="u_id" value='<c:out value="${QandA.u_id  }"/>' readonly="readonly">
		</div>
		<div class="form-group">
			<label>답변</label>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<input class="form-control" name="answer" value='<c:out value="${QandA.answer  }"/>' readonly="readonly"
				id="answer" onclick="doAnswer();">
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_USER')">
				<input class="form-control" value='<c:out value="${QandA.answer  }"/>' readonly="readonly">
			</sec:authorize>
			<sec:authorize access="!isAuthenticated()">
				<input class="form-control" value='<c:out value="${QandA.answer  }"/>' readonly="readonly">
			</sec:authorize>
		</div>
		<script>
			function doAnswer(){
				var answer = document.getElementById("answer");
					if(answer.readOnly){
						answer.readOnly = false;
					}else {
						answer.readOnly = true;
					
					$.ajax({
			 			type: "POST",
			             url: "/shoppingmall/QandA/Answer",
			             data:  {
			            	 "answer" : answer.value,
			            	 "q_bno" : document.getElementById("bno").value
						},
			 		});
					alert('수정완료');
				}
			}
		</script>
		
		<div class="buttonarea" style="margin-left: 87%;">
		<button data-oper="wri" class="btn btn-dark">글쓰기</button>
		<button data-oper="list" class="btn btn-dark">목록</button>
		<button data-oper="mod" class="btn btn-dark">수정</button>
        </div>

		</form>
		<form action="/shoppingmall/QandA/modify" method="get" id="operForm">
			<input id="q_bno" type="hidden" name="q_bno" value='<c:out value="${QandA.q_bno }"/>' />
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
			formObj.attr("action", "/shoppingmall/QandA/modify")
			
		} else if(operation === 'wri'){
			formObj.attr("action", "/shoppingmall/QandA/register");
			formObj.attr("method", "get");
			
		} else if(operation === 'list'){
			operForm.find("#bno").remove();
			formObj.attr("action", "/shoppingmall/QandA/list");
		}
		
		// form 태그 전송(register or remove)
		formObj.submit();
	});
});
</script>
</html>
<%@ include file="../../include/footer.jsp" %>