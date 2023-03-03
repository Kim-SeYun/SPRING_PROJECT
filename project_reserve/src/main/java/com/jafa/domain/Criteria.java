package com.jafa.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@AllArgsConstructor
public class Criteria {

	int page; // 현재페이지
	int perPageNum; // 한페이지에 표시할 게시물 수
	
	public Criteria() {
		this(1, 10);
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
