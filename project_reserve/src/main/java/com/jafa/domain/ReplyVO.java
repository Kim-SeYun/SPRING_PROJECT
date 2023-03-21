package com.jafa.domain;



import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class ReplyVO {
	
	private Long rno;
	private Long bno;
	private String reply;
	private String writer;
	private Date replyDate;
	private Date modifyDate;

}
