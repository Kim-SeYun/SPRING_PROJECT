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
	<h2>이벤트</h2>
	  <div class="event-box">
		  <c:set var="maxBno" value="0" />
		  <c:forEach items="${eventAttach}" var="attach">
		    <c:if test="${attach.fileType eq 'IMAGE' && attach.bno > maxBno}">
		      <c:set var="maxBno" value="${attach.bno}" />
		    </c:if>
		  </c:forEach>
		  <c:forEach items="${eventAttach}" var="attach">
		    <c:if test="${attach.fileType eq 'IMAGE' && attach.bno == maxBno}">
		      <a href="${contextPath}/event/detail?bno=${attach.bno}">
		        <img src="${contextPath}/event/imgDisplay?filePath=${attach.filePath}&fileName=${attach.fileName}" style="width: 100%;">
		      </a>
		    </c:if>
		  </c:forEach>
	</div>
			
	<div class="box-container">
	    <div class="box">
	      <c:set var="prevBno" value="${maxBno-1}"/>
	      <c:forEach items="${eventAttach}" var="attach">
	        <c:if test="${attach.fileType eq 'IMAGE' && attach.bno == prevBno}">
	          <a href="${contextPath}/event/detail?bno=${attach.bno}">
	            <img src="${contextPath}/event/imgDisplay?filePath=${attach.filePath}&fileName=${attach.fileName}" style="width: 100%;">
	          </a>
	        </c:if>
	      </c:forEach>
	    </div>
	
	    <div class="box">
		  <c:set var="twoprev" value="${maxBno-2}"/>
	      <c:forEach items="${eventAttach}" var="attach">
	        <c:if test="${attach.fileType eq 'IMAGE' && attach.bno == twoprev}">
	          <a href="${contextPath}/event/detail?bno=${attach.bno}">
	            <img src="${contextPath}/event/imgDisplay?filePath=${attach.filePath}&fileName=${attach.fileName}" style="width: 100%;">
	          </a>
	        </c:if>
	      </c:forEach>
	    </div>
	  </div>
	</div>


</div>


<%@ include file="layout/footer.jsp" %>