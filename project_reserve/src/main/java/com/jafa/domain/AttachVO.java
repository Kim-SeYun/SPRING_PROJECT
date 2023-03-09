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
public class AttachVO {
	Long attachNo;
	Long bno; 
	String filePath; 
	String fileName; 
	FileType fileType;
}
