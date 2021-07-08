<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="../../include/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<link rel="stylesheet" type="text/css" href="/resources/css/cart.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;300&display=swap" rel="stylesheet">	

<div class="cart_all">
	<p class="tit_img">Shopping cart</p>
	<br /> <br /> <br />

	<div class="page_body">
		<form name="form" action="#" method="get">
		    <div class="selectall">
			<span>전체 선택  </span><input onclick="checkcheckall();" type="checkbox" id="checkall" checked/></div>
			<table class="table begin" style="width: 100%; margin-left: 5%;">
				<tr style="border-bottom: 1px solid gray;">
					<td style="text-align: center;" >구매하기</td>
					<td style="text-align: center;">번호</td>
					<td style="text-align: center; width: 20%;">사진</td>
					<td style="text-align: center;">제품명</td>
					<td style="text-align: center;">수량</td>
					<td style="text-align: center;">사이즈</td>
					<td style="text-align: center;">적립</td>
					<td style="text-align: center;">가격</td>
					<td style="text-align: center;">취소</td>
				</tr>
					<c:choose>
						<c:when test="${!empty cart}">
							<c:forEach var="list" items="${cart}" varStatus="status">
								<tr>
									<td style="text-align: center;">
										<input type="checkbox" onclick="checkbuy();" value="${list.p_price * list.c_quantity}" name="iwillbuythis" checked/>
									</td>
									<td onclick="goProduct(${list.p_num});" style="text-align: center;">${status.count}</td>
									<td onclick="goProduct(${list.p_num});" style="text-align: center;"><img
										src="/resources/images/<c:out value="${list.p_image}"/>"
										id="p_image"  /></td>
									<td onclick="goProduct(${list.p_num});" style="text-align: center;"><c:out value="${list.p_name}" /></td>
									<td style="text-align: center;"><c:out value="${list.c_quantity}" />
										<input type="button" onclick="getModal(${list.c_num});" value="옵션 수정" id="optionBtn" />
										<input type="hidden" value="${list.u_id}" name="u_id" />
									</td>
									<td style="text-align: center;"><span id='size${list.c_num}'>${list.c_size}</span></td>
									<c:set var="price" value="${list.p_price * list.c_quantity}" />
									<c:set var="save" value="${price/100 }" />
									<td style="text-align: center;"><c:out value="${save }" />P </td>
									<td style="text-align: center;"><c:out value="${price}" />원 </td>
									<td style="text-align: center;"><a href="/shoppingmall/cart/removeonecart?c_num=<c:out value='${list.c_num}'/>" class="deltebutton"><strong>삭제</strong></a>
									</td>
								</tr>
								<input type="hidden" name="checkedList" value="${list.c_num}"/>
								<input type="hidden" name="saveCheckedList" value="${list.c_num}"/>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan='9' style="text-align: center;">상품이 없습니다</td>
							</tr>
						</c:otherwise>
					</c:choose>
			</table>

<%@ include file="../../include/cart_option_modal.jsp"%>

<script type="text/javascript">
	//option modal
	var optionInputBtn = $("#optionInputBtn");
	var optionCloseBtn = $("#optionCloseBtn");
	var optionBtn = '#optionBtn';
	
	function getModal(c_num){
		var option_modal = '#option_modal'+ c_num;
		
		$.ajax({
 			type: "POST",
 			dataType : 'json',
             url: "/shoppingmall/cart/getOption",
             data:  {
            	 "c_num" : c_num,
			},
			success : function(data){
				console.log(data);
				var str="";
				
				$(data).each(function(i, obj){
					str += "<option value='"+obj.op_size+"'>"+obj.op_size+"</option>";
				});
				$(".option").html(str);
				
 			},
 			error : function(result){
 				alert('fail');
 			}
 		});
		
		$(option_modal).modal("show");
		
	}
	
	function closeBtn(c_num) {
		var option_modal = '#option_modal'+ c_num;
		$(option_modal).modal("hide");
	}
</script>

<script type="text/javascript">
 	function updateoption(c_num) {
 		var changeamount = '#qun' + c_num;
 		var p_num = '#num' + c_num;
 		
 		var changeoption = 'checksize' + c_num;
 		
 		
 		$.ajax({
 			type: "POST",
             url: "/shoppingmall/cart/updateoption", //url 설정
             data:  {
            	 "c_num" : c_num,
            	 "changeamount": $(changeamount).val(),
            	 "changeoption": $('#'+changeoption).val(),
            	 "p_num" : $(p_num).val()
			},
			success : function(result){
            	 alert('수량이 변경되었습니다.')
            	 location.reload()	//input value 고쳐야하는데 잘 모르겠으니 그냥 새로고침
 			},
 			error : function(result){
 				alert(result)
 			}
 		});
 	}
