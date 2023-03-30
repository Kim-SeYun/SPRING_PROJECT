<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>


<div class="container">
	<input type="hidden" value="${category}" class="category">
	<table class="table">
	
		<tr>
			<td>이름</td>
			<td>주소</td>
			<td>카테고리</td>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr><td colspan="5">
					게시물이 존재하지 않습니다.
				</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="h">
					<tr>
						<td><a href="${contextPath}/hotel/detail">${h.name}</a></td>
						<td>${h.address}</td>
						<td>${h.category}<td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</table>
	
	<ul class="hotel-list">
	    	<c:if test="${not empty attachList}">
		        <c:set var="printedBno" value="" />
		        <c:forEach items="${attachList}" var="attach">
		            <c:if test="${attach.fileType eq 'IMAGE' && attach.bno ne printedBno}">
		                <c:set var="printedBno" value="${attach.bno}" />
	                	<li style="margin-bottom: 50px;">
		                      <c:forEach items="${list}" var="h">
		                      	<c:if test="${h.bno eq attach.bno}">
						            <div>${h.name}<br> ${h.address}</div>
		                      	</c:if>
					          </c:forEach>
		                     <a href="${contextPath}/hotel/detail?bno=${attach.bno}">
		                     <img src="${contextPath}/hotel/imgDisplay?filePath=${attach.filePath}&fileName=${attach.fileName}" style="width: 800px; height: 100px;"></a>
	               		</li>
		            </c:if>
		        </c:forEach>
		    </c:if>
		</ul>
		
		<c:if test="${empty attachList}">
			<b>등록된 호텔이 없습니다.</b>
		</c:if>
		
		
		

	
	<%-- <ul class="pagination">
		<c:if test="${p.prev}">
			<li class="page-item">
				<a class="page-link" href="?page=${p.startPage-1}">Previous</a>
			</li>
		</c:if>
		<c:forEach begin="${p.startPage}" end="${p.endPage}" var="pageNum">
			<li class="page-item ${cri.page == pageNum ? 'active' :''}">
				<a class="page-link" href="?page=${pageNum}">${pageNum}</a>
			</li>
		</c:forEach>
		<c:if test="${p.next}">
		<li class="page-item">
			<a class="page-link" href="?page=${p.endPage+1}">Next</a>
		</li>
		</c:if>
	</ul> --%>
	
	
</div>

<%@ include file="../layout/footer.jsp" %>

