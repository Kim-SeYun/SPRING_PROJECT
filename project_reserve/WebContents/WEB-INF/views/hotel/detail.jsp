<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<script src="${contextPath}/resources/js/list.js"></script>

<!-- swiper라이브러리 -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<style>
	
	.hotel-info {
	    margin-left: 60px;
	  }
	  
	.container {
		margin-left: 300px;
	}
	
	
	.room_box {
	    width: 800px;
	    height: 240px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    padding: 20px;
	    margin-top: 50px;
	}

	.room_list {
	    display: flex;
	    align-items: center;
	    gap: 10px;
    	justify-content: center;
	}
	
	.room_image {
    width: 150px; 
    height: 200px; 
    overflow: hidden;
	}
	
	.room_image img {
	    width: 100%;
	    height: 100%; 
	}
	
	.room_list div {
	    flex-grow: 1;
	}
	
	.room_list h1 {
	    font-size: 30px;
	    margin-bottom: 10px;
	    position: relative;
	    top: -20px; 
	    
	    
	}
	
	.room_list p {
	    font-size: 14px;
	    color: #666;
	    margin-bottom: 10px;
	    text-align: right;

	}
	
	.room_list button {
	    padding: 5px 10px;
	    background-color: #007bff;
	    color: #fff;
	    border: none;
	    width: 100%;
	}
	
	 .swiper-container {
        width: 500px;
        margin-right: 60px;
    }
    .swiper-slide img {
        width: 100%;
    }


</style>


<input type="hidden" name="category" value="${h.category}">

<div class="container">
<button type="button" onclick="location.href='${contextPath}/hotel/addRoom?bno=${h.bno}'">객실등록</button>

	
	
<div style="display:flex;">
    <c:if test="${not empty attachList}">
        <div>
            <img id="mainImage" src="${contextPath}/hotel/imgDisplay?filePath=${attachList[0].filePath}&fileName=${attachList[0].fileName}" style="width:500px;">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <c:forEach items="${attachList}" var="attach" varStatus="status">
                        <c:if test="${attach.fileType eq 'IMAGE'}">
                            <div class="swiper-slide">
                                <img src="${contextPath}/hotel/imgDisplay?filePath=${attach.filePath}&fileName=${attach.fileName}" style="width:100px; margin:10px;" onclick="changeImage('${contextPath}/hotel/imgDisplay?filePath=${attachList[status.index].filePath}&fileName=${attachList[status.index].fileName}')">
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="swiper-button-prev"></div>
    			<div class="swiper-button-next"></div>
            </div>
        </div>
    </c:if>

    <c:if test="${empty attachList}">
        <b>등록된 첨부파일이 없습니다.</b>
    </c:if>

    <div class="hotel-info">
        <div><h2>${h.name}</h2></div>
        <p>${h.address}</p>
    </div>
</div>


<!-- 객실리스트 -->
<c:if test="${not empty roomList}">
    <c:forEach items="${roomList}" var="r">
    
		<div class="room_box">
	        <div class="room_list">
	            <c:if test="${not empty roomAttach}">
	                <div class="room_image">
	                    <c:set var="firstImage" value="true"/>
	                    <c:forEach items="${roomAttach}" var="attach">
	                        <c:if test="${attach.fileType eq 'IMAGE' && attach.room_id eq r.room_id}">
	                            <c:if test="${firstImage}">
	                                <img src="${contextPath}/hotel/imgDisplay?filePath=${attach.filePath}&fileName=${attach.fileName}" >
	                                <c:set var="firstImage" value="false"/>
	                            </c:if>
	                        </c:if>
	                    </c:forEach>
	                </div>
	            </c:if>
	            <div class="room_info" >
                        <h1>${r.room_type}</h1>
                        <h1>${r.room_name}</h1>
                        <p>2인 기준 최대인원 : ${r.capacity}</p>
                        <p>가격 : ${r.price}</p>
                        <p>${r.room_info}</p>
	                <button class="toReserve" data-roomid="${r.room_id}">예약</button>
	            </div>
	        </div>
		</div>
    </c:forEach>
</c:if>

	

	
</div>

<%@ include file="../layout/footer.jsp" %>


<script>

    function changeImage(imageUrl) {
        var mainImage = document.getElementById("mainImage");
        mainImage.src = imageUrl;
    }
    
  	  var swiper = new Swiper('.swiper-container', {
  	    slidesPerView: 4,
  	    spaceBetween: 10,
  	    navigation: {
  	      nextEl: '.swiper-button-next',
  	      prevEl: '.swiper-button-prev',
  	    },
  	  });
  	  
  	  
  	$('.toReserve').on('click', function() {

      var urlParams = new URLSearchParams(window.location.search);
      var checkinDate = urlParams.get('checkin_date');
      var checkoutDate = urlParams.get('checkout_date');
      var room_id = $(this).data('roomid');

      $('<form/>').attr('method', 'get')
      .attr('action', '${contextPath}/reserve/list')
      .append($('<input/>').attr('type', 'hidden').attr('name', 'checkinDate').attr('value', checkinDate))
      .append($('<input/>').attr('type', 'hidden').attr('name', 'checkoutDate').attr('value', checkoutDate))
      .append($('<input/>').attr('type', 'hidden').attr('name', 'room_id').attr('value', room_id))
      .append($('[name="category"]'))
      .appendTo('body')
      .submit();
      
  	
  	});
  	  
  	  
  

    	  
</script>
