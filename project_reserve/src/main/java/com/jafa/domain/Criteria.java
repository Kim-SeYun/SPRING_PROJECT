package com.jafa.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@AllArgsConstructor
public class Criteria {

	private int page; // 현재페이지
	private int perPageNum; // 한페이지에 표시할 게시물 수
	private String category;
	private String type;
	private String keyword;
	
	private String checkinDate;
	private String checkoutDate;
	private String capacity;
	private List<String> roomType; 
	
	// 예약 불가능 객실 번호 
	private List<Long> unreservableRooms;
	
	// 예약가능 호텔 번호
	private List<Long> reservableBno;

	
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int page, int perpageNum) {
		this.page = page;
		this.perPageNum = perpageNum;
	}
	
	// #{minRow}
	public int getMinRow() {
		return (this.page-1)*this.perPageNum;
	}
	
	// #{maxRow}
	public int getMaxRow() {
		return this.page*this.perPageNum;
	}
}
