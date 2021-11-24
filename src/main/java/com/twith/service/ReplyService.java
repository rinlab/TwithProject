package com.twith.service;

import com.twith.domain.Criteria;
import com.twith.domain.ReplyDTO;
import com.twith.domain.ReplyPageDTO;

public interface ReplyService {
	boolean regist(ReplyDTO reply);
	ReplyDTO get(Long replynum);
	boolean modify(ReplyDTO reply);
	boolean remove(Long replynum);
	//목록
	ReplyPageDTO getList(Criteria cri, Long boardnum);
}
