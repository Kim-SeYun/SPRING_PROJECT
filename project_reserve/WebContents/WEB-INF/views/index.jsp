<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>



<div class="container">

	
	<div class="tab">
		<div class="tabmenu">
			<div>
				<a href="${contextPath}/list/motel">모텔</a>
			</div>
			<div>
				<a href="${contextPath}/list/hotel">호텔·리조트</a>
			</div>
			<div>
				<a href="${contextPath}/list/pension">펜션</a>
			</div>
			<div>
				<a href="${contextPath}/list/guesthouse">게스트하우스</a>
			</div>
			<div>
				<a href="${contextPath}/list/camping">캠핑·글램핑</a>
			</div>
		</div>
	</div>
	
	
	<div class="event-box">
  		<h2>이벤트 상자 제목</h2>
  		<p>이벤트 상자 내용</p>
  		<button>더 알아보기</button>
	</div>

	<div class="box-container">
	  <div class="box">
	    <h2>상자 1 제목</h2>
	    <p>상자 1 내용</p>
	    <button>더 알아보기</button>
	  </div>

	  <div class="box">
	    <h2>상자 2 제목</h2>
	    <p>상자 2 내용</p>
	    <button>더 알아보기</button>
	  </div>
	</div>
	
  
</div>



  <%-- <div class="row">
    <div class="col">
      <a href="${contextPath}/">모텔</a>
    </div>
    <div class="col">
      <a href="${contextPath}/">호텔·리조트</a>
    </div>
    <div class="col">
      <a href="${contextPath}/">펜션</a>
    </div>
    <div class="col">
      <a href="${contextPath}/">게스트하우스</a>
    </div>
    <div class="col">
      <a href="${contextPath}/">캠핑·글램핑</a>
    </div>
  </div> --%>
<%@ include file="layout/footer.jsp" %>