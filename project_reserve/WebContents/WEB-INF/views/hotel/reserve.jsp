<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>



<div class="container">
	

${reserve.name}<br>
${reserve.room_id}<br>
${reserve.price}원<br>
${checkinDate}<br>
${checkoutDate}<br>

	
</div>

<%@ include file="../layout/footer.jsp" %>



