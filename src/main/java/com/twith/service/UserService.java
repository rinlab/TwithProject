package com.twith.service;

import com.twith.domain.UserDTO;

public interface UserService {

	public void join(UserDTO user);

	public int checkId(String userId);

	public UserDTO login(UserDTO user);

	public UserDTO getUser(String userEmail);
	
	//이메일발송
	public void sendEmail(UserDTO user, String code) throws Exception;

	//비밀번호찾기
	public String findPw(UserDTO user);

	//아이디 찾기
	public String findId(UserDTO user);



}
