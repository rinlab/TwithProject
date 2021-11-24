package com.twith.domain;

import lombok.Data;

@Data
public class FollowDTO {
	private int followNum;
	private String userId;
	private String followId;
	private String followDate;
}
