package com.twith.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ShopReplyPageDTO {
	private int replyCnt;
	private List<ShopReplyDTO> list;
}
