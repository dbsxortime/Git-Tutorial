<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="../../include/header.jsp" %> 

<link rel="stylesheet" type="text/css" href="/resources/css/QandA/list.css">

   <div class="total">
      <div class="QandA"><b>QandA</b></div>
      <form>
         <div class = "row">
            <div class="col-md-8 "><button data-oper="wrig" type="button" style="width : 10%;">글쓰기</button></div>
            <div class="col-md-4"  style="text-align: right;">
               <input class="form-check-input" type="radio" value="u_id" name="option" checked="checked">아이디
               <input class="form-check-input" type="radio" value="q_title" name="option">제목
               <input class="form-check-input" type="radio" value="q_content" name="option">내용
               <input type="text" name="keyword"><button type="submit" data-oper="searchQandA" style="margin-left: 1%; width : 10%;">검색</button>
            </div>
         </div>
         
         <table class = "table begin">
            <tr>
               <th>No.</th>
               <th>Title</th>
               <th>Writer</th>
               <th>date</th>
            </tr>
            <c:forEach var="QA" items="${list }">
            <tr>
               <td>
                  <c:out value="${QA.q_bno }"/> 
               </td>
               <c:set var="user" value="${u_id}"/>
               <c:set var="writer" value="${QA.u_id}"/>
                  
               <sec:authorize access="hasRole('ROLE_ADMIN')">
                  <c:choose>
                     <c:when test="${QA.answer == null}">
                        <td>
                           <a class="QA" href='/shoppingmall/QandA/get?q_bno=<c:out value="${QA.q_bno}"/>'style="text-decoration: none; color:black;">
                              <c:out value="${QA.q_title }"/> 
                           </a>
                              
                        </td>
                     </c:when>
                     
                     <c:otherwise>
                        <td>
                           <a class="QA" href='/shoppingmall/QandA/get?q_bno=<c:out value="${QA.q_bno}"/>' style="text-decoration: none; color:black;">
                              <c:out value="${QA.q_title }"/>
                              &nbsp;&nbsp;&nbsp; 
                              <span style="color:#999">
                                 (답변완료)
                              </span>
                           </a>
                        </td>
                       
                     </c:otherwise>
                  </c:choose>
               </sec:authorize>
               
               <sec:authorize access="hasRole('ROLE_USER')">
                  <c:choose>
                     <c:when test="${QA.issecret > 0 && user != writer}">
                        <td style="color : gray;">비밀글 입니다.</td>
                     </c:when>
                     
                     <c:otherwise>
                     
                        <c:choose>
                           <c:when test="${QA.answer == null}">
                              <td>
                                 <a class="QA" href='/shoppingmall/QandA/get?q_bno=<c:out value="${QA.q_bno}"/>' style="text-decoration: none; color:black;">
                                    <c:out value="${QA.q_title }"/>
                                 </a>
                                    
                              </td>
                           </c:when>
                           
                           <c:otherwise>
                              <td>
                                 <a class="QA" href='/shoppingmall/QandA/get?q_bno=<c:out value="${QA.q_bno}"/>' style="text-decoration: none; color:black;" >
                                    <c:out value="${QA.q_title }"/>
                                    &nbsp;&nbsp;&nbsp; 
                                    <span style="color:#999">
                                       (답변완료)
                                    </span>
                                 </a>
                              </td>
                           </c:otherwise>
                        </c:choose>
                     </c:otherwise>
                  </c:choose>
               </sec:authorize>
               
               <sec:authorize access="!isAuthenticated()">
                  <c:choose>
                     <c:when test="${QA.issecret > 0}">
                        <td style="color : gray;">비밀글 입니다.</td>
                     </c:when>
                     <c:otherwise>
                        <c:choose>
                           <c:when test="${QA.answer == null}">
                              <td>
                                 <a class="QA" href='/shoppingmall/QandA/get?q_bno=<c:out value="${QA.q_bno}"/>' style="text-decoration: none; color:black;">
                                    <c:out value="${QA.q_title }"/> 
                                 </a>
                              </td>
                           </c:when>
                           <c:otherwise>
                              <td>
                                 <a class="QA" href='/shoppingmall/QandA/get?q_bno=<c:out value="${QA.q_bno}"/>' style="text-decoration: none; color:black;">
                                    <c:out value="${QA.q_title }"/>
                                    &nbsp;&nbsp;&nbsp; 
                                    <span style="color:#999">
                                       (답변완료)
                                    </span>
                                 </a>
                              </td>
                           </c:otherwise>
                        </c:choose>
                     </c:otherwise>
                  </c:choose>
               </sec:authorize>

                  <td><c:out value="${writer }"></c:out> </td>
               <td style="text-align:center;"><fmt:formatDate value="${QA.q_regdate }"/></td>
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
      }else if(operation ==='searchQandA'){
         formObj.attr("action", "/shoppingmall/search/searchQandA");
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
</html>

<%@ include file="../../include/footer.jsp" %> 