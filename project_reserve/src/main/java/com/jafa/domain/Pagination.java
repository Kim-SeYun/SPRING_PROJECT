package com.jafa.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pagination {

	private Criteria criteria;
	int startPage;
	int endPage; 
	int tempEndPage;
	int totalCount; 
	int displayPageNum;
	boolean prev; 
	boolean next;
	
	public Pagination(Criteria criteria, int totalCount) {
		this.criteria = criteria;
		this.totalCount = totalCount;
		displayPageNum = 7; 
		endPage = (int) Math.ceil(criteria.getPage()/(double)displayPageNum)*displayPageNum;
		startPage = endPage - displayPageNum + 1;
		
		tempEndPage = (int) Math.ceil(totalCount/(double)criteria.getPerPageNum()); // 41.2
		
		prev = startPage != 1; 
		next = endPage < tempEndPage;
		
		if(endPage>tempEndPage) endPage = tempEndPage;
	}
}
