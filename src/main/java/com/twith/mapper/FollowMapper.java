package com.twith.mapper;

import java.util.List;

import com.twith.domain.Criteria;
import com.twith.domain.FollowDTO;
import com.twith.domain.UserDTO;

public interface FollowMapper {

	List<FollowDTO> getFollowingListWithPaging(Criteria cri);
	int getFollowingTotal(Criteria cri);
	List<FollowDTO> getFollowerListWithPaging(Criteria cri);
	int getFollowerTotal(Criteria cri);
	int delete(FollowDTO follow);
	int deleteFollower(FollowDTO follow);
	int checkFollowId(FollowDTO follow);
	int addFollow(FollowDTO follow);
	
	//검색
	int getUserTotal(Criteria cri);
	List<UserDTO> getUserListWithPaging(Criteria cri);
}
