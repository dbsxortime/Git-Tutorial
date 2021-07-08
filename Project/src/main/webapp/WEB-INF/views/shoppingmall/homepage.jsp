<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link rel="stylesheet" type="text/css" href="/resources/css/homepage.css">




</head>

<body>
   <!--slid 시작  --> 
   

<hr/>
   <div id="carouselExampleControls" class="carousel slide"
      data-bs-ride="carousel">
      <div class="carousel-inner">
         <div class="carousel-item active">
            <img src="/resources/images/1.jpg" class="d-block w-100 "
               alt="...">
         </div>
         <div class="carousel-item">
            <img src="/resources/images/2.jpg" class="d-block w-100 "
               alt="...">
         </div>
         <div class="carousel-item">
            <img src="/resources/images/3.jpg" class="d-block w-100"
               alt="...">
         </div>
      </div>
      <button class="carousel-control-prev" type="button"
         data-bs-target="#carouselExampleControls" data-bs-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
            class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button"
         data-bs-target="#carouselExampleControls" data-bs-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true"></span> <span
            class="visually-hidden">Next</span>
      </button>
   </div>
   <hr />
   <!--slid 끝 -->



   <!--body 시작  -->
<div class="body">
   <div class="body-d1">
         <table class="text-mini-t">
            <tr><td><span class="font1">COLLECTION</span> </td> </tr>
            <tr><td><span class="font2">내 맘에 쏙 드는 상품 모음</span> </td> </tr>
         </table>
   </div>
      

   
   <div class="s-list">
      <c:forEach var="home" items="${list}" begin="0" end="5" step="1" varStatus="status">
         <div class="s_imgT">
            <a href="/shoppingmall/product/product?p_num=${home.p_num }">
               <img src="/resources/images/<c:out value="${home.p_image}"/>" /> <br/>
               <span class="s-title">${home.p_name }</span>    <br/>
               <span class="s-con">${home.p_content }</span>   <br/>
               <span class="s-price">${home.p_price }원</span>   <br/>
            </a>
         </div>
      </c:forEach>
   </div>
   
   <div class="md-t">
         <div class="md1"><span>MD RECOMMEND</span> </div>
         <div class="hr-sect">놓치면 아쉬운 MD 추천 아이템</div>
   </div>
   
   <div class="s-list">
      <c:forEach var="home" items="${list}" begin="6" end="11" step="1" varStatus="status">
         <div class="s_imgT">
            <a href="/shoppingmall/product/product?p_num=${home.p_num }">
               <img src="/resources/images/<c:out value="${home.p_image}"/>" />   <br/>
               <span class="s-title">${home.p_name }</span>    <br/>
               <span class="s-con" >${home.p_content }</span>   <br/>
               <span class="s-price">${home.p_price }원</span>   <br/>
            </a>
         </div>
      </c:forEach>
   </div>
   
   

<div class="s-list">
   <c:forEach var="home" items="${list}" begin="12" step="1" varStatus="status">
      <div class="s_imgT">
         <a href="/shoppingmall/product/product?p_num=${home.p_num }">
            <img src="/resources/images/<c:out value="${home.p_image}"/>" />   <br/>
            <span class="s-title">${home.p_name }</span>    <br/>
            <span class="s-con" >${home.p_content }</span>   <br/>
            <span class="s-price">${home.p_price }원</span>   <br/>
         </a>
      </div>
   </c:forEach>
</div>
</div>

   <script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
   crossorigin="anonymous"></script>


 <%@ include file="../include/footer.jsp" %>