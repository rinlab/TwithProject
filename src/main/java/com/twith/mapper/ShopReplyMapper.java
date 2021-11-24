package com.twith.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.twith.domain.Criteria;
import com.twith.domain.ShopReplyDTO;

public interface ShopReplyMapper {
	int insert(ShopReplyDTO reply);
	int getTotal(Long shopNum);
	//MyBatis는 두개이상의 데이터를 파라미터로 넘길 때 객체나 Map, @Param을 이용한다.
	//속성값은 MyBatis에서 #{네임} 으로 사용 가능하다.
	List<ShopReplyDTO> getListWithPaging(@Param("cri") Criteria cri,@Param("shopNum") Long shopNum);
	int delete(Long SReplyNum);
	int deleteAll(Long shopNum);
	int update(ShopReplyDTO reply);
	
}
