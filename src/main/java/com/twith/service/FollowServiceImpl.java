package com.twith.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twith.domain.Criteria;
import com.twith.domain.FollowDTO;
import com.twith.domain.UserDTO;
import com.twith.mapper.FollowMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service//서비스 객체임을 표시
public class FollowServiceImpl implements FollowService {
	@Setter(onMethod_ = @Autowired)
	private FollowMapper mapper;
	
	@Override
	public List<FollowDTO> getFollowingList(Criteria cri) {
		log.info("-------getFollowList-------");
		return mapper.getFollowingListWithPaging(cri);
	}

	@Override
	public int getFollowingTotal(Criteria cri) {
		return mapper.getFollowingTotal(cri);
	}

	@Override
	public List<FollowDTO> getFollowerList(Criteria cri) {
		log.info("-------getFollowerList-------");
		return mapper.getFollowerListWithPaging(cri);
	}
	
	@Override
	public int getFollowerTotal(Criteria cri) {
		return mapper.getFollowerTotal(cri);
	}

	@Override
	public boolean remove(FollowDTO follow) {
		log.info("------remove------"+follow.getUserId());
		return 0 != mapper.delete(follow);
	}
	
	@Override
	public boolean removeFollower(FollowDTO follow) {
		log.info("------remove------"+follow.getUserId());
		return 0 != mapper.deleteFollower(follow);
	}

	@Override
	public int checkFollowId(FollowDTO follow) {
		log.info("------checkFollowId------");
		int cnt = mapper.checkFollowId(follow);
		return cnt;
	}
	
	@Override
	public boolean addFollow(FollowDTO follow) {
		log.info("------addFollow------"+follow.getUserId());
		return 0 != mapper.addFollow(follow);
	}

	@Override
	public List<UserDTO> getUserList(Criteria cri) {
		log.info("-------getUserListWithPaging-------");
		return mapper.getUserListWithPaging(cri);
	}

	@Override
	public int getUserTotal(Criteria cri) {
		return mapper.getUserTotal(cri);
	}


}
