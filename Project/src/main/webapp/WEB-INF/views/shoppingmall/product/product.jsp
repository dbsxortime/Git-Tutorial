<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="../../include/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>



<link rel="stylesheet" type="text/css" href="/resources/css/product.css">




<form id="product_all">
	<div class="product_all">
		<div class="product_box">
			<div class="pro_list">
				<p class="tit_img">
					상품명 :
					<c:out value="${product.p_name}" />
				</p>
				<div id="p_content">${product.p_content }</div>
				<br /> <br /> <img class="img_main"
					src="/../resources/images/<c:out value="${product.p_image }"/>" >

			</div>

			<div class="buy_option">
				<!--  스타일  -->
				<ul>
					<li>가격 &nbsp;&nbsp; <span style="color: #d41729"> <c:out
								value="${product.p_price}" />원
					</span>
					</li>
					<li>적립금 ${money }P</li>
					<li>수량 &nbsp;&nbsp; <input type="number" name="c_quantity"
						placeholder="수량을 입력하세요" min="0" id="c_quantity" value="1" /> <select
						id="MK_p_s_0" name="c_size" onchange="p_add_product(this)"
						id="c_size">
							<option value="">--옵션 선택--</option>
							<c:forEach var="size" items="${option }">
								<option value="${size.op_size }">${size.op_size }-
									${size.op_quantity }</option>
							</c:forEach>
					</select>

					</li>
				</ul>
				<div class="button_area">
					<button data-oper="buy"
						class="btn btn-lg btn-secondary btn-block text-uppercase" id="buy"
						onclick="insertCart(this.form);">BUY NOW</button>
					<button data-oper="cart"
						class="btn btn-lg btn-secondary btn-block text-uppercase"
						id="cart" onclick="insertCart(this.form);">GO CART</button>
				</div>
			</div>
		</div>

		<!--  스타일 끝  -->



		<img class="img_main"
			src="/../resources/images/<c:out value="${product.p_cont_img }"/>">
		<!--       <img class="img_content" src="http://mjdo2015.speedgabia.com/rusko_renew/size_recommendation.jpg"> -->

		<input type="hidden" value="${product.p_num }" name="p_num" /> <input
			type="hidden" value="${u_id }" name="u_id" />
	</div>
</form>

<script type="text/javascript">
function insertCart(f) {
   var formObj = $("form");
   
   var p_num = document.getElementsByName('p_num')[0].value;
   var c_quantity = document.getElementsByName('c_quantity')[0].value;
   var c_size = document.getElementsByName('c_size')[0].value;
   var u_id =  document.getElementsByName('u_id')[0].value;
   $.ajax({
      type: "POST",
      url: "/shoppingmall/cart/insertcart",
      data:  {
         "p_num":p_num,
         "c_quantity":c_quantity,
         "c_size":c_size
      },
      success: function(result) {
         if(result === "0" ){
            alert('장바구니가 추가 되었습니다.');
         }else {
            
            if(u_id === '비회원') {
               alert('로그인이 필요합니다. 로그인 후 다시 시도해 주세요.');
               location.href="/shoppingmall/cart/cart";
            }else {
               if(confirm('이미 장바구니에 동일 상품이 있습니다. 추가하시겠습니까?') === true){
                  
                  $.ajax({
                     type: "POST",
                     url: "/shoppingmall/cart/cartupdater",
                     data:  {
                        "p_num":p_num,
                        "c_quantity":c_quantity,
                        "c_size":c_size
                     },
//                   ,
//                      dataType: "text",
//                      success: function(result2) {
//                         alert(result2);
//                      },
                      
//                      error:function(result3){
//                      }
                  });
                  alert('장바구니 수정이 완료되었습니다');
               }else {
                  alert('장바구니 추가가 취소되었습니다.');
               }
            }
         }
         location.href="/shoppingmall/cart/cart"
      },
      error:function(request,status,error){
          alert("상품 수량과 옵션을 선택해주세요" );
      }
   });
}

</script>

<%@ include file="../../include/footer.jsp"%>