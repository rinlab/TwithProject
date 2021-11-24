package com.twith.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//검색의 기준
public class Criteria {
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	private Long shopNum;
	
	private String userId;
	
	public Criteria() {
		//this() : 이 클래스의 생성자
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	//현재 객체가 가지고 있는 pageNum과 amount 등으로 쿼리스트링을 만들어서 리턴하는 메소드
	public String getListLink() {
		//?pageNum=3&amount=10
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.amount);
		return builder.toUriString();
	}
	
	public String[] getTypeArr() {
		//type에 null 이 있다면 return {}
		//type에 "TC" 가 있다면 return {"T","C"}
		return type == null? new String[] {} : type.split("");
	}
}

















