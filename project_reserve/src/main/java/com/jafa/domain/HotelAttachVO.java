package com.jafa.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class HotelAttachVO {
	private Long attachNo;
	private Long bno; 
	private String category; 
	private String filePath; 
	private String fileName; 
	private FileType fileType;
}
