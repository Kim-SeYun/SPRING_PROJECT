<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>



<div class="container">
	
	<style>
		a:hover {
		  text-decoration: none;
		}
	</style>
	
	<div class="tab">
		<div class="tabmenu">
			<div>
				<a href="${contextPath}/list/motel">
				<img alt="" src="${contextPath}/resources/images/motel.png" style="height: 50px; width: 50px;"><br>
				모텔</a>
			</div>
			<div>
				<a href="${contextPath}/list/hotel">
				<img alt="" src="${contextPath}/resources/images/hotel.png" style="height: 50px; width: 50px;"><br>
				호텔·리조트</a>
			</div>
			<div>
				<a href="${contextPath}/list/pension">
				<img alt="" src="${contextPath}/resources/images/pension.png" style="height: 50px; width: 50px;"><br>
				펜션</a>
			</div>
			<div>
				<a href="${contextPath}/list/guesthouse">
				<img alt="" src="${contextPath}/resources/images/guesthouse.png" style="height: 50px; width: 50px;"><br>
				게스트하우스</a>
			</div>
			<div>
				<a href="${contextPath}/list/camping">
				<img alt="" src="${contextPath}/resources/images/camping.png" style="height: 50px; width: 50px;"><br>
				캠핑·글램핑</a>
			</div>
		</div>
	</div>
	
	
	<div class="event">
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