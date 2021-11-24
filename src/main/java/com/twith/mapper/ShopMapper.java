package com.twith.mapper;

import java.util.List;

import com.twith.domain.Criteria;
import com.twith.domain.ShopDTO;

public interface ShopMapper {
	
	List<ShopDTO> getList();
	List<ShopDTO> getListWithPaging(Criteria cri);
	int getTotal(Criteria cri);
	void insert(ShopDTO shop);
	void insert_with_sno(ShopDTO shop);
	ShopDTO read(Long shopNum);
	
	//게시글이 삭제되었다면 1 이상의 값이 리턴되고
	//없는 게시글이라면 0이 리턴된다.
	int remove(Long shopNum);
	int update(ShopDTO shop);
}
