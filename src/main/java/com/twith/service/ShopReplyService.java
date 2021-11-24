package com.twith.service;

import com.twith.domain.Criteria;
import com.twith.domain.ShopReplyPageDTO;
import com.twith.domain.ShopReplyDTO;

public interface ShopReplyService {
	boolean regist(ShopReplyDTO reply);
	ShopReplyDTO get(Long SReplyNum);
	boolean modify(ShopReplyDTO reply);
	boolean remove(Long SReplyNum);
	//목록
	ShopReplyPageDTO getList(Criteria cri, Long shopNum);
	boolean deleteAll(Long shopNum);
}
