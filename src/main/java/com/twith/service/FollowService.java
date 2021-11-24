package com.twith.service;

import java.util.List;

import com.twith.domain.Criteria;
import com.twith.domain.FollowDTO;
import com.twith.domain.UserDTO;

public interface FollowService {

	public List<FollowDTO> getFollowingList(Criteria cri);
	
	public int getFollowingTotal(Criteria cri);

	public List<FollowDTO> getFollowerList(Criteria cri);

	public int getFollowerTotal(Criteria cri);

	public boolean addFollow(FollowDTO follow);
	
	public boolean remove(FollowDTO follow);

	public boolean removeFollower(FollowDTO follow);

	public List<UserDTO> getUserList(Criteria cri);
	
	public int getUserTotal(Criteria cri);

	public int checkFollowId(FollowDTO follow);

}
