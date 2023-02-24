package com.jafa.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CompanyVO {
	private Long mno; 
	private String memberId; 
	private String password; 
	private String email;
	private String c_name;
	private boolean enabled;
	private List<AuthVO> authList;

}
