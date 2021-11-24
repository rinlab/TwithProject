package com.twith.domain;

import lombok.Data;

@Data
public class PlaceDTO {
	private int placenum;
	private double placelat;
	private double placelon;
	private String placename;
	private String placeaddr;
	private String placeroadaddr;
	private String placecategory;
	private String placephonenumber;
	private int placecnt;
}
