package com.twith.domain;

import lombok.Data;

@Data
public class UserDTO {
	private int userNum;
	private String userId;
	private String userPw;
	private String userName;
	private String userNickname;
	private String userPhone;
	private String userEmail;
	private String userRegDate;
}
