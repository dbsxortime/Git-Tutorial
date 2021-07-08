<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css" href="/resources/css/include/header.css">

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">


<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined"
	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>main</title>


</head>
<body>
	<!--header_container open  -->
	<div class="header_container width90">
		<!--header-1 시작  -->
		<div class="top_blank"></div>
		<div class="header_top">
			<div class="header_top_btnbox">
				<div class="top_box"></div>
				<div class="header_top_btn">
					<table>
						<tr>
							<td><a href="/shoppingmall/notice/list">
								<span class="material-icons-outlined">outlet</span>
								</a></td>
							<td><a href="/shoppingmall/cart/cart">
								<span class="material-icons-outlined">shopping_cart</span>
								</a></td>
							<td><a href="/shoppingmall/QandA/list">
							<span class="material-icons-outlined">help</span>
								</a></td>
							<td><a href="/shoppingmall/mypage/mypage">
								<span class="material-icons-outlined">person_add_alt_1</span>
								</a></td>
							<sec:authorize access="!isAuthenticated()">
								<td><a href="/login/customLogin">
									<span class="material-icons-outlined">login</span>
									</a></td>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<td><a href="/login/customLogout">
									<span class="material-icons-outlined">logout</span>
									</a></td>
							</sec:authorize>
						</tr>
						<tr>
							<td>
								<span>NOTICE</span>
							</td>
							<td>
								<span>CART</span>
							</td>
							<td>
								<span>Q&A</span>
							</td>
							<td>
								<span>MYPAGE</span>
							</td>
							<sec:authorize access="!isAuthenticated()">
								<td>
									<a href="/login/customLogin">
										<span>login</span></a>
								</td>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<td><a href="/login/customLogout">
									<span>logout</span></a>
								</td>
							</sec:authorize>
						</tr>
						
					</table>
				</div>
			</div>
			<div class="header_top_rogo">
				<h2>
					<a class="rogo" href="/shoppingmall/homepage">
						ROGO
					</a>
				</h2>
				<span style="font-size: 1.3em;">
					this is may be the rogo
				</span>
			</div>

			<div class="header_top_search top_line_height">
				<div class="top_box"></div>
				<div class="search_box">
					<form id="my_form" action="/shoppingmall/search/searchProduct" method="get">
						<input class="search_input" type="text" name="keyword"
							placeholder="검색어 입력"> <input type="hidden" name="price1"
							value="0"> 
						<input type="hidden" name="price2"
							value="99999999"> 
						<a onclick="document.getElementById('my_form').submit();">
							<img class="search_icon" src="https://image.flaticon.com/icons/png/128/1086/1086933.png"/>
						</a>
					</form>
				</div>
			</div>
		</div>
		
		<div class="check_user">
			<span> <sec:authorize access="!isAuthenticated()">
				비회원 
				</sec:authorize> <sec:authorize access="isAuthenticated()">
				${u_id } 
				</sec:authorize> 님 환영합니다!
			</span>
		</div>
	</div>	<!-- header_container close -->
	<div class="top_blank2"></div>
	<!-- category open -->
	<div class="first_category">
		<form id="form-ctg">
			<input type="hidden" value="ctg" id="p_ctg1" name="p_ctg1">
			<input type="hidden" value="ctg" id="p_ctg2" name="p_ctg2">
			<ul class="first_category1">
			
				<li class="dropdown">
					<div class="first_ctg">
						<a href="#" data-oper="best">추천</a>
					</div>
					<div class="dropbtn-content">
						<a href="#" class="second_ctg" data-oper="best_top">상의</a><br/>
						<a href="#" class="second_ctg" data-oper="best_bot">하의</a>
					</div></li>
					
				<li class="dropdown">
					<div class="first_ctg">
						<a href="#" data-oper="top">상의</a>
					</div>
					<div class="dropbtn-content">
						<a href="#" class="second_ctg" data-oper="top_hood">후드</a> <br/>
						<a href="#" class="second_ctg" data-oper="top_Tshirts">티셔츠</a><br/>
						<a href="#" class="second_ctg" data-oper="top_shirts">셔츠</a>
					</div></li>
	
				<li class="dropdown">
					<div class="first_ctg">
						<a href="#" data-oper="bot">하의</a>
					</div>
					<div class="dropbtn-content">
						<a href="#" class="second_ctg" data-oper="bot_denim">데님</a> <br/>
						<a href="#" class="second_ctg" data-oper="bot_pants">슬렉스</a>
					</div></li>
	
				<li class="dropdown">
					<div class="first_ctg">
						<a href="#" data-oper="outer">아우터</a>
					</div>
					<div class="dropbtn-content">
						<a href="#" class="second_ctg" data-oper="outer_coat">코트</a> <br/>
						<a href="#" class="second_ctg" data-oper="outer_padding">패딩</a>
					</div></li>
	
				<li class="dropdown">
					<div class="first_ctg">
						<a href="#" data-oper="etc">기타</a>
					</div>
					<div class="dropbtn-content ">
						<a href="#" class="second_ctg" data-oper="etc_cap">모자</a> <br/>
						<a href="#" class="second_ctg" data-oper="etc_shoes">신발</a>
					</div></li>
			</ul>
		</form>
	</div>
	<div class="bot_blank"></div>
	<!-- category close -->
<script type="text/javascript">
$(function(){
	var formObj = $("#form-ctg");
	
	$(".first_ctg a").click(function(e){	
		e.preventDefault(); 
		var operation = $(this).data("oper");
		document.getElementById("p_ctg1").value = operation;
		formObj.attr("action", "/shoppingmall/first_category/first_category");
		formObj.attr("method", "get");
		formObj.submit();
	});
	 
	$("a.second_ctg").click(function(e){	
		e.preventDefault(); 
		var operation = $(this).data("oper");
		var oper =  operation.split('_');
		document.getElementById("p_ctg1").value = oper[0];
		document.getElementById("p_ctg2").value = oper[1];
		formObj.attr("action", "/shoppingmall/second_category/second_category");
		formObj.attr("method", "get");
		formObj.submit();
	});
}); 
</script>