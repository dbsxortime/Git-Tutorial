<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


 <%@ include file="../../include/header.jsp" %> 

<link rel="stylesheet" type="text/css" href="/resources/css/userout.css">

<div class="content">

<span class="msg">탈퇴 사유를 적어주시면 쇼핑몰 운영에 적극 반영하겠습니다.</span><br/><br/>


 <div class="page_body">
   <div class="box">
       <ul>
          <li>저희 쇼핑몰의 부족했던 점과 아쉬웠던 점을 적어주십시오.<br/>
              만족시키지 못해 죄송스럽습니다.</li>
            <li>앞으로 더 나은 모습으로 만나뵙겠습니다<br/>
                그동안 감사했습니다.</li>
      
       </ul>
   </div>
 
   <div class="box2">
      <table class="box2table">
         <tr>
            <th>사유&nbsp;</th>
            <td><textarea cols="100" rows="10" style="resize: none;" required = "required"></textarea></td>
         </tr>
      </table>
   </div>
 </div>


<div class="btn_area">
<form action="/shoppingmall/mypage/userout" method="post">
<input type="submit" value="회원탈퇴" id="userout" class="btn btn-lg btn-secondary btn-block text-uppercase">
<input type="button" value="취소하기" id="canclebutt" class="btn btn-lg btn-secondary btn-block text-uppercase" onclick="cancle();">
</form>

</div>
</div>

<script>
function cancle(){
	alert("회원탈퇴를 취소하였습니다.");
	window.location.href="/shoppingmall/homepage";
}

</script>

<%@ include file="../../include/footer.jsp" %>
