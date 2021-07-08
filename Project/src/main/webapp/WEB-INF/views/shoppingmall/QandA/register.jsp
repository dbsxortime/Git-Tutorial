<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp"%>


<link rel="stylesheet" type="text/css"
	href="/resources/css/QandA/list.css">


<div class="register_all" style="margin-bottom: 5%;">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">게시글 등록</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<!--  /.panel-heading -->
				<div class="panel-body">
					<form action="/shoppingmall/QandA/register" method="post"
						role="form" name="qandaform">
						비밀글 설정 <input type="checkbox" name="issecret" id="isselect"
							value="0" />
						<div class="form-group">
							<label>제목</label> <input class="form-control" name="q_title" required="required">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name="q_content" required="required"
								style="resize: none; height: 250px;"></textarea>
						</div>
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name="u_id"
								value="${u_id }" readonly="readonly">
						</div>


						<div class="buttonarea" style="margin-left: 93%;">
							<button type="button" data-oper="register" class="btn btn-dark"
								onclick="qandaregister();">등록</button>
							<button type="button" data-oper="list" class="btn btn-dark">목록</button>
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
			
			if(operation === 'register'){
				alert("등록이 완료되었습니다.");
				formObj.attr("action", "/shoppingmall/QandA/register");
				
			}else if(operation === 'list'){
				
				formObj.attr("action", "/shoppingmall/QandA/list");
				formObj.attr("method", "get");
				
				formObj.empty();
			}
			
			formObj.submit();
		});
	});

		
	</script>
<script>
	
	
	$("input:checkbox[name='issecret']").click(function(){
		
		var checker = document.getElementById('isselect');
		
		if(checker.value==0){
			$("issecret").attr("checked",false);
			checker.value= 1;
			alert("비밀 글 설정 되었습니다.")
			
		}else{
			$("issecret").attr("checked",true);
			checker.value= 0;
			alert("비밀 글 해제 되었습니다.")
		}
	});
	
		</script>


<%@ include file="../../include/footer.jsp"%>