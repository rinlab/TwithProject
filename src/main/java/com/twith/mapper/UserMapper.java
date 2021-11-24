package com.twith.mapper;

import com.twith.domain.UserDTO;

public interface UserMapper {
	
	public void join(UserDTO user);

	public int checkId(String userId);

	public UserDTO login(UserDTO user);

	public void updatePw(UserDTO user);

	public UserDTO getUser(String userEmail);

}
