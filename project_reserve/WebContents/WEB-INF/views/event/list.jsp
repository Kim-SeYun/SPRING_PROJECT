<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>

<div class="container">
	
	<nav class="notice">
		<ul>
			<h2>더 보기</h2><br>
			<li><a href="${contextPath}/board/list"><h5>공지사항</h5></a></li>
			<li><a href="${contextPath}/inquiry/list"><h5>문의사항</h5></a></li>
			<li><a href="${contextPath}/event/list"><h5>이벤트</h5></a></li>
		</ul>
	</nav>
	
	<style>
		ul.event-list {
		  display: inline-block;
		  vertical-align: top;
		  margin-left: 50px;
		  margin-top: 70px;
		}	
	</style>
	

		<ul class="event-list">
	    	<c:if test="${not empty attachList}">
		        <c:set var="printedBno" value="" />
		        <c:forEach items="${attachList}" var="attach">
		            <c:if test="${attach.fileType eq 'IMAGE' && attach.bno ne printedBno}">
		                <c:set var="printedBno" value="${attach.bno}" />
	                	<li style="margin-bottom: 50px;">
		                      <c:forEach items="${list}" var="b">
		                      	<c:if test="${b.bno eq attach.bno}">
						            <div>${b.title}<br> ${b.content}</div>
		                      	</c:if>
					          </c:forEach>
		                     <a href="${contextPath}/event/detail?bno=${attach.bno}">
		                     <img src="${contextPath}/event/imgDisplay?filePath=${attach.filePath}&fileName=${attach.fileName}" style="width: 800px; height: 100px;"></a>
	               		</li>
		            </c:if>
		        </c:forEach>
		    </c:if>
		</ul>
		
		
		<c:if test="${empty attachList}">
			<b>등록된 첨부파일이 없습니다.</b>
		</c:if>
		
	<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
        <a href="${contextPath}/event/write" class="btn btn-info">글쓰기</a>
    </sec:authorize>
	
</div>

<%@ include file="../layout/footer.jsp" %>
