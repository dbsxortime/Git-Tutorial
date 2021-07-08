<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp"%>



    <link rel="stylesheet" type="text/css" href="/resources/css/search/searchProduct.css">
   

	<div class="search-detail">
		<%-- <span>-검색어 : ${keyword }</span> --%>

	<form action="/shoppingmall/search/searchProduct" method="get">

		<table class="searchtable">
			<tr>
				<td>가격대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   <input type="number" name="price1" style="">&nbsp;-&nbsp;<input
					type="number" name="price2"><br/><br/></td>
				
				</tr>
				
				<tr>	
				<td>제품명/키워드 <input type="text" name="keyword"> <input type="submit" value="search" id="searchbutt" class="btn btn-lg btn-secondary btn-block text-uppercase"></td>
				</tr>
			
		</table>
	
		<!-- <span>keyword</span>
		<input type="text" name="keyword"><br/>
		<span>price1</span>
		<input type="number" name="price1"><br/>
		<span>price2</span>
		<input type="number" name="price2"><br/>
		<input type="submit" value="search"> -->
	</form>
    	</div>
    	
  <div class="s-list">
      <c:forEach var="select" items="${result}">
      <input type="hidden" value='<c:out value="${select.p_num }"/>'/>
         <div class="s_imgT">
            <a href="/shoppingmall/product/product?p_num=<c:out value="${select.p_num }"/>">
			         <img src="/../resources/images/<c:out value="${select.p_image }"/>"><br/>
               <span class="s-title"><c:out value="${select.p_name }"/></span>    <br/>
               <span class="s-con"> <c:out value="${select.p_content }"/></span>   <br/>
               <span class="s-price">  <c:out value="${select.p_price }"/>원</span>   <br/>
            </a>
         </div>
      </c:forEach>
   </div>

<%@ include file="../../include/footer.jsp"%>
