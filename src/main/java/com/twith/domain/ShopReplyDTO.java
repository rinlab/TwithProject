package com.twith.domain;

import lombok.Data;

@Data
public class ShopReplyDTO {
	private Long sreplyNum;
	private String userId;
	private String sreplyContents;
	private int sreplyPrice;
	private String sreplyRegDate;
	private String sreplyUpdDate;
	private Long shopNum;
}