
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
 <%@ include file="../../include/header.jsp" %> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <meta charset="utf-8">


<meta name="viewport" content="width=device-width, initial-scale=1"> -->

<link rel="stylesheet" type="text/css" href="/resources/css/first_category.css">

</head>
<body>


<!--body 시작  -->
<div class="total_sort clear">
    <div>
        <nav class="sort clear">
            <ul>
                <li ><a href="javascript:sendsort('order');">NEW</a></li>
                <li ><a href="javascript:sendsort('price2')">HIGHPRICE</a></li>
                <li ><a href="javascript:sendsort('price')">LOWPRICE</a></li>
                <li ><a href="javascript:sendsort('brandname')">NAME</a></li>
                <li ><a href="javascript:sendsort('sellcnt')">BEST</a></li>
            </ul>
        </nav>
    </div>
</div>

<div class="s-list">
	<c:forEach var="home" items="${list}" begin="0" end="5" step="1">
		<div class="s_imgT">
			<a href="/shoppingmall/product/product?p_num=${home.p_num }">
				<img src="/resources/images/<c:out value="${home.p_image}"/>" />	<br/>
				<span class="s-title">${home.p_name }</span> 	<br/>
				<span class="s-con">${home.p_content }</span>	<br/>
				<span class="s-price">${home.p_price }원</span>	<br/>
			</a>
		</div>
	</c:forEach>
</div>

<div class="md-t">
    <div class="md1"><span>MD RECOMMEND</span> </div>
    <div class="hr-sect">놓치면 아쉬운 MD 추천 아이템</div>
</div>

<div class="s-list">
	<c:forEach var="home" items="${list}" begin="6" step="1" varStatus="status">
		<div class="s_imgT">
			<a href="/shoppingmall/product/product?p_num=${home.p_num }">
				<img src="/resources/images/<c:out value="${home.p_image}"/>" />	<br/>
				<span class="s-title">${home.p_name }</span> 	<br/>
				<span class="s-con">${home.p_content }</span>	<br/>
				<span class="s-price">${home.p_price }</span>	<br/>
			</a>
		</div>
	</c:forEach>
</div>


<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
crossorigin="anonymous"></script>

 <%@ include file="../../include/footer.jsp" %>