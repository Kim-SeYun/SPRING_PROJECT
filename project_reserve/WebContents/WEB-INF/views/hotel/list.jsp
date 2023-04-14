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

button[type="reset"] {
  padding: 10px 20px;
  background-color: #FF5722;
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
<div class="row">
	<div class="col-md-4">
		<div class="category-box">
		  <form action="${contextPath}/list/${category}" method="get">
		    <div class="form-group">
		      <label for="check-in">체크인</label>
		      <input type="date" name="checkin_date" value="${param.checkin_date == null ? today : param.checkin_date}" onchange="updateCheckoutDate()">
		    </div>
		    <div class="form-group">
		      <label for="check-out">체크아웃</label>
		      <input type="date" name="checkout_date" value="${param.checkout_date == null ? tomorrow : param.checkout_date}">
		    </div>
		    <div class="form-group">
		      <label for="capacity">인원</label>
		      <select id="capacity" name="capacity">
		      <option value="2" ${param.capacity == '2' ? 'selected' : ''}>2명</option>
	          <option value="3" ${param.capacity == '3' ? 'selected' : ''}>3명</option>
	          <option value="4" ${param.capacity == '4' ? 'selected' : ''}>4명</option>
	          <option value="5" ${param.capacity == '5' ? 'selected' : ''}>5명</option>
	          <option value="6" ${param.capacity == '6' ? 'selected' : ''}>6명</option>
		      </select>
		    </div>
			<div class="form-group">
		        <label for="room_type">배드타입</label>
		        <input type="checkbox" name="room_type" value="single" ${param.bed_type == 'single' ? 'checked' : ''}>싱글
		        <input type="checkbox" name="room_type" value="double" ${param.bed_type == 'double' ? 'checked' : ''}>더블
		        <input type="checkbox" name="room_type" value="twin" ${param.bed_type == 'twin' ? 'checked' : ''}>트윈
	        </div>
		    <div class="form-group">
		      <button type="submit">검색</button>
		      <button type="reset" onclick="window.location.href = window.location.origin + window.location.pathname;">초기화</button>
		    </div>
		  </form>
		</div>
	</div>

	<input type="hidden" value="${category}" class="category">
	
		<div class="col-md-8">
			<ul class="hotel-list" style="list-style-type: none;">
			    <c:if test="${not empty attachList}">
			        <c:set var="printedBno" value="" />
			        <c:forEach items="${attachList}" var="attach">
			            <c:if test="${attach.fileType eq 'IMAGE' && attach.bno ne printedBno}">
			                <c:set var="printedBno" value="${attach.bno}" />
			                <li style="margin-bottom: 50px; position: relative;">
			                	<a href="${contextPath}/hotel/detail?bno=${attach.bno}&checkin_date=${param.checkin_date == null ? today : param.checkin_date}&checkout_date=${param.checkout_date == null ? tomorrow : param.checkout_date}">
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
		</div>

		
		<c:if test="${empty attachList}">
			<b>등록된 숙박업소가 없습니다.</b>
		</c:if>
		
		
</div>	
</div>

<%@ include file="../layout/footer.jsp" %>

<script>
	// 예약이 실패했을 때 동작
	var reserveFail = "${reservFail}";
	if(reserveFail!=''){
		alert(reserveFail);
	}

function updateCheckoutDate() {
	  const checkinInput = document.getElementById("checkin_date");
	  const checkoutInput = document.getElementById("checkout_date");
	  const checkinDate = new Date(checkinInput.value);
	  const checkoutDate = new Date(checkinDate.getTime() + 24 * 60 * 60 * 1000);
	  checkoutInput.value = checkoutDate.toISOString().substr(0, 10);
	}
	

</script>

