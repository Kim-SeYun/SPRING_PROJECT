<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>

<div class="container">

	<style>
	    h1 + form {
	        margin-top: 50px;
	    }
	    .btn-center {
	    	margin-top: 50px;
	        text-align: center;
	    }
	</style>

	<h1>문의하기</h1>
	<sec:authorize access="isAuthenticated()">
	<form action="${contextPath}/inquiry/modify" method="post">
	<input type="hidden" name="bno" value="${i.bno}">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="text" name="title" class="form-control" placeholder="제목" value="${i.title}">
		<select class="form-control" id="typeSelect" name="type">
		    <option value="">문의유형을 선택하세요</option>
		    <option value="event" ${i.type == 'event' ? 'selected' : ''}>이벤트</option>
		    <option value="payment" ${i.type == 'payment' ? 'selected' : ''}>예약/결제</option>
		    <option value="refund" ${i.type == 'refund' ? 'selected' : ''}>취소/환불</option>
		    <option value="inquiry" ${i.type == 'inquiry' ? 'selected' : ''}>이용문의</option>
		    <option value="profile" ${i.type == 'profile' ? 'selected' : ''}>회원정보</option>
		    <option value="other" ${i.type == 'other' ? 'selected' : ''}>기타</option>
		</select>
		<textarea rows="10" name="content" class="form-control" placeholder="내용">${i.content}</textarea>
		<input type="text" name="writer" class="form-control" value="<sec:authentication property="principal.username"/>" readonly="readonly">
		<div class="btn-center">
	        <button class="btn btn-info">작성 완료</button>
	        <a href="${contextPath}/inquiry/list" type="submit" class="btn btn-success">목록</a>
	    </div>
	</form>
	</sec:authorize>
	
</div>

<%@ include file="../layout/footer.jsp" %>