</script>

<script type="text/javascript">
	function checkcheckall(){	// 전체 선택, 전체 해제
		if($("#checkall").is(":checked") == true){
			$('input[name=iwillbuythis]').prop('checked',true);
		}else{
			$('input[name=iwillbuythis]').prop('checked',false);
		} 
		checkbuy();
	}
	
	function checkbuy() {
		var checkbox =  document.getElementsByName('iwillbuythis');
		var checkedList =  document.getElementsByName('checkedList');
		var saveCheckedList =  document.getElementsByName('saveCheckedList');
  		var gettotal = 0;
        for (var i=0; i<checkbox.length; i++) {
            if (checkbox[i].checked == true) {
                gettotal += parseInt(checkbox[i].value);
                checkedList[i].value = saveCheckedList[i].value;
            }else {
            	checkedList[i].value = 0;
            }
        }
        document.getElementById('total_price').value = gettotal;

        if(gettotal >= 50000) {
	        document.getElementById('total_fee').value = 0;
        }else {
	        document.getElementById('total_fee').value = 2500;
        }
        
        document.getElementById('total_pay').value = 
        	gettotal + parseInt(document.getElementById('total_fee').value);
        
        gettotal = 0;
        
        
        
    }
	function goProduct(p_num) {
		location.href="/shoppingmall/product/product?p_num="+p_num
	}
</script>
			<c:set var="total" value="${price }" />
			<c:choose>
				<c:when test="${total >= 50000}">
					<c:set var="fee" value="0" />
				</c:when>
				<c:otherwise>
					<c:set var="fee" value="2500" />
				</c:otherwise>
			</c:choose>

			<c:if test="${!empty cart}">
					<div class="product_discount">
						<p style="font-size: 15px; font-style: bold; text-align: center;">결제 정보</p>
						<hr />
						
						<table class="product_order_discount">
							<tr>
								<td colspan='5'>상품금액</td>
								<td>배송비</td>
								<td>결제 예정금액</td>
							</tr>
							<tr>
								<td colspan='5'>
									<input type="text" value="${total}"	readonly="readonly" name="p_price" id="total_price" /> 원 <span>&nbsp;+&nbsp;</span>
								</td>
								<td>
									<input type="text" value="${fee}" readonly="readonly" id="total_fee" name="delievery_fee" /> 원 <span>&nbsp;=&nbsp;</span>
								</td>
								<td>
									<input type="number" value="${total + fee}"  readonly="readonly" id="total_pay" />원
								</td>
							</tr>
						</table>
					</div>
			</c:if>

			<br /> <br />
			<div id="checkedcart">
			</div>
			<div class="order_butt">
				<c:choose>
					<c:when test="${!empty cart}">
						<button data-oper="ongoingshopping" class="btn btn-lg btn-secondary btn-block text-uppercase"  id="ongoing_butt">계속쇼핑하기</button>
						<button data-oper="cartclean" class="btn btn-lg btn-secondary btn-block text-uppercase"  id="clear_butt">장바구니비우기</button>
						<button data-oper="order" class="btn btn-lg btn-secondary btn-block text-uppercase"  id="order_butt">주문하기</button>
					</c:when>
					<c:otherwise>
						<button data-oper="ongoingshopping" class="btn btn-lg btn-secondary btn-block text-uppercase"  id="ongoing_butt">계속쇼핑하기</button>
						<button data-oper="cartclean" class="btn btn-lg btn-secondary btn-block text-uppercase"  id="clear_butt">장바구니비우기</button>
						<button data-oper="nocart" class="btn btn-lg btn-secondary btn-block text-uppercase"  id="order_butt">주문하기</button>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="checkedbox"></div>
		</form>
	</div>
</div>




<script type="text/javascript">
	
</script>
<script type="text/javascript"> 
	$(function() {
		checkbuy();
	});
	
	$("button").click(function(e) {
		var formObj = $("form");
		
		e.preventDefault();

		var operation = $(this).data("oper");

		if (operation === 'order') {
			formObj.attr("action", "/shoppingmall/pay/pay");
			formObj.attr("method", "post");
			
		} else if (operation === 'ongoingshopping') {
			formObj.attr("action", "/shoppingmall/homepage");
			 formObj.attr("method", "get");
		} else if (operation === 'cartclean') {
			formObj.attr("action", "/shoppingmall/cart/removecart");
			formObj.attr("method", "get");
		} else if (operation === 'nocart') {
			alert('상품이 없습니다.');
		}
		formObj.submit();
	});
	
</script>
<script type="text/javascript"> 

</script>



<%@ include file="../../include/footer.jsp"%>