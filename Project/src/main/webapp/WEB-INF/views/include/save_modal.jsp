<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>


#saveInputBtn, #saveCloseBtn{
margin-left: 40%;
} 



</style>

<!-- Save Modal -->
			<div class="modal save_modal" id="MyModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content" style="width:500px; text-align: center; float:center; margin: auto; height:380px; ">
					<div class="content" style="margin-top: 5%;">
						<h3>적립금 조회</h3>
						<p>보유 적립금 : ${save }</p>
						<p>적립금은 1000원 이상 100원 단위로 사용이 가능합니다.</p>
						<p style="color : #b51e2c">사용할 적립금</p>
						<c:choose>
							<c:when test="${save >=1000 }">
								<input type="button" value="적립금 전체 사용" class="btn btn-lg btn-secondary btn-block text-uppercase"  style="width:30%; background-color: black; color : white; margin-left: 35%; margin-bottom: 5%; float:left;" onclick="useSaveAll(${save});"/>
								<input type="number" id="save" value="0" step="100" name="calcsave" style="width:25%; margin-left: 38%; margin-bottom: 5%; float:left;"/>
								<button id='saveInputBtn' type="button"  class="btn btn-lg btn-secondary btn-block text-uppercase" style="width:20%; background-color: black; color:white; float:left;">사용하기</button>
							</c:when>
							<c:otherwise>
								<span style="color:#dc061a">적립금이 ${save }원으로 사용이 불가능합니다.</span>
							</c:otherwise>
						</c:choose>
						
				
						<button id='saveCloseBtn' type="button" class="btn btn-lg btn-secondary btn-block text-uppercase"  style="width:20%; background-color: black; color : white; float:left;">취소</button>
				       </div>
					</div>
				</div>
				<script type="text/javascript">
					function useSaveAll(save){
						save = Math.floor(save/100)*100;
						document.getElementsByName('calcsave')[0].value = save;
					}
				</script>
			</div>