package com.jafa.domain;



import java.util.Date;

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
public class ReserveVO {
	
	private Long book_id;
	private Long room_id;
	private Long mno;
	private String name;
	private String guest_name;
	private String phone;
	private String room_type;
	private String checkin;
	private String checkout;
	private Long price;
	private Long capacity;
	private Date bookDate;
	private int available;

}
