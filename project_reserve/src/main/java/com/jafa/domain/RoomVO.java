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
	private String name;
	private String room_type;
	private String room_name;
	private String check_in;
	private String check_out;
	private String room_info;
	private Long price;
	private Long capacity;
	private Integer attachFileCnt;
	private int available;

}
