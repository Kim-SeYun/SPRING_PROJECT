package com.jafa.domain;

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
public class RoomVO {
	
	private Long room_id;
	private Long bno;
	private String room_type;
	private String room_info;
	private Long room_number;
	private Long price;
	private Integer attachFileCnt;
	private int available;

}
