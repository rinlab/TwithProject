package com.twith.domain;

import lombok.Data;

@Data
public class ShopDTO {
	private Long shopNum;
	private String userId;
	private String shopTitle;
	private String shopContents;
	private int shopPrice;
	private String shopRegDate;
	private String shopUpdDate;
}
