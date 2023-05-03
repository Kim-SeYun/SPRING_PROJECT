package com.jafa.validation;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.jafa.domain.MemberDTO;

public class MemberDTOValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		return MemberDTO.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		MemberDTO dto = (MemberDTO) target;
		
		// 이름
		if(dto.getName()==null || dto.getName().isBlank()) { // 이름을 입력하지 않았을 때
			errors.rejectValue("name", "required.name");
		} else { // 값이 있는 경우
			String name = dto.getName();
			if(name.length()<2 || name.length()>6) { // 이름은 2~6자
				errors.rejectValue("name", "length.name");
			} else if(!Pattern.matches("^[가-힣|a-z|A-Z]*$", name)) { // 한글 또는 영문
				errors.rejectValue("name", "nameChar.name");
			}
		}
		
		// 아이디
		if(dto.getMemberId()==null || dto.getMemberId().isBlank()) { 
			errors.rejectValue("memberId", "required.memberId");
			// 4~16자, 영문 또는 숫자만 허용
		} else {
			String memberId = dto.getMemberId();
			if(memberId.length()<4 || memberId.length()>16) {
				errors.rejectValue("memberId", "length.memberId");
			} else if(!Pattern.matches("^[a-z|A-Z|0-9]*$", memberId)) {
				errors.rejectValue("memberId", "idChar.id");
			}
		}
		
		// 비밀번호
		if(dto.getPassword()==null || dto.getPassword().isBlank()) {
			errors.rejectValue("password", "required.password");
		} else {
			String password = dto.getPassword();
			if(!Pattern.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&=])[A-Za-z\\d@$!%*#?&=]{8,}$", password)) {
				errors.rejectValue("password", "limit.password");
			} else if(!password.equals(dto.getConfirmPassword())) { 
				// 비밀번호와 비밀번호 확인이 일치 하지않을 경우 
				errors.rejectValue("password", "notMatching.password");
				errors.rejectValue("confirmPassword", "notMatching.password");
			}
		}
		
		// 이메일
		if(dto.getEmail()==null || dto.getEmail().isBlank()) { 
			errors.rejectValue("email", "required.email");
		} else {
			String email = dto.getEmail();
			if(!Pattern.matches("^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$", email)) {
				errors.rejectValue("email", "limit.eamil");
			} 
		}
		
		// 휴대폰번호
		if(dto.getPhoneNumber()==null || dto.getPhoneNumber().isBlank()) { 
			errors.rejectValue("phoneNumber", "required.phoneNumber");
		} else {
			String phoneNumber = dto.getPhoneNumber();
			if(!Pattern.matches("^01([0|1]{1})([0-9]{4})([0-9]{4})$", phoneNumber)) {
				errors.rejectValue("phoneNumber", "limit.phoneNumber");
			}
		}
	}

}
