<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron">
		<h1>호텔관리페이지</h1>
	</div>
	
	<button type="button" onclick="location.href='${contextPath}/hotel/write'">호텔등록</button>
	
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
		
</div>

<%@ include file="../layout/footer.jsp" %>