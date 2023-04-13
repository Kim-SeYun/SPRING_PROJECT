<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>

<style>
.category-box {
  background-color: #fff;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.form-group {
  margin-bottom: 20px;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

input[type="date"],
select,
input[type="text"] {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

select option {
  padding: 10px;
}

button[type="submit"] {
  padding: 10px 20px;
  background-color: #009688;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button[type="submit"]:hover {
  background-color: #00796b;
}

	
</style>
<!--     <div class="form-group">
      <label for="location">지역</label>
      <select name="region">
      <option value="seoul">서울</option>
      <option value="busan">부산</option>
      <option value="jeju">제주</option>
      <option value="daegu">대구</option>
    </select>
    </div> -->

<div class="container">
	
	<div class="category-box">
	  <form action="${contextPath}/list/${category}" method="get">
	    <div class="form-group">
	      <label for="check-in">체크인</label>
	      <input type="date" name="checkin_date" value="${today}" onchange="updateCheckoutDate()">
	    </div>
	    <div class="form-group">
	      <label for="check-out">체크아웃</label>
	      <input type="date" name="checkout_date" value="${tomorrow}">
	    </div>
	    <div class="form-group">
	      <label for="capacity">인원</label>
	      <select id="capacity" name="capacity">
	        <option value="2">2명</option>
	        <option value="3">3명</option>
	        <option value="4">4명</option>
	        <option value="5">5명</option>
	        <option value="6">6명</option>
	      </select>
	    </div>
	    <div class="form-group">
	    <label for="bed_type">배드타입</label>
	    	<input type="checkbox" name="bed_type" value="single">싱글
	    	<input type="checkbox" name="bed_type" value="double">더블
	    	<input type="checkbox" name="bed_type" value="twin">트윈
	    </div>
	    <div class="form-group">
	      <button type="submit">검색</button>
	    </div>
	  </form>
	</div>

	<input type="hidden" value="${category}" class="category">
	
		
<ul class="hotel-list" style="list-style-type: none;">
    <c:if test="${not empty attachList}">
        <c:set var="printedBno" value="" />
        <c:forEach items="${attachList}" var="attach">
            <c:if test="${attach.fileType eq 'IMAGE' && attach.bno ne printedBno}">
                <c:set var="printedBno" value="${attach.bno}" />
                <li style="margin-bottom: 50px; position: relative;">
                	<a href="${contextPath}/hotel/detail?bno=${attach.bno}&checkin_date=${today}&checkout_date=${tomorrow}&person=2">
                    <img src="${contextPath}/hotel/imgDisplay?filePath=${attach.filePath}&fileName=${attach.fileName}" style="width: 600px; height: 200px; filter: brightness(0.7);"></a>
                    <div style="position: absolute; bottom: 0; left: 0; padding: 5px; color: white; ">
                        <h3 style="margin: 0; font-weight: bold;">
                            <c:forEach items="${list}" var="h">
                                <c:if test="${h.bno eq attach.bno}">
                                    ${h.name}
                                </c:if>
                            </c:forEach>
                        </h3>
                        <p style="margin: 0; font-weight: bold;">
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
			<b>등록된 숙박업소가 없습니다.</b>
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

<script>
function updateCheckoutDate() {
  const checkinInput = document.getElementById("checkin_date");
  const checkoutInput = document.getElementById("checkout_date");
  const checkinDate = new Date(checkinInput.value);
  const checkoutDate = new Date(checkinDate.getTime() + 24 * 60 * 60 * 1000);
  checkoutInput.value = checkoutDate.toISOString().substr(0, 10);
}
</script>

