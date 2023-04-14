<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>

<style>
	.reservation-info input[type="text"] {
	  border: none;
	}

  .reservation-info {
    border: 1px solid #ccc;
    padding: 10px;
    background-color: #f2f2f2;
    border-radius: 4px;
  }
  
  .reservation-info input[readonly] {
	  background-color: #f2f2f2;
	}
  

</style>


<div class="container">

<form id="reserveForm" action="${contextPath}/reserve/reserve" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="hidden" name="room_id" value="${reserve.room_id}">
  <div class="row">
    <div class="col-md-6">
      <h3>예약자 정보</h3>
      <div class="form-group">
        <h5>예약자 이름</h5>
        <input type="text" name="guest_name" class="form-control">
      </div>

      <div class="form-group">
        <h5>휴대폰 번호</h5>
        <input type="text" name="phone" class="form-control">
      </div>
    </div>

    <div class="col-md-4">
      <h3>예약 정보</h3>
      <div class="reservation-info">
        <div class="form-group">
          <label for="name">숙소이름</label>
          <input type="text" class="form-control" name="name" id="name" value="${reserve.name}" readonly="readonly">
        </div>
        <div class="form-group">
          <label>객실타입</label>
          <input type="text" class="form-control" name="room_type" value="${reserve.room_type}" readonly="readonly">
        </div>
        <div class="form-group">
          <label>가격</label>
          <input type="text" class="form-control" name="price" value="${reserve.price}" readonly="readonly">
        </div>
        <div class="form-group">
          <label>체크인</label>
          <input type="text" class="form-control" name="checkin" value="${checkinDate}" readonly="readonly">
          <span id="weekday"></span>
        </div>
        <div class="form-group">
          <label>체크아웃</label>
          <input type="text" class="form-control" name="checkout" value="${checkoutDate}" readonly="readonly">
        </div>
      </div>
    </div>
  </div>
	<input type="hidden" name="category" value="${param.category}">
  <button>예약하기</button>
</form>

	
</div>

<%@ include file="../layout/footer.jsp" %>

<script>
  const [year, month, day] = "${checkinDate}".split('-');
  const dateObj = new Date(year, month - 1, day);
  const weekday = dateObj.toLocaleDateString('ko-KR', { weekday: 'long' }).replace('요일', '');
  
  const weekdayElement = document.getElementById("weekday");
  weekdayElement.innerHTML = weekday;

</script>



