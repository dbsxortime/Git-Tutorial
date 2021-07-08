<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Coupon Modal -->
			<div class="modal coupon_modal" id="MyModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content" style="width:600px; text-align: center; float:center; margin-top : 10%; height:250px; ">
					<div class="content" style="margin-top: 5%;">
						<h2>쿠폰 조회</h2>
						<h3 style="color:#b51e2c">원하시는 쿠폰을 더블클릭해주세요!</h3>
							<table style="width:500px; text-align: center; margin-left: 10%;">
								<tr>
									<td>번호</td>
									<td>이름</td>
									<td>사용가능금액</td>
									<td>할인금액</td>
									<td>만료일</td>
								</tr>
									<c:choose>
										<c:when test="${!empty couponList}">
											<c:forEach var="list" items="${couponList }" varStatus="status">
												<c:choose>
												    <c:when test="${list.cp_possible <= user.o_pay}">
														<tr onclick="usecoupon(${list.cpu_num})" id="coupon${list.cpu_num }" style="cursor:pointer;" >
															
															<td>
																<c:out value="${status.count}" />
															</td>
															<td>
																<c:out value="${list.cp_name}" />
															</td>
															<td>
																<c:out value="${list.cp_possible}" />
															</td>
															<td>
																<c:out value="${list.cp_discount}" />
															</td>
															<td>
																<c:out value="${list.cpu_expire}" /> 
															</td>
														</tr>
												    </c:when>
												    <c:when test="${list.cp_possible >= user.o_pay}">
												    	<tr style="color: #aaa">
															<td>
																<c:out value="${status.count}" />
															</td>
															<td>
																<c:out value="${list.cp_name}" />
															</td>
															<td>
																<c:out value="${list.cp_possible}" />
															</td>
															<td>
																<c:out value="${list.cp_discount}" />
															</td>
															<td>
																<c:out value="${list.cpu_expire}" />
															</td>
														</tr>
												    </c:when>
												</c:choose>
												<input type="hidden" name="cpu_num" value="${list.cpu_num }"/> 
											<input type="hidden" name="saveCheckedList" value="${list.cpu_num}"/>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<input type="hidden" name="cpu_num" value="0"/> 
										</c:otherwise>
									</c:choose>
							</table>
							<div class="buttonarea">
						<button id='couponInputBtn' type="button" class="btn btn-lg btn-secondary btn-block text-uppercase"  style="width:20%; background-color: black; color : white;">쿠폰등록</button>
						<button id='couponCloseBtn' type="button" class="btn btn-lg btn-secondary btn-block text-uppercase"  style="width:20%; background-color: black; color : white; margin-top: -1px;">취소</button>
					</div>
					</div>
					</div>
				</div>
			</div>