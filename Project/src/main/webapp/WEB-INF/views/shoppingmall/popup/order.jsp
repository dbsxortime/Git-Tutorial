<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<style type="text/css">



li{
list-style: none;
}

body{
width : 600px;
font-family: 'Do Hyeon', sans-serif;
}




</style>


</head>
<body>

   <p>주문번호 : ${order.o_num }</p>
   
   <hr />
   
   <h3>결제정보</h3>
   <ul>
      <li>상품금액 : ${order.o_pay }원</li>
      <li>배송비 : ${order.delievery_fee }원</li>
      <li>할인금액 : ${order.discount }원</li>
      <li>총 결제액 : ${order.final_price }원</li>
   </ul>
   
   <hr />
   
   <h3>상품 정보</h3>
      <ul>
         <c:forEach var="pd" items="${product }" varStatus="status">
            <li><c:out value="${pd.p_name}" /></li>
         </c:forEach>
      </ul>
      
   <hr />
   
   <h3>배송 정보</h3>
   <ul>
      <li>배송현황 : ${order.delievery_status }</li>
      <li>수령인 : ${order.d_name }</li>
      <li>연락처 : ${order.d_phone }</li>
      <li>배송지 : ${order.d_addr }</li>
      <li>배송메모 : ${order.o_msg }</li>
   </ul>


   <input type="button"
   style="background-color: black; color : white;"
    value="창닫기" onclick="window.close()">

</body>
</html>