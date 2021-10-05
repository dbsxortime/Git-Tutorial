# my-project (ROGO / shoppingmall)
<span>작업기간 : 2021.06 ~ 2021.07 [2명, 4주]</span> <br/>
<p>
  기존 쇼핑몰을 개선하기위한 가상 의뢰 프로젝트이다. <br/>
  전반적인 디자인 개선, 기능의 개선이 이루어졌다.
</p> 
<br/><br/>

<p>기술 사용 스택</p>
<span>JSP javascript jquery CSS JSP html Spring Java MyBatis OracleDB</span><br/>
<span>eclipse VSCODE GitHub Zeplin</span>
<br/><br/>

<p>사용 라이브러리</p>
<span>
  log4j     /로그를 위한 라이브러리<br/>
  servlet   /MVC패턴 중 controller 구현을 위한 라이브러리<br/>
  lombok    /vo의 객체, getter, setter를 위한 라이브러리<br/>
  junit     /서버 일부분의 테스트를 위한 라이블러리<br/>
  springframework   /동적인 웹사이트 구현을 위한 프레임워크 적용<br/>
  Hikari    /DB커넥션을 위한 라이브러리<br/>
  mybatis   /매핑을 위한 라이브러리<br/>
  jackson   /json처리를 위한 라이브러리<br/>
  spring-security   /유저관련 기능 구현을 위한 라이브러리
</span>
<br/><br/>
<span>파트<br/> <strong> 화면구현(JSP 33% / javascript 80%), 서버구현(80%), SQL문 작성(80%), DB설계 수정(100%), 프로젝트 문서(100%, 하단 링크)</strong></span>

<hr/>
<p>프로젝트 문서(링크연결)</p>
<a href="https://github.com/dbsxortime/ROGO-shoppingmall/blob/main/%EA%B8%B0%ED%9A%8D_%EB%B0%9C%ED%91%9C/%EA%B8%B0%EB%8A%A5%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD.pdf">기능요구사항</a>
<br/>
<a href="https://github.com/dbsxortime/ROGO-shoppingmall/blob/main/%EA%B8%B0%ED%9A%8D_%EB%B0%9C%ED%91%9C/ppt.pdf">발표ppt</a>
<hr/>
<br/><br/>


# 개선 사항 및 기능 구현 사항 : 
<h3>디자인 변경사항 </h3> <br/>
<p>심플하고 직관적인 디자인으로 전반적으로 변경</p>
<p>버튼, 입력창, 로고 등 컨셉에 맞는 디자인으로 변경</p>

<br/><br id="top"/>
<h3>기능 변경사항 </h3> 
<br/><br/>
<span>기능 목차 (클릭시 이동합니다)</span><br/>
<a href="#user">유저기능</a><br/>
<a href="#product">상품기능</a><br/>
<a href="#cart">장바구니</a><br/>
<a href="#pay">구매기능</a><br/>
<a href="#mypage">마이페이지</a><br/>
<a href="#qna">Q&A기능</a><br/>
<a href="#notice">공지기능</a><br/>



<br id="user"/>
<h4>유저기능 관련</h4> 
<hr/>링크 이동
<a href="https://github.com/dbsxortime/my-project/tree/main/Project/src/main/webapp/WEB-INF/views/login">JSP</a>
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/java/org/project/controller/UserController.java">Controller</a>
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/resources/org/project/mapper/UserMapper.xml">Mapper</a>
<hr/>
<p>정규식을 통한 입력정보 조건 부여</p>
<p>jquery ajax를 통한 비동기처리를 통한 회원정보 중복유무 확인</p>
<p>모든 사용자, 로그인이용자(회원), 관리자 권한설정을 통한 사용자 이용권한 제한 </p>
<a href="#top">위로 가기</a>
<br/><br/>

<br id="product"/>
<h4>상품기능 관련</h4>
<hr/>링크 이동
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/webapp/WEB-INF/views/shoppingmall/product/product.jsp">JSP</a>
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/java/org/project/controller/ProductController.java">Controller</a>
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/resources/org/project/mapper/ProductMapper.xml">Mapper</a>
<hr/>
<p>장바구니에 추가 : 수량, 옵션 선택 시 장바구니 추가 버튼 활성화</p>
<p>장바구니 수정 : 기존상품에 동일한 옵션 있을 시 수량 추가 선택 가능</p>
<a href="#top">위로 가기</a>
<br/><br/>

