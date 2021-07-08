<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp"%>


</head>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="/resources/css/search/searchNotice.css">

<body>
	<div class="total">
		<div class="notice">
			<b>NOTICE</b>
		</div>
		<form method="get">
			<div class="row">
				<div class="col-md-8 ">
					<button data-oper="wrig" type="button" style="background-color : black; color : white; width : 10%;">글쓰기</button>
				</div>
				<div class="col-md-4 " style="text-align: right;">
					<input class="form-check-input" type="radio" value="title"
						name="option" checked="checked">제목 <input
						class="form-check-input" type="radio" value="n_context"
						name="option">내용 <input type="text" name="keyword">
					<button type="submit" data-oper="search" style="background-color : black; color : white; width : 10%;">검색</button>
				</div>
			</div>
		</form>
		<table class="table">
			<tr>
				<th>No.</th>
				<th>Title</th>
				<th>Name</th>
				<th>Date</th>
			</tr>
			<c:forEach var="search" items="${result}">
				<tr>
					<td><c:out value="${search.n_num }" /></td>
					<td style="text-align: center;"><a class="move" href='<c:out value="${search.n_num}"/>' style="text-decoration: none; color:black;">
								<c:out value="${search.n_title }"/>'
							</a></td>
					<td><c:out value="${search.admin_id }" /></td>
					<td><fmt:formatDate value="${search.n_regdate }" /></td>
				</tr>
			</c:forEach>
		</table>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
	$(function() {
		var formObj = $("form");

		$("button").click(function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");

			if (operation === 'wrig') {
				formObj.attr("action", "/shoppingmall/notice/register");
				formObj.attr("method", "get");
				formObj.submit();
			} else if (operation === 'search') {
				formObj.attr("action", "/shoppingmall/search/searchNotice");
				formObj.attr("method", "get");
				formObj.submit();
			}
		});

		//----------------- 알림 이벤트 코드-------------------
		// 결과창 출력을 위한 코드
		var result = '<c:out value="${result}"/>';

		// rttr 객체를 통해 받아온 값이 빈 값이 아닐 때(데이터 변경) 알림 메소드 실행
		if (result != '') {
			checkResult(result);
		}
		// 뒤로가기 할 때 문제가 될 수 있으므로
		// history  객체를 조작({정보를 담은 객체}, 뒤로가기 버튼 문자열 형태의 제목, 바꿀 url)
		history.replaceState({}, null, null);

		function checkResult(result) {
			if (result === '' || history.state) { // 뒤로가기 방지
				return;
			}
			if (result === 'success') { // 수정 및 삭제
				alert("처리가 완료되었습니다.");
				return;
			}
			if (parseInt(result) > 0) { // 삽입
				alert("게시글 " + parseInt(result) + "번이 등록되었습니다.");
			}
		}

		//----------------- 조회 화면 이동 이벤트 코드-------------------
		$(".move")
				.click(
						function(e) {
							e.preventDefault();

							// <form> 에 추가
							var value = $(this).attr("href");

							formObj
									.append("<input type='hidden' name='n_num' value='" + value + "'>");
							formObj.attr("action", "/shoppingmall/notice/get");
							formObj.submit();
						});

	});
</script>
</html>
<%@ include file="../../include/footer.jsp"%>

</html>
<%@ include file="../../include/footer.jsp"%>