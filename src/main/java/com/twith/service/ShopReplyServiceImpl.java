package com.twith.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twith.domain.Criteria;
import com.twith.domain.ShopReplyDTO;
import com.twith.domain.ShopReplyPageDTO;
import com.twith.mapper.ShopReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ShopReplyServiceImpl implements ShopReplyService{
	@Setter(onMethod_ = @Autowired)
	private ShopReplyMapper mapper;
	@Override
	public boolean regist(ShopReplyDTO reply) {
		log.info("-------regist-------");
		return mapper.insert(reply) == 1;
	}

	@Override
	public ShopReplyDTO get(Long SReplyNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(ShopReplyDTO reply) {
		log.info("------modify(reply)------\nreplynum : "+reply.getSreplyNum());
		return mapper.update(reply) == 1;
	}

	@Override
	public boolean remove(Long SReplyNum) {
		log.info("------remove(reply)------\nreplynum : "+SReplyNum);
		return mapper.delete(SReplyNum)==1;
	}
	
	@Override
	public ShopReplyPageDTO getList(Criteria cri, Long shopNum) {
		log.info("------getList(reply)------\nshopNum : "+shopNum);
		//프론트에서 replyCnt(총 댓글개수)와 list(댓글들 데이터 리스트)를 요청하고 있고
		//두 종류의 데이터를 넘겨주어야 하기 때문에 하나의 객체(ReplyPageDTO)로 만들어서 돌려준다.
								//게시글에 달린 총 개수			//기준(cri)과 게시글번호로 댓글 리스트 긁어오기
		return new ShopReplyPageDTO(mapper.getTotal(shopNum), mapper.getListWithPaging(cri,shopNum));
	}

	@Override
	public boolean deleteAll(Long shopNum) {
		log.info("------deleteAll------\nshopNum : "+shopNum);
		return mapper.deleteAll(shopNum)!=0;
	}
}













