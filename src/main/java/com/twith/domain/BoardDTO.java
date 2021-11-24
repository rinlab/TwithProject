package com.twith.domain;

import lombok.Data;

@Data
public class BoardDTO {
	private Long boardnum;
	private String boardtitle;
	private String boardcontents;
	private String boardwriter;
	private String regDate;
	private String updateDate;
}