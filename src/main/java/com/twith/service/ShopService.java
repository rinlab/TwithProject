package com.twith.service;

import java.util.List;

import com.twith.domain.Criteria;
import com.twith.domain.ShopDTO;

public interface ShopService {
	//메소드 설계시 메소드의 이름은 현실적인 이름을 붙여준다.
	public int getTotal(Criteria cri);
	
	public void regist(ShopDTO shop);
	
	public ShopDTO get(Long shopNum);
	
	public boolean modify(ShopDTO shop);
	
	public boolean remove(Long shopNum);
	
	public List<ShopDTO> getList(Criteria cri);
}