<br id="cart"/>
<h4>카트기능 관련</h4>
<hr/>링크 이동
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/webapp/WEB-INF/views/shoppingmall/cart/cart.jsp">JSP</a>
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/java/org/project/controller/CartController.java">Controller</a>
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/resources/org/project/mapper/CartMapper.xml">Mapper</a>
<hr/>
<p>선택 상품 총 구매금액으로 배송비 자동 계산 (현재 5만원 이상 배송비 무료, 메소드 수정을 통해 사이트 내 모든 수치 일괄수정 가능)</p>
<p>옵션수정 : 기존 추가된 카트에서 수량, 옵션 수정 기능 추가</p>
<p>선택 구매기능 : 목록에서 선택한 상품만 서버로 전달, 해당 상품만 구매기능 추가</p>
<p>장바구니 삭제기능 : 상품별 삭제 또는 장바구니 비우기 기능 추가.</p>
<a href="#top">위로 가기</a>
<br/><br/>

<br id="pay"/>
<h4>구매기능 관련</h4>
<hr/>링크 이동
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/webapp/WEB-INF/views/shoppingmall/pay/pay.jsp">JSP</a>
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/java/org/project/controller/PayController.java">Controller</a>
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/resources/org/project/mapper/PayMapper.xml">Mapper</a>
<hr/>
<p>선택 상품만 구매 : 장바구니에서 선택한 상품만 서버로 전달받아 해당 상품만 구매기능 추가</p>
<p>할인 기능 구현 : 보유 쿠폰, 적립금 조회를 통해 가격 할인 적용</p>
<p>구매 동작 시 '유저', '카트', '주문', '옵션' 데이터 업데이트</p>
<p>유저 : 적립금 추가</p>
<p>카트 : 카트목록 중 구매상품 구매완료처리</p>
<p>주문 : 구매자, 받는사람, 카트, 상품정보 등 저장</p>
<p>옵션 : 구매상품 옵션 업데이트(수량)</p>
<a href="#top">위로 가기</a>
<br/><br/>

<br id="mypage"/>
<h4>마이페이지 관련</h4>
<hr/>링크 이동
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/webapp/WEB-INF/views/shoppingmall/mypage/mypage.jsp">JSP</a>
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/java/org/project/controller/MyPageController.java">Controller</a>
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/resources/org/project/mapper/MyPageMapper.xml">Mapper</a>
<hr/>
<p>주문 상세 조회 : 주문조회 시 결제정보 조회 가능</p>
<p>주문 상세 조회 시 : 각각의 정보를 가지고 있는 '주문', '카트', '상품' 정보를 join하여 정보 가져오는 sql문 작성</p>
<a href="#top">위로 가기</a>
<br/><br/>

<br id="qna"/>
<h4>Q&A 관련</h4>
<hr/>링크 이동
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/webapp/WEB-INF/views/shoppingmall/QandA/list.jsp">JSP</a>
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/java/org/project/controller/QandAController.java">Controller</a>
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/resources/org/project/mapper/QandAMapper.xml">Mapper</a>
<hr/>
<p>게시물 작성 시 : 비밀글 설정을 통해 작성자/관리자만 볼 수 있게 설정 가능</p>
<p>관리자 답변 : jquery ajax를 통한 비동기통신으로 답변달기 기능 구현</p>
<p>마이페이지에서 사용자 본인이 쓴 게시물만 보기 구현</p>
<a href="#top">위로 가기</a>
<br/><br/>

<br id="notice"/>
<h4>공지 관련</h4>
<hr/>링크 이동
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/webapp/WEB-INF/views/shoppingmall/notice/list.jsp">JSP</a>
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/java/org/project/controller/NoticeController.java">Controller</a>
<a href="https://github.com/dbsxortime/my-project/blob/main/Project/src/main/resources/org/project/mapper/NoticeMapper.xml">Mapper</a>
<hr/>
<p>단순 게시물 CRUD 구현</p>
<p>create, update, delete는 관리자만 가능</p>
<p>모든 사용자 read 가능</p>
<a href="#top">위로 가기</a>
