package com.twith.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twith.domain.Criteria;
import com.twith.domain.ShopDTO;
import com.twith.mapper.ShopMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service//서비스 객체임을 표시
public class ShopServiceImpl implements ShopService{
	
	@Setter(onMethod_ = @Autowired)
	private ShopMapper mapper;
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}
	
	@Override
	public void regist(ShopDTO shop) {
		log.info("------regist------");
		mapper.insert_with_sno(shop);
	}

	@Override
	public ShopDTO get(Long shopNum) {
		log.info("------get------");
		return mapper.read(shopNum);
	}

	@Override
	public boolean modify(ShopDTO shop) {
		log.info("------modify------");
		return 0!= mapper.update(shop);
	}

	@Override
	public boolean remove(Long shopNum) {
		log.info("------remove------"+shopNum);
		return 0 != mapper.remove(shopNum);
	}

	@Override
	public List<ShopDTO> getList(Criteria cri) {
		log.info("-------getListWithPaging-------");
		return mapper.getListWithPaging(cri);
	}
	
}






