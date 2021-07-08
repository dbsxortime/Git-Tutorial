<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp" %> 



<link rel="stylesheet" type="text/css" href="/resources/css/myQ&A.css">

   <div class="total">
      <div class="QandA"><b>QandA</b></div>
      <form>
         <div class = "row">
            <div class="col-md-8 "><button data-oper="wrig" type="button" style="width : 10%; background-color: black; color:white;">글쓰기</button></div>
            <div class="col-md-4">
               <input class="form-check-input" type="radio" value="1" name="sel">이름
               <input class="form-check-input" type="radio" value="2" name="sel">제목
               <input class="form-check-input" type="radio" value="3" name="sel">내용
               <input type="search"><input type="button" value="검색" onclick="" style="margin-left: 1%; width : 10%; background-color: black; color:white;">
            </div>
         </div>
         
         <table class = "table">
            <tr>
               <th>No.</th>
               <th>Title</th>
               <th>Writer</th>
               <th >date</th>
            </tr>
            <c:forEach var="QA" items="${list }">
            <tr>
               <td ><c:out value="${QA.q_bno }"></c:out> </td>
               <c:choose>
                  <c:when test="${QA.answer == null}">
                     <td style="text-align: center;">
                        <a class="QA" href='/shoppingmall/QandA/get?q_bno=<c:out value="${QA.q_bno}"/>'>
                           <c:out value="${QA.q_title }"/>
                        </a>
                     </td>
                  </c:when>
                  
                  <c:otherwise>
                     <td style="text-align: center;">
                        <a class="QA" href='/shoppingmall/QandA/get?q_bno=<c:out value="${QA.q_bno}"/>'>
                           <c:out value="${QA.q_title }"/>
                           &nbsp;&nbsp;&nbsp; 
                           <span style="color:#999">
                              (답변완료)
                           </span>
                        </a>
                     </td>
                  </c:otherwise>
               </c:choose>
               <td ><c:out value="${QA.u_id }"></c:out> </td>
               <td><fmt:formatDate value="${QA.q_regdate }"/></td>
            </tr>
            </c:forEach>
         </table>
      </form>
   </div>
</body>
<script type="text/javascript">
$(function(){
   var formObj = $("form");   
   
   
   $("button").click(function(e){   
      e.preventDefault();
      
      var operation = $(this).data("oper");
      
      if(operation === 'wrig'){
         formObj.attr("action", "/shoppingmall/QandA/register");
         formObj.attr("method", "get");
         formObj.submit();
      }
   });
   
   var result = '<c:out value="${result}"/>';
   
   if(result != ''){
      checkResult(result);
   }
   
   history.replaceState({}, null, null);
   function checkResult(result){
      if(result === '' || history.state){
         return;
      }
      if(result === 'success'){
         alert("처리가 완료되었습니다.");
         return;
      }
      if(parseInt(result) > 0){
         alert("게시글 " + parseInt(result) + "번이 등록되었습니다.");
      }
   }
   
   $(".move").click(function(e){
      e.preventDefault();
      
      var value = $(this).attr("href");
      
      formObj.append("<input type='hidden' name='q_bno' value='" + value + "'>");
      formObj.attr("action", "/shoppingmall/QandA/get");
      formObj.submit();
   })
   
   
});
</script>
<%@ include file="../../include/footer.jsp" %> 