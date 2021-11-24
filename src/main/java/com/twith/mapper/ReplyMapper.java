package com.twith.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.twith.domain.Criteria;
import com.twith.domain.ReplyDTO;

public interface ReplyMapper {
	int insert(ReplyDTO reply);
	int getTotal(Long boardnum);
	//MyBatis는 두개이상의 데이터를 파라미터로 넘길 때 객체나 Map, @Param을 이용한다.
	//속성값은 MyBatis에서 #{네임} 으로 사용 가능하다.
	List<ReplyDTO> getListWithPaging(@Param("cri") Criteria cri,@Param("boardnum") Long boardnum);
	
}
