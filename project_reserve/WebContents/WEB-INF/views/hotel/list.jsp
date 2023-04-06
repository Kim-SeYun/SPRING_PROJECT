<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>


<div class="container">
	<input type="hidden" value="${category}" class="category">
	
		
<ul class="hotel-list" style="list-style-type: none;">
    <c:if test="${not empty attachList}">
        <c:set var="printedBno" value="" />
        <c:forEach items="${attachList}" var="attach">
            <c:if test="${attach.fileType eq 'IMAGE' && attach.bno ne printedBno}">
                <c:set var="printedBno" value="${attach.bno}" />
                <li style="margin-bottom: 50px; position: relative;">
                	<a href="${contextPath}/hotel/detail?bno=${attach.bno}">
                    <img src="${contextPath}/hotel/imgDisplay?filePath=${attach.filePath}&fileName=${attach.fileName}" style="width: 600px; height: 200px;"></a>
                    <div style="position: absolute; bottom: 0; left: 0; padding: 5px;">
                        <h3 style="margin: 0;">
                            <c:forEach items="${list}" var="h">
                                <c:if test="${h.bno eq attach.bno}">
                                    ${h.name}
                                </c:if>
                            </c:forEach>
                        </h3>
                        <p style="margin: 0;">
                            <c:forEach items="${list}" var="h">
                                <c:if test="${h.bno eq attach.bno}">
                                    ${h.address}
                                </c:if>
                            </c:forEach>
                        </p>
                    </div>
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

