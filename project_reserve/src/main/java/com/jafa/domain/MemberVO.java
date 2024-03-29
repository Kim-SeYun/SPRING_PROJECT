package com.jafa.domain;

import java.util.List;

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
@Builder
public class MemberVO {
	private Long mno; 
	private String memberId; 
	private String password; 
	private String email;
	private String name;
	private String address;
	private String phoneNumber;
	private int birth;
	private boolean enabled;
	private List<AuthVO> authList;

}
